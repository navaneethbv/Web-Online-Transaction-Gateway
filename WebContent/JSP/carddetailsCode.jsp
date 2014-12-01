<%@page import="data.*" %>
<%@page import="controller.*"%> 

<%

String errMessage="";

try
{
	
	if(request.getParameter("btnSubmit") != null)
	{
		 boolean validData = true;
         String cardtype = "", cardname, cardnumber, transactionpassword;
         int  expmonth, expyear, cvv;
         
         cardnumber = request.getParameter("cardnumber");
         cardname = request.getParameter("cardname");
         transactionpassword = request.getParameter("transactionpassword");
         
         cvv = Integer.parseInt(request.getParameter("cvv"));
         expmonth = Integer.parseInt(request.getParameter("expirationmonth"));
         expyear = Integer.parseInt(request.getParameter("expirationyear"));
         
         
         if(request.getParameter("cardtype") != null ) {
          	if(request.getParameter("cardtype").equals("Credit card")) {
         		 cardtype = "C";
         	 }
          	if(request.getParameter("cardtype").equals("Debit card")) {
     			 cardtype = "D";
     		 }
 		 } 
 		else {
         	 errMessage = "Please enter card details!";
              validData = false;
            }
         
         
         if( cardnumber == null ) {
           errMessage = "Please enter card details ";
           validData = false;
         }
         
         if( cvv < 0 ) {
             errMessage = "Please enter card details ";
             validData = false;
           }
         
         if( cardname == "" ) {
        	 errMessage = "Please enter card details!";
           validData = false;
         }
         
         if( transactionpassword == "" ) {
        	 errMessage = "Please enter card details!";
           validData = false;
         }
       
         
         if( validData ) {  
       	   BankServer bs = new BankServer();
       	   out.println(bs.isValidCardNumber(cardnumber));
       	   if(bs.isValidCardNumber(cardnumber))  {
       		   
       	   	if(bs.isValidCardDetails(cardnumber,cardname,cvv,expmonth,expyear,cardtype)) {
       		
           		String value = bs.isValidTP(transactionpassword, cardnumber); 
           		if(value.equals("0")) {
           		  	session.setAttribute("currCard", cardnumber);
           		} else if(value.equals("1")){
           			errMessage = "Invalid Card Details, 2 more attempts left !!";
           		} else if(value.equals("2")){
           			errMessage = "Invalid Card Details, 1 more attempts left !!";
           		} else if(value.equals("3")){
           			response.sendRedirect("contactbank.jsp");
           		}
        
           		String paymentMethod = session.getAttribute("payMethod").toString();
           	
        		if(paymentMethod.equals("2") && value.equals("0")) {
                    response.sendRedirect("grid.jsp");
            	}
            	else if(paymentMethod.equals("3") && value.equals("0")) {
            		response.sendRedirect("cardauth.jsp");  
            	}
           	  }
       	     }
       	   	
           }else{
            	   errMessage = "Invalid Card Details !!";
            }
         
	}	
} catch (Exception e) {
	response.sendRedirect("failure.jsp");
}

%>

  