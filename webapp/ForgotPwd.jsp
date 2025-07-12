<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<!-- CSS Styling -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        text-align: center;
        color: #333;
    }
    label {
        font-size: 16px;
        margin-bottom: 5px;
        display: block;
    }
    input[type="email"], input[type="text"] {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
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
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <form method="post" action="./ForgetPwd" onsubmit="return validateForm()">
            <label>Email</label>
            <input type="email" name="Email" required>
            
            <label>Adhaar Card</label>
            <input type="text" name="Uan" id="aadhaar" maxlength="12" required>
            
            <input type="submit" value="Submit">
        </form>

        <div class="message">
            <%
                String msg = "";
                String status = (String) session.getAttribute("ForgotPasswordStatus");
                if (status != null && status.equals("false")) {
                    msg = "Please enter a valid email or Aadhaar number";
                }
            %>
            <%= msg %>
        </div>
    </div>

    <!-- JavaScript to validate Aadhaar input length -->
    <script>
        function validateForm() {
            var aadhaar = document.getElementById("aadhaar").value;
            if (aadhaar.length !== 12) {
                alert("Aadhaar number must be 12 digits.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
