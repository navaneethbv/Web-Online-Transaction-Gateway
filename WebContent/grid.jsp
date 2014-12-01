<%@ include file="JSP/gridCode.jsp" %>
<%@page import="controller.*"%> 
<html>
<head>
<META HTTP-EQUIV="refresh" CONTENT="<%= session.getMaxInactiveInterval() %>; URL=sessiontimeout.jsp" />
<title>GRID Authentication</title>
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
<%@ include file="JSP/header.jsp"%> 
        <strong style="color:grey;font-style: italic;">1. Payment type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>  
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 2. Enter Card Details  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:green;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 3. Verify Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 4. Confirmation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 5. Thank You   </strong>
 <hr>

<br>
<h2 align="center">Please enter the valid GRID values:</h2> 
<br></br>
<form action="" method="post">
<table cellpadding="25" width="200" align="center" >
<tr>
<td>GRID Keys</td>
<%

int no1,no2,no3;
String randstr1,randstr2,randstr3;

RandomNumberGenerator rg= new RandomNumberGenerator();
rg.printNumbers();
no1=rg.getnum1();
no2=rg.getnum2();
no3=rg.getnum3();

Grid g = new Grid();
randstr1 = g.getGridString(no1+1);
randstr2 = g.getGridString(no2+1);
randstr3 = g.getGridString(no3+1);

session.setAttribute("currStr1",randstr1);
session.setAttribute("currStr2",randstr2);
session.setAttribute("currStr3",randstr3);
%>
<td><%=randstr1%></td>
<td><%=randstr2%></td>
<td><%=randstr3%></td>

</tr>

<tr>
<td>GRID values</td>
<td><input type="text" maxlength="2" name="first" id="first" required/></td>
<td><input type="text" maxlength="2" name="second" id="second" required/></td>
<td><input type="text" maxlength="2" name="third" id="third" required/></td>
</tr>
</table>
<br><br>
<span style="color:red;font-weight:bold" ></span> 
<br></br>
<div style="text-align:center">
    <input type="submit" value="Confirm Payment" name="btnSubmit"/>
</div>
</form>
</body>
</html>
