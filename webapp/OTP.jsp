<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enter OTP</title>

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
        margin: 100px auto;
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
    input[type="text"] {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
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
        <h2>Enter OTP</h2>
        <form method="post" action="./Otps">
            <label>Enter OTP</label>
            <input type="text" name="OTP" required>
            
            <input type="submit" value="Submit">
        </form>

        <div class="message">
            <%
                String msg = "";
                String status = (String) session.getAttribute("OTPW");
                if (status != null && status.equals("false")) {
                    msg = "Wrong OTP. Please enter a valid OTP.";
                }
            %>
            <%= msg %>
        </div>
    </div>
</body>
</html>
