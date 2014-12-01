
<html>
    <head>
    <title>Logout</title>    
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
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 3. Verify Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 4. Confirmation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:green;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 5. Thank You   </strong>
 <hr>

<br>
<h2 align="center">Logged out</h2> 
<table cellpadding="100" align="center">
  <tr>
    <th>
    	You have been successfully logged out !!
    </th>
   </tr>
</table>
<div align="center"><a href="login.jsp">Go to Login page</a> </div>
</body>
</html>