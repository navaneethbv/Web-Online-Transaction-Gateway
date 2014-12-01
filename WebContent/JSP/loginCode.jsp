
<%@page import="data.*" %>
<%@page import="controller.*"%> 

<%
	String errUserid="",errPassword="",errMessage="";
   try
    {
        if( request.getParameter("btnSubmit") != null ) {
          boolean validData = true;
          String userID, password;
          userID = request.getParameter("txtUserId");
          password = request.getParameter("txtPassword");
          if( userID == "" ) {
            errUserid = "Please enter UserID!";
            validData = false;
          }
          if( password == "" ) {
            errPassword = "Please enter password!";
            validData = false;
          }
          if( validData ) {
            
        	BankServer lc = new BankServer();
            if( lc.isValidLogin(userID, password) ) {
                  
				String status = lc.getActiveStatus(userID);
                if(status.equals("Y")){
                	
                	UserLoginInformation user = new UserLoginInformation();
                	user.setUserID(userID);
                	user.setActive("Y");
                	
                    session.setAttribute("currUser", userID);                    
                    response.sendRedirect("billsummary.jsp");
                    
                }  
                if(status.equals("N")){
                	errMessage = "Sorry, You aren't an active user!!";
                 } 
            } else{
                errMessage = "Invalid Login Credentials!!";
             }
          }
       }
    }
            
   catch(Exception e)
           {
	   response.sendRedirect("failure.jsp");
   }
%>
