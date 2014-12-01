 <%
	String errTerms="";

 if(request.getParameter("btnSubmit") != null) {
	if(request.getParameter("checkTemrs") !=  null) {
		response.sendRedirect("carddetails.jsp");
	 
	} else {
		errTerms = "Please agree to the terms of service agreement";
	}
 }
%>

   