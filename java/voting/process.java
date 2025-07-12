package voting;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class process
 * @param <RequestDispacther>
 */
@WebServlet("/process")
public class process<RequestDispacther> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public process() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
        HttpSession session=request.getSession();  
        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		Connection con =DataCon.getConnection();
		    try {
				PreparedStatement pstmt = con.prepareStatement("UPDATE voters SET status=? WHERE AadharNo=?;");
			     pstmt.setString(1,"voted");
			     pstmt.setString(2,(String)session.getAttribute("uAN"));
                int rowset = pstmt.executeUpdate();
		        session.setAttribute("status","voted");

                if(rowset > 0 ) {
                String party1=(String)request.getParameter("vote") ;
                PreparedStatement pstmt1 = con.prepareStatement("UPDATE party SET vote = vote+? where name=?;");
                pstmt1.setInt(1,1);
                pstmt1.setString(2,party1);
                pstmt1.executeUpdate();
                String n ="recent";
                session.setAttribute("msg",n);
                rd.forward(request, response);
                
                }
                	
				
	}catch(Exception e) {
	e.printStackTrace();	
	}finally {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DataCon.close();
	}
	}

}
