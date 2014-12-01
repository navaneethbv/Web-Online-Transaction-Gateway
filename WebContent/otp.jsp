<%@ include file="JSP/otpCode.jsp" %>
<%@page import="controller.*"%> 
<html>
<head>
<META HTTP-EQUIV="refresh" CONTENT="<%= session.getMaxInactiveInterval() %>; URL=sessiontimeout.jsp" />
<title>OTP Authentication</title>
<script type="text/javascript">
       
        window.history.forward(); 
        function noBack() { 
        	window.history.forward(); 
        	}
</script>
 <style type="text/css">
		body {
				color:white;
				background-image: url("icons/Grey.jpg");
				border:1px grey solid;
				margin:20px; padding:20px;
			}
		</style>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
		<%@include file="JSP/header.jsp" %>
        <strong style="color:grey;font-style: italic;">1. Payment type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>  
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 2. Enter Card Details  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:green;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 3. Verify Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 4. Confirmation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 5. Thank You   </strong>
 <hr>

<br>
<h3 align="center">Please enter the valid OTP values:</h3> 
<br></br>

<%
BankServer server = new BankServer();
String otp  = server.getOTP((String)session.getAttribute("currUser"));
session.removeAttribute("otpStr");
session.setAttribute("otpStr",otp);
%>

<form action="" method="post">
<table cellpadding="20" width="" align="center" >
<tr>
<td><img src="icons/mail.png" width=80 height="60"></td>
<td> The OTP has been sent to the mail that is registered with us. <br>
If you did not receive the OTP mail yet, please <a href="otp.jsp" >click here</a> <br><br>
<label>Enter OTP :    </label><input type="password" maxlength="6" name="otp" id="otp" required/></td>
</tr>
<tr>
<td></td>
<td><div align="center" style="color:red;font-weight:bold" id="errMessage"><%=errMessage %></div></td>
</tr>

</table>
<br><br>

<br></br>
<div style="text-align:center">
    <input type="submit" value="Confirm OTP" name="btnSubmit"/>
</div>
</form>
</body>
</html>
