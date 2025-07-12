<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-top: 50px;
    }

    .form-container {
        width: 40%;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        font-size: 16px;
        margin-bottom: 8px;
        color: #333;
    }

    input, select {
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    input[type="checkbox"] {
        width: auto;
        margin-right: 5px;
        vertical-align: middle;
    }

    .password-toggle-container {
        display: flex;
        align-items: center;
        margin-top: -5px;
    }

    .password-toggle-container label {
        font-size: 14px;
        color: #333;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .link {
        text-align: center;
        margin-top: 10px;
    }

    .link a {
        color: #4CAF50;
        text-decoration: none;
    }

    .link a:hover {
        text-decoration: underline;
    }
</style>

</head>
<body>

<h1>Login</h1>
<input type="hidden" id="status" value="<%=session.getAttribute("status1")%>">

<div class="form-container">
    <form method="post" action="./login" onsubmit="return validateAadhaar()">
        <label for="aadhaar">Aadhar Number</label>
        <input type="text" name="uAN" id="aadhaar" maxlength="12" required placeholder="Enter your Aadhar Number">
        
        <label for="uemail">Email</label>
        <input type="email" name="uemail" id="uemail" required placeholder="Enter your Email">
        
        <label for="myInput">Password</label>
        <input type="password" name="password" id="myInput" required placeholder="Enter your Password">
        
        <div class="password-toggle-container">
            <input type="checkbox" class="password-toggle" onclick="myFunction()">
            <label for="myInput">Show Password</label>
        </div>
        
        <input type="submit" value="Login">
        
        <div class="link">
            <label>Not registered? <a href="Registration.jsp">Click Here</a></label>
        </div>
        
        <div class="link">
            <label>Forgot Password? <a href="ForgotPwd.jsp">Click Here</a></label>
        </div>
    </form>
</div>

<script>
function myFunction() {
    var x = document.getElementById("myInput");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function validateAadhaar() {
    var aadhaar = document.getElementById("aadhaar").value;

    // Check if Aadhaar has exactly 12 digits
    if (aadhaar.length !== 12 || isNaN(aadhaar)) {
        alert("Aadhaar number must be exactly 12 digits.");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}

var status = document.getElementById("status").value;
if(status == "failed") {
    alert("User not Exists.");
}
</script>

</body>
</html>
