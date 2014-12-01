
	<% 
	  
      try {
            if(session.getAttribute("currUser").toString().equals(null)){
                response.sendRedirect("login.jsp");
                   }
                   }
        catch (NullPointerException ne) {
           
                        
      }
      
      %>

<!--  get user values for the session -->
   		
   		<form>
   		<p align="right">
   		<% 
   		try {
   			
   		if(session.getAttribute("currUser")==null){ %>
      		<a href="login.jsp">Login</a> 
		<% } else { %>

        Welcome,&nbsp;&nbsp;&nbsp;<%= session.getAttribute("currUser") %>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
         <input type="submit" name="logout" value = "logout"/>
         </p>
         </form>
      	<% }
   		} catch(Exception e)
        {
  
   				}
   		%>
      	<hr>
      	<!--  get user values for the session -->
      	
      	<!--  kill all the sessions -->
      	 <%
		
 			if(request.getParameter("logout") != null) {
				
 				/* session.getAttribute("currUser");
 				session.getAttribute("payMethod");
 				session.getAttribute("currCard");
 				session.getAttribute("currNo1");
 	        	session.getAttribute("currNo2");
 	        	session.getAttribute("currNo3");
 	        	session.getAttribute("currStr1");
 	        	session.getAttribute("currStr2");
 	        	session.getAttribute("currStr3");
 	        	
 	        	session.getAttribute("otpStr"); */
 	        	
 	        	// all the sessions gets invalidated upon logout
 	        	session.invalidate();
 	        	response.sendRedirect("logout.jsp");
 				
			
 			}
		%>
      	
      
      	
   