package voting;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataCon {
	public static Connection con = null;
public static Connection getConnection() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	     con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ElectionPortal?allowPublicKeyRetrieval=true&useSSL=false&user=root&password=1234");
         

	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return con;
}
public static void close() {
	if(con!=null) {
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
}
