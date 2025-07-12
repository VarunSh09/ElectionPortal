<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Password</title>

<!-- CSS Styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 40%;
        margin: 50px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }
    h2 {
        text-align: center;
        color: #333;
    }
    label {
        font-size: 16px;
        margin-bottom: 5px;
        display: block;
        color: #333;
    }
    input[type="password"] {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    input[type="checkbox"] {
        margin-top: 10px;
    }
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .message {
        text-align: center;
        color: red;
        font-size: 14px;
        margin-top: 10px;
    }
</style>

</head>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

response.setHeader("Pragma", "no-cache");

response.setHeader("Expires", "0");
 if(session.getAttribute("Name")==null){
    response.sendRedirect("login.jsp");
} %>
<body>
    <div class="container">
        <h2>Update Password</h2>
        <form method="post" action="./UpdatePass" onsubmit="return validatePasswords()">
            <label for="myInput">Password</label>
            <input type="password" name="Pwd" id="myInput" required>

            <input type="checkbox" class="password-toggle" onclick="togglePassword()"> 
            <label for="myInput">Show Password</label>
            <br><br>

            <label for="repeatPassword">Confirm Password</label>
            <input type="password" name="RePwd" id="repeatPassword" required>
            <br><br>

            <input type="submit" value="Submit">
        </form>
    </div>

    <!-- JavaScript for Show Password and Confirm Password Validation -->
    <script>
        // Toggle password visibility
        function togglePassword() {
            var password = document.getElementById("myInput");
            var confirmPassword = document.getElementById("repeatPassword");
            if (password.type === "password" && confirmPassword.type === "password") {
                password.type = "text";
                confirmPassword.type = "text";
            } else {
                password.type = "password";
                confirmPassword.type = "password";
            }
        }

        // Validate if password and confirm password match
        function validatePasswords() {
            var password = document.getElementById("myInput").value;
            var confirmPassword = document.getElementById("repeatPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match. Please try again.");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>
