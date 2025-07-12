<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
      }

      nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 90px;
        background-color: rgb(255, 165, 0);
        padding: 0 40px;
      }

      nav ul {
        display: flex;
        justify-content: center;
      }

      nav ul li {
        list-style: none;
        margin: 0 20px;
      }

      nav ul li a {
        text-decoration: none;
        color: white;
        font-size: 1.1rem;
      }

      nav ul li a:hover {
        color: rgb(144, 238, 144);
        font-size: 1.2rem;
      }

      .left {
        font-size: 1.8rem;
        font-weight: 600;
        color: white;
      }

</style>
</head>
<body>
 <header>
      <nav>
        <div class="left">
          Welcome <%=session.getAttribute("uname")%>
        </div>
        <div class="right">
          <ul>
            <li><a href="profile.jsp">Profile</a></li>
            <li><a href="home.jsp">Vote</a></li>
            <li><a href="Result.jsp">Result</a></li>
            <li><a href="#">About me</a></li>
            <li><a href="logout">Logout</a></li>
          </ul>
        </div>
      </nav>
    </header>

</body>
</html>