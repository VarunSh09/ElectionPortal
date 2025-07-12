<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="voting.DataCon" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>
     
      main {
        padding: 40px;
        background-color: #ffffff;
        margin: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        max-width: 800px;
        margin-left: auto;
        margin-right: auto;
      }

      .profile-info {
        display: flex;
        flex-direction: column;
        gap: 15px;
      }

      .profile-info span {
        font-weight: bold;
        color: rgb(18, 18, 62);
      }

      .profile-info .value {
        color: #333;
        font-size: 1.1rem;
      }

      .profile-info img {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        margin-bottom: 20px;
      }

     

      @media screen and (max-width: 768px) {
        main {
          padding: 20px;
        }

        .profile-info {
          align-items: center;
        }
      }
    </style>
  </head>

  <body>
    <% 
      // Ensure the session has a valid user
      if(session.getAttribute("uname") == null) {
        response.sendRedirect("login.jsp");
        return;
      }

      // Establish connection and fetch user profile info
      String name = null;
      String Aadharno = null;
      String Emailid = null;
      String Gender = null;
      String Status = null;
      String img = null;
      Connection connection = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
String Adhaarno = (String)session.getAttribute("uAN");
      try { 
        connection = DataCon.getConnection();
        String sql = "SELECT * FROM voters WHERE Aadharno = ?";
        ps = connection.prepareStatement(sql);
        ps.setString(1, Adhaarno);  // Use parameterized queries to prevent SQL injection
        rs = ps.executeQuery();

        if (rs.next()) {
          name = rs.getString("name");
          Aadharno = rs.getString("Aadharno");
          Emailid = rs.getString("Email");
          Gender = rs.getString("Gender");
          Status = rs.getString("Status");
          
        }
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        try {
          if (rs != null) rs.close();
          if (ps != null) ps.close();
          if (connection != null) connection.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
      if(Gender.equals("Male")){
    	  img = "pro.png";
      }else{
    	  img="pro2.png";
      }
    %>

   <jsp:include page="Header.jsp"></jsp:include>
    <main >
      <div class="profile-info" >
        <div><img src=<%=img %> alt="Profile Image"></div>
        <div>
          <span>UserName:</span>
          <span class="value"><%=name%></span>
        </div>
        <div>
          <span>AadharNo:</span>
          <span class="value"><%=Aadharno%></span>
        </div>
        <div>
          <span>Email id:</span>
          <span class="value"><%=Emailid%></span>
        </div>
        <div>
          <span>Gender:</span>
          <span class="value"><%=Gender%></span>
        </div>
        <div>
          <span>Status:</span>
          <span class="value"><%=Status%></span>
        </div>
      </div>
    </main>
<jsp:include page="Footer.jsp"></jsp:include>
  </body>
</html>
