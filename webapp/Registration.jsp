<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>

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
<h1>Registration Form</h1>
<input type="hidden" id="status" value="<%=session.getAttribute("status")%>">

<div class="form-container">
    <form method="post" action="./Registration" onsubmit="return validatePassword() && validateAadhaar()">
        <label for="uname">Name</label>
        <input type="text" name="uname" id="uname" required>
        
        <label for="uemail">Email</label>
        <input type="email" name="uemail" id="uemail" required>
        
        <label for="aadhaar">Aadhar Number</label>
        <input type="text" name="uAN" id="aadhaar" maxlength="12" placeholder="Enter 12 digit Aadhaar" required>
        
        <label for="myInput">Password</label>
        <input type="password" name="Password" id="myInput" required>
        
        <div class="password-toggle-container">
            <input type="checkbox" class="password-toggle" onclick="myFunction()">
            <label for="myInput">Show Password</label>
        </div>
        
        <label for="repeatPassword">Repeat Password</label>
        <input type="password" name="RePassword" id="repeatPassword" required>
        
        <label for="gender">Gender</label>
        <select name="gender" id="gender" required>
            <option value="">Select Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Others">Others</option>
        </select>
        
        <input type="submit" value="Submit">
        
        <div class="link">
            <label>Already registered? <a href="login.jsp">Click Here</a></label>
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

function validatePassword() {
    var password = document.getElementById("myInput").value;
    var repeatPassword = document.getElementById("repeatPassword").value;

    if (password !== repeatPassword) {
        alert("Passwords do not match!");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
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
    alert("User Already Exists.");
}
</script>
<%session.invalidate(); %>

</body>
</html>
