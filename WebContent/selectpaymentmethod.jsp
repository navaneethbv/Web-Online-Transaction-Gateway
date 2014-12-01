
<%@include file="JSP/selectpaymentmethodCode.jsp" %>

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <META HTTP-EQUIV="refresh" CONTENT="<%= session.getMaxInactiveInterval() %>; URL=sessiontimeout.jsp" />
        <title>Select Payment Method</title>
        
        <script type="text/javascript">
            <%@include  file="Javascript\selectpaymentmethodJS.js" %>
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
   	<body>
   	
   		<%@include file="JSP/header.jsp" %>
        
	    <strong>Pay my bill  </Strong> |  <a href="#"> Return to Bill summary</a><br><br>
        <hr>
        <strong style="color:green;font-style: italic;">1. Payment type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>  
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 2. Enter Card Details  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 3. Verify Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 4. Confirmation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong style="color:grey;font-style: italic;">|&nbsp;&nbsp;&nbsp;&nbsp; 5. Thank You   </strong>
        <hr>
        <h2>Step 1 : Select Your Payment Method</h2>
        <span>From here you can make a one-time payment, set up recurring payments, or update your existing recurring method of payment. Select the method of payment that best fits your needs.</span>
        <br><br>   
        <form action="" method="post">
           <div>
           <i>Method of Payment* : </i>
           <select id="paymenttype" name="paymenttype">
           	 	<option value="1">Select-------------------</option>
           	 	<option value="3">Credit card or Debit card - Using CARD Authentication</option>
           	 	<option value="2">Credit card or Debit card - Using GRID Authentication</option>
           </select>
           </div>
           <hr>
           <span align="right" id="errMethod" style="color:orange;font-style:italic"><%=errMethod %></span> <br><br>
           <div align="right"><a href="billsummary.jsp"> Cancel </a>&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="submit" value="Continue" id="btnSubmit" name="btnSubmit"/></div>
        </form>
        <script type="text/javascript">
			window.onload=pageLoad;
		</script>
	</body>
</html>

          
