package controller;

import java.sql.*;


public class DatabaseHandler {

	
	
    boolean isValidLogin(String userID, String pass) throws SQLException {
    	boolean matches=false;
    	try {
	    	
	    	 String url = "jdbc:mysql://localhost/test";
	    	    String username = "root"; 
	    	    String password = "root";
	    	    
	    	Class.forName("com.mysql.jdbc.Driver");
	        java.sql.Connection connection = DriverManager.getConnection(url,username,password);
	        Statement statement = connection.createStatement();
	        
	         
	         ResultSet results = statement.executeQuery("SELECT username,password FROM onlinetransaction.login");
	         
	         while(results.next()) {
	        	 String uid=results.getString("username");	        	 
	        	 String pwd=results.getString("password");
	        	
	        	 if(userID.equals(uid) && pass.equals(pwd)) {
	        		matches=true; 
	        	 }
	        	 else {
	        		 System.out.println("not matching");
	        	 }
	         }
	         
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
    	if(matches)
			return true;
		else
			return false;
    	
    }

    /*--------------------------------------------------------------------------------------------------------------------*/
    
    
    public String getActiveStatus (String uid) throws SQLException
    {
         String userstatus="";

         try {
 	    	
	    	 String url = "jdbc:mysql://localhost/test";
	    	    String username = "root"; 
	    	    String password = "root";
	    	    
	    	 Class.forName("com.mysql.jdbc.Driver");
	         java.sql.Connection connection = DriverManager.getConnection(url,username,password);
	         Statement statement = connection.createStatement();
	         
	         ResultSet results = statement.executeQuery("SELECT username,active_user FROM onlinetransaction.login");
	         
	         while(results.next()) {
	        	 String user=results.getString("username");	        	 
	        	 if(user.equals(uid))  {
	        		 userstatus=results.getString("active_user");
	        	 }
	        	 else {
	        		 System.out.println("User not matching");
	        	 }
	         }
	         
	    } catch (Exception e) {
	      e.printStackTrace();
	    }

        return userstatus;
     }
    
    
    /*--------------------------------------------------------------------------------------------------------------------*/
    boolean isCardBlocked(String cardno) {
    	
    	boolean blockedstatus = true;
    	String status = "";
    	
    	try {
	    	
	    	 String url = "jdbc:mysql://localhost/test";
	    	    String username = "root"; 
	    	    String password = "root";
	    	    
	    	 Class.forName("com.mysql.jdbc.Driver"); 
	    	 
	         java.sql.Connection connection = DriverManager.getConnection(url,username,password); 
	         java.sql.PreparedStatement statementStatus = connection.prepareStatement("SELECT card_blocked_flag FROM onlinetransaction.card_details where card_no=?;");
	         statementStatus.setString(1, cardno);
	         
	         // Executing the prepared Statement
	         java.sql.ResultSet resultStatus =  statementStatus.executeQuery();
	         
	         while(resultStatus.next())   {
	        	 status = resultStatus.getString(1);
	          }
    		}
	         catch (Exception e) {
	   	      e.printStackTrace();
	   	    }
	       	
    	
    		if(status.equals("N")) {
    			blockedstatus = false;
    		} else if(status.equals("Y")) {
    			blockedstatus = true;
    		}
    	
    		
    	return blockedstatus;
    }
    
    /*--------------------------------------------------------------------------------------------------------------------*/
    boolean isValidCardDetails(String cardno, String cname, int cvv, int expmon, int expyr,String ctype) throws SQLException {
    	
    	boolean validData=false;

    	try {
	    	
	    	 String url = "jdbc:mysql://localhost/test";
	    	    String username = "root"; 
	    	    String password = "root";
	    	    
	    	 Class.forName("com.mysql.jdbc.Driver"); 
	         java.sql.Connection connection = DriverManager.getConnection(url,username,password); 
	         java.sql.PreparedStatement statement = connection.prepareStatement("SELECT * FROM onlinetransaction.card_details where card_no=?;");
	         statement.setString(1, cardno);
	         
	         // Executing the prepared Statement
	         java.sql.ResultSet results =  statement.executeQuery();
	         
	         while(results.next()) {
	        	 String name = results.getString("name_on_card");
	        	 int fetchedcvv = results.getInt("cvv");
	        	 int mon= results.getInt("expiry_month");
	        	 int yr = results.getInt("expiry_year");
	        	 String cardtype = results.getString("card_type");
	        	 
	        	 
	        	
	        	 if( fetchedcvv == cvv && mon == expmon && yr == expyr && name.equalsIgnoreCase(cname) && cardtype.equals(ctype) && validData == false)
	        	 {
	        		validData=true;   
	        		System.out.println("matched Card Details");
	        	 }
	        	 
	         }
    	}
	    catch (Exception e) {
	   	      e.printStackTrace();
	   	}
	       	
	  return validData;
	}
    /*--------------------------------------------------------------------------------------------------------------------*/
    
   
    boolean isValidTP(String trpass,String cardno) throws SQLException {
    	boolean tpsuccess=false;

    	try {
	    	
	    	 String url = "jdbc:mysql://localhost/test";
	    	    String username = "root"; 
	    	    String password = "root";
	    	    
	    	Class.forName("com.mysql.jdbc.Driver"); 
	    	 
	        java.sql.Connection connection = DriverManager.getConnection(url,username,password);   
	         
	         String sql = "SELECT trans_pass FROM onlinetransaction.bank_details,onlinetransaction.card_details where onlinetransaction.bank_details.acctno = onlinetransaction.card_details.acctno && card_no=?;";
	         java.sql.PreparedStatement statement = connection.prepareStatement(sql);
	         statement.setString(1, cardno);
	         
	         // Executing the prepared Statement
	         java.sql.ResultSet results =  statement.executeQuery();
	         
	         while(results.next() && tpsuccess == false) {
	        	 String tranpwd = results.getString(1);
	        	
	        	 if ( tranpwd.equals(trpass))
	        		tpsuccess=true;   
	        	 else
	        		tpsuccess=false;

	         }
    	}
	    catch (Exception e) {
	   	      e.printStackTrace();
	    }
    	
    return tpsuccess;
   }
    
    /*--------------------------------------------------------------------------------------------------------------------*/

    /*------------Grid Authentication --------------*/
	   public boolean isValidGridValues(String cardno, String randstr1, String randstr2, String randstr3,int first, int second, int third) throws SQLException {
	       
		   boolean gridvalid = false;
		   try {
		    	
		    	 String url = "jdbc:mysql://localhost/test";
		    	    String username = "root"; 
		    	    String password = "root";
		    	    
		    	 Class.forName("com.mysql.jdbc.Driver"); 
		    	 
		         java.sql.Connection connection = DriverManager.getConnection(url,username,password); 
		         java.sql.PreparedStatement statement = connection.prepareStatement("SELECT * FROM onlinetransaction.grid_details where card_no=?;");
		         statement.setString(1, cardno);
		         
		         // Executing the prepared Statement
		         java.sql.ResultSet results =  statement.executeQuery();
		         
		         while(results.next() && gridvalid == false) {
		        	 
		        	 int n1 = results.getInt(randstr1);
		        	 int n2 = results.getInt(randstr2);
		        	 int n3 = results.getInt(randstr3);
		        	 
		        	 if( n1 == first && n2 == second && n3 == third && gridvalid == false) {
		        		gridvalid=true;   
		        	 }
		        	 
		         }
	    	}
		    catch (Exception e) {
		   	      e.printStackTrace();
		   	}
		       	
	       return gridvalid;
	    }

	   
	   
	/*--------------------------------------------------------------------------------------------------------------------*/
	
	public String getUserEmail(String user) {
		
		String mail = "";
		
		try {
		    	
		    	 String url = "jdbc:mysql://localhost/test";
		    	 String username = "root"; 
		    	 String password = "root";
		    	    
		    	 Class.forName("com.mysql.jdbc.Driver"); 
		    	 
		         java.sql.Connection connection = DriverManager.getConnection(url,username,password);
		         String query = "SELECT onlinetransaction.user_details.email from onlinetransaction.user_details,onlinetransaction.login where onlinetransaction.user_details.email = onlinetransaction.login.email and onlinetransaction.login.username=?";
		         java.sql.PreparedStatement statement = connection.prepareStatement(query);
		         statement.setString(1, user);
		         
		         // Executing the prepared Statement
		         java.sql.ResultSet results =  statement.executeQuery();
		         
		         while(results.next()) {
		        	mail = results.getString("email");
		        	 
		         }
	    	}
		    catch (Exception e) {
		   	      e.printStackTrace();
		   	}
		       	
	      
		return mail;
	}
	
	/* ----------------------------------- to Block the card --------------------------------- */

	public void blockCard(String cardno) {
		
		try {
	    	
	    	 String url = "jdbc:mysql://localhost/test";
	    	    String username = "root"; 
	    	    String password = "root";
	    	    
	    	 Class.forName("com.mysql.jdbc.Driver"); 
	    	 
	         java.sql.Connection connection = DriverManager.getConnection(url,username,password); 
	         java.sql.PreparedStatement statementStatus = connection.prepareStatement("UPDATE onlinetransaction.card_details SET onlinetransaction.card_details.card_blocked_flag=? where onlinetransaction.card_details.card_no=?;");
	         statementStatus.setString(1, "Y");
	         statementStatus.setString(2, cardno);
	         
	         // Executing the prepared Statement
	         java.sql.ResultSet resultStatus =  statementStatus.executeQuery();
	         
	        
   		} catch (Exception e) {
	   	      e.printStackTrace();
	   	    }
		
	}

/* -------------------------------------------------------------------------------------------------------------------------- */

}
