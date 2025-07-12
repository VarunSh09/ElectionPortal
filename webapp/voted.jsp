<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache");

String message = "You already Voted.";
response.setHeader("Expires", "0");
if(session.getAttribute("uname")==null){
    response.sendRedirect("login.jsp");
}
else if(session.getAttribute("msg")=="recent"){
	message="Thanks for Voting.";
 }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vote</title>

    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
      }

     

      .container {
        margin: 20px;
        padding: 20px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
      }

      table th, table td {
        padding: 15px;
        text-align: center;
        border: 1px solid #ddd;
      }

      table th {
        background-color: rgb(18, 18, 62);
        color: white;
      }

      table td img {
        width: 50px;
        height: 50px;
        border-radius: 5px;
      }

      input[type="submit"] {
        background-color: rgb(18, 18, 62);
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        font-size: 1rem;
        border-radius: 5px;
      }

      input[type="submit"]:hover {
        background-color: rgb(153, 153, 226);
      }

      

      @media screen and (max-width: 768px) {
        nav {
          flex-direction: column;
          align-items: flex-start;
        }

        nav ul {
          flex-direction: column;
          padding-left: 0;
        }

        nav ul li {
          margin: 5px 0;
        }

        table th, table td {
          padding: 10px;
        }

        input[type="submit"] {
          padding: 8px 16px;
          font-size: 0.9rem;
        }
      }
    </style>
</head>

<body>

      <jsp:include page="Header.jsp"></jsp:include>
   

    <div class="container">
        <h2><%out.println(message); %></h2>

        <form method="post" action="./process" class="vote-options">
          <table>
            <tr>
              <th>Election Symbol</th>
              <th>Party</th>
              <th>Candidate Name</th>
            </tr>
            <tr>
              <td><img src="BJP.jpg" alt="BJP Logo"></td>
              <td>BJP</td>
              <td>Salman Khan</td>
            </tr>
            <tr>
              <td><img src="TMC.png" alt="TMC Logo"></td>
              <td>TMC</td>
              <td>Saif Ali Khan</td>
            </tr>
            <tr>
              <td><img src="AAP.jpeg" alt="AAP Logo"></td>
              <td>AAP</td>
              <td>Amir Khan</td>
            </tr>
            <tr>
              <td><img src="SAD.jpeg" alt="SAD Logo"></td>
              <td>SAD</td>
              <td>Shahrukh Khan</td>
            </tr>
            <tr>
              <td><img src="congress.jpeg" alt="Congress Logo"></td>
              <td>Congress</td>
              <td>Akshay Kapoor</td>
            </tr>
          </table>
        </form>
    </div>
   <jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>
