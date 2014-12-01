<%	session.invalidate(); %>
<html>
    <head>
    <title>Failure</title>    
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


<table cellpadding="20" align="center">
  <tr>
    <td>
    	OOPS !! Something went wrong, Please Login again !!
    </td>
   </tr>
   <tr>
    <td align="center">
    	<a href="login.jsp"> Login !! </a>
    </td>
   </tr>
</table>


</body>
</html>