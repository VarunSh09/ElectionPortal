package voting;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.Session;

import voting.DataCon;
import voting .Mail;
/**
 * Servlet implementation class UpdatePass
 */
@WebServlet("/UpdatePass")
public class UpdatePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePass() {
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
		HttpSession session = request.getSession();
		String Password =  request.getParameter("Pwd");
		String email = (String)session.getAttribute("Femail");
		String name = (String)session.getAttribute("Name");
		Connection con = DataCon.getConnection();

        try {
	           PreparedStatement ps = con.prepareStatement("update voters set Password=? where email=?");
	           ps.setString(1, Password);
	           ps.setString(2,email);
	            ps.executeUpdate();
	          
	        	   response.sendRedirect("login.jsp");
	        	   Mail.mail(email,"PasswordUpdate","Hello "+name+" your Password is updated.");
	           
            }catch(Exception e) {
            	e.printStackTrace();
            }
		
		
	}

}
