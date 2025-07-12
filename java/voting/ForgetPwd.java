package voting;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.Session;

import voting.DataCon;
import voting .Mail;
import voting.OTPGenerate;
/**
 * Servlet implementation class ForgetPwd
 */
@WebServlet("/ForgetPwd")
public class ForgetPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPwd() {
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
		String email;
		String Adhaar;
		email=request.getParameter("Email");
		Adhaar=request.getParameter("Uan");
		String otp = OTPGenerate.otp();
		String message = "Your generated OTP is "+otp;
		Connection con = DataCon.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from voters where email=? and AadharNo=?");
			ps.setString(1, email);
			ps.setString(2, Adhaar);
			ResultSet rs  = ps.executeQuery();
			
			if(rs.next()) {
				Mail.mail(email,"Generated OTP",message);
				response.sendRedirect("OTP.jsp");
				session.setAttribute("OTPs",otp);
				session.setAttribute("Femail", email);
				session.setAttribute("Name", rs.getString("name"));

			}
			else {
				response.sendRedirect("ForgotPwd.jsp");
				session.setAttribute("ForgotPasswordStatus","false");
                
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}

}
