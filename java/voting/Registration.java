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
import voting.Mail;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String Aadharno = request.getParameter("uAN");
		String Password = request.getParameter("Password");
		String Gender = request.getParameter("gender");
		String subject = "Welcome to Election Portal";
		String Text = "Hello "+name+".You are Successfully Registered to Election Portal";
		// TODO Auto-generated method stub
		   HttpSession session=request.getSession();  

		doGet(request, response);
	    Connection con =	DataCon.getConnection();
	    try {PreparedStatement pstmt1 = con.prepareStatement("Select * from voters where AadharNo=? OR email=? ");
		pstmt1.setString(1,Aadharno);
	    pstmt1.setString(2,email);
	    	ResultSet rs = pstmt1.executeQuery();
	    	if(rs.next()) {
	    		session.setAttribute("status","failed");
	    		response.sendRedirect("Registration.jsp");
	    	}else{
			PreparedStatement pstmt = con.prepareStatement("insert into voters(name,email,Aadharno,Password,Gender)values(?,?,?,?,?)");
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, Aadharno);
			pstmt.setString(4, Password);
			pstmt.setString(5, Gender);
			int rowset = pstmt.executeUpdate();
			if(rowset>0) {
				Mail.mail(email,subject,Text);
				response.sendRedirect("login.jsp");
				
			}
			else {
				response.sendRedirect("Registration.jsp");
			}}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	
	}

}
