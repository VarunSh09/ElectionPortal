package voting;

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

import com.mysql.cj.Session;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		doGet(request, response);

		// TODO Auto-generated method stub
		String Aadharno = request.getParameter("uAN");
		String email = request.getParameter("uemail");
		String Password = request.getParameter("password");
		 Connection con =DataCon.getConnection();
		   HttpSession session=request.getSession();  
		   
		   String EncPassword = PasswordEncryption.generatedENC_Password(Password);
		   
		    try {
				PreparedStatement pstmt = con.prepareStatement("Select * from voters where AadharNo=? and email=? and Password=?");
				
                   	pstmt.setString(1,Aadharno);
                   	pstmt.setString(2,email);
                   	pstmt.setString(3, EncPassword);
                   	ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
			        session.setAttribute("uname",rs.getString("name"));  
			        session.setAttribute("status",rs.getString("status"));
			        session.setAttribute("uAN",rs.getString("AadharNo"));

					response.sendRedirect("home.jsp");
					
				}
				else {
					session.setAttribute("status1","failed");
					response.sendRedirect("login.jsp");
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
		    }}

	
