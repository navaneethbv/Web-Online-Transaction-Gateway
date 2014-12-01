
<%@page import="data.*" %>
<%@page import="controller.*"%> 

<%
	int first, second,third;
	String errMessage="";
   try
    {
        if( request.getParameter("btnSubmit") != null ) {
          boolean validData = true;
          
          first = Integer.parseInt(request.getParameter("firstdigit"));
          second = Integer.parseInt(request.getParameter("seconddigit"));
          third = Integer.parseInt(request.getParameter("thirddigit"));
          
          if( first < 0) {
        	  errMessage = "Please enter card value!";
            validData = false;
          }
          if( second < 0 ) { 
        	  errMessage = "Please enter card value!";
            validData = false;
          }
          if( third < 0 ) {
        	  errMessage = "Please enter card value!";
            validData = false;
          }
          if( validData ) {
            
        	BankServer bs = new BankServer();
        	String cardnumber = session.getAttribute("currCard").toString();
        	int randnum1 = Integer.parseInt(session.getAttribute("currNo1").toString());
        	int randnum2 = Integer.parseInt(session.getAttribute("currNo2").toString());
        	int randnum3 = Integer.parseInt(session.getAttribute("currNo3").toString());
        	
            if( bs.isValidCardValues(cardnumber, randnum1, randnum2, randnum3, first, second, third) ) { 
             	
                    response.sendRedirect("otp.jsp");
                }  
                
            } else{
                errMessage = "Invalid Card Values !!";
             }
          }
       
    }
            
   catch(Exception e)
           {
	   response.sendRedirect("failure.jsp");
       
   }
%>
