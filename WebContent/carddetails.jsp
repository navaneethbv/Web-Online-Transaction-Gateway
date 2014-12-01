<%@ include file="JSP/carddetailsCode.jsp" %>
<html>
<head>
<META HTTP-EQUIV="refresh" CONTENT="<%= session.getMaxInactiveInterval() %>; URL=sessiontimeout.jsp" />
<title>Enter Card Details</title>
<script type="text/javascript">
        <%@include  file="Javascript/carddetailsJS.js" %>
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
<%@ include file="JSP/header.jsp" %>  

        <strong style="color:grey;font-style: italic;">1. Payment type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>  
        <strong style="color:green;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 2. Enter Card Details  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 3. Verify Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 4. Confirmation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 5. Thank You   </strong>
 <hr>
 <h2>Step 2 : Enter the Card Details  </h2> 
 
 <br>
 <br>
 <form action="" method="post">
 <p align="right"><strong>Payment Amount : $ 500.00</strong></p><br>
 <br>
 <span id="errMessage" style="color:red; font-weight:bold"><%=errMessage %></span><br>
 <table>
 <tr>
 <td>Card Type </td> 
 <td><input type="radio" value="Credit card" name="cardtype" id="cardctype"/>Credit Card 
 <input type="radio" value="Debit card" name="cardtype" id="carddtype" />Debit Card</td>
 </tr>
 
 <tr>
 <td>Name on Card </td>
 <td><input type="text" value="" name="cardname" id="cardname" required/></td>
 
 </tr>
 
 <tr>
 <td>Card Number </td>
 <td><input type="text" value="" name="cardnumber" id="cardnumber" maxlength="16" required/></td>
 </tr>
 
 <tr>
 <td>CVV </td>
 <td><input type="password" value="" name="cvv" id="cvv" maxlength="3" required/></td>
 </tr>
 
 <tr>
 <td>Expiration Date </td>
 <td>
 <select name="expirationmonth" >
 	<option value="1">1</option>
 	<option value="2">2</option>
 	<option value="3">3</option>
 	<option value="4">4</option>
 	<option value="5">5</option>
 	<option value="6">6</option>
 	<option value="7">7</option>
 	<option value="8">8</option>
 	<option value="9">9</option>
 	<option value="10">10</option>
 	<option value="11">11</option>
 	<option value="12">12</option>
 </select>	
 <select name="expirationyear">
 	<option value="2014">2014</option>
 	<option value="2015">2015</option>
 	<option value="2016">2016</option>
 	<option value="2017">2017</option>
 	<option value="2018">2018</option>
 	<option value="2019">2019</option>
 	<option value="2020">2020</option>
 	<option value="2021">2021</option>
 	<option value="2022">2022</option>
 	<option value="2023">2023</option>
 	<option value="2024">2024</option>
 	<option value="2025">2025</option>
 	<option value="2026">2026</option>
 	<option value="2027">2027</option>
 	<option value="2028">2028</option>
 	<option value="2029">2029</option>
 	<option value="2030">2030</option>
 	<option value="2031">2031</option>
 	<option value="2032">2032</option>
 	<option value="2033">2033</option>
 	<option value="2034">2034</option>
 </select>	
 </td>
 </tr>
 
 <tr>
 <td></td>
 <td></td>
 </tr>
 
 
 <tr>
 <td>Transaction Password </td>
 <td><input type="password" value="" name="transactionpassword" id="transactionpassword" required/></td>
 </tr>
 
 <tr>
 <td></td>
 <td><div align="right"><a href="selectpaymentmethod.jsp"> Cancel </a>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Continue" name="btnSubmit" onclick="return validateForm()"/></div></td>
 </tr>
  
 </table>
 </form>
</body>
</html>