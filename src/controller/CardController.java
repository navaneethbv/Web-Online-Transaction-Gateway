package controller;

import java.sql.SQLException;

public class CardController {
	
	static int countCardAttempt = 0;
	DatabaseHandler dbHandler;
	
	/*------------To Validate the Card Number --------------*/
	   public boolean isValidCardNumber(String cardnumber) throws SQLException {
	       
	       LuhnAlgorithm cc = new LuhnAlgorithm();
	       return cc.isValidCardNumber(cardnumber);
	                  
	    }
	   
	
	/*------------To Verify Card Details --------------*/
	   public boolean isValidCardDetails(String cardnumber,String cardname,int cvv,int expmonth,int expyear,String cardtype) throws SQLException {
	 
	       dbHandler = new DatabaseHandler(); 
	       
		   if(!dbHandler.isCardBlocked(cardnumber)){
		       return dbHandler.isValidCardDetails(cardnumber,cardname,cvv,expmonth,expyear,cardtype);
		   } else {
			   return false;
		   }
	   
	 }
	
	
	/*------------To Verify Transaction Password --------------*/
	   public  String isValidTP(String transactionpassword, String cardnumber) throws SQLException {
	       
		   boolean validTP = true;
		   String value = "0";
		   
	       dbHandler = new DatabaseHandler();
	       validTP =  dbHandler.isValidTP(transactionpassword,cardnumber);
	       if (validTP ==  false && countCardAttempt < 3) {
	    	   countCardAttempt ++;
	    	   value = countCardAttempt+"";
	    	   return value;
	       }
	       if (validTP ==  false && countCardAttempt >= 3) {
	    	   blockCard(cardnumber);
	    	   countCardAttempt = 0;
	    	   value = "3";
	    	   return value;
	       }
	       
	       return value;
	    }
	   
	
	   /*------------Card Authentication --------------*/
	   public boolean isValidCardValues(String cardnumber, int randnum1, int randnum2, int randnum3,int first, int second, int third) throws SQLException {
	       
		   boolean valid = false;
		   	
		   /*	char[] numbers = cardnumber.toCharArray();
		   	int num1 = (int)numbers[randnum1];
		   	int num2 = (int)numbers[randnum2];
		   	int num3 = (int)numbers[randnum3];*/
		   
		   String one = Integer.toString(first);
		   String two = Integer.toString(second);
		   String three = Integer.toString(third);
		   
		   String num1 = String.valueOf(cardnumber.charAt(randnum1));
		   String num2 = String.valueOf(cardnumber.charAt(randnum2));
		   String num3 = String.valueOf(cardnumber.charAt(randnum3));
		   
		   	if(one.equals(num1) && two.equals(num2) && three.equals(num3))
		   		valid = true;
		   
		   return valid;
	                  
	    }
	
	   /*------------Grid Authentication --------------*/
	   public boolean isValidGridValues(String cardnumber, String randstr1, String randstr2, String randstr3,int first, int second, int third) throws SQLException {
	       
	       dbHandler =  new DatabaseHandler();
	       return dbHandler.isValidGridValues( cardnumber,  randstr1,  randstr2,  randstr3, first,  second,  third);
	                  
	    }
	   
	   /*------------To block the Card --------------*/
	   public void blockCard(String cardnumber) throws SQLException {
	       
		   dbHandler = new DatabaseHandler();
	       dbHandler.blockCard(cardnumber);               
	    }
	   
	   

}

