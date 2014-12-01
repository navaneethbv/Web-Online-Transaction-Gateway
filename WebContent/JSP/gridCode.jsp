
<%@page import="data.*" %>
<%@page import="controller.*"%> 

<%
	int first, second,third;
	String errMessage="";
   try
    {
        if( request.getParameter("btnSubmit") != null ) {
          boolean validData = true;
          
          first = Integer.parseInt(request.getParameter("first"));
          second = Integer.parseInt(request.getParameter("second"));
          third = Integer.parseInt(request.getParameter("third"));
          
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
        	String randstr1 = session.getAttribute("currStr1").toString();
        	String randstr2 = session.getAttribute("currStr2").toString();
        	String randstr3 = session.getAttribute("currStr3").toString();
        	
            if( bs.isValidGridValues(cardnumber, randstr1, randstr2, randstr3, first, second, third) ) { 
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
