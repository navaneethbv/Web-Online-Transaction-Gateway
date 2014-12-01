
<%@page import="data.*" %>
<%@page import="controller.*"%> 

<%
	String otpEntered;
	String errMessage="";
   try
    {
        if( request.getParameter("btnSubmit") != null ) {
          boolean validOTP = false;
          
          otpEntered = request.getParameter("otp");
         
          
          if( otpEntered != null) {
        	  errMessage = "Please enter  OTP!";
              validOTP = true;
          }
          
          
          if( validOTP ) {
        	String otp = (String)session.getAttribute("otpStr");
            if( otp.equals(otpEntered)) { 
                    response.sendRedirect("success.jsp");
                }  
                
            } else{
            	
                errMessage = "Invalid OTP  !!";
                response.sendRedirect("otp.jsp"); 
            }
          }
       
    }
            
   catch(Exception e)
           {
	   response.sendRedirect("failure.jsp");
   }
%>
