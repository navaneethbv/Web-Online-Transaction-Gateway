<%@ page import="controller.*" %> 

<%
   
      String errMethod = "";
	  boolean validmode = false;
      try {
    	  if (request.getParameter("btnSubmit") != null ) {
  
			  String option;
    		  
    		  option = request.getParameter("paymenttype");
    		 
    		  if( option.equals("1") ) {
    	            errMethod = "* Please select a payment method ";
    	            validmode = false;
    	      }
    		  if( option.equals("2") ) {
  	            errMethod = " ";
  	            
  	            session.removeAttribute("payMethod");
  	            session.setAttribute("payMethod", "2");
  	            validmode = true;
  	      		}
    		  if( option.equals("3") ) {
  	            errMethod = " ";
  	            
  	            session.removeAttribute("payMethod");
  	            session.setAttribute("payMethod", "3");
  	            validmode = true;
  	      		}
    	  }
    	  if(validmode) {
    		  response.sendRedirect("termsconditions.jsp");
    	  }
    	  else {
    		  errMethod = "* Please select a payment method ";
    	  }
      }
      catch(Exception e)
      {
    	 
		}
%>
      
      