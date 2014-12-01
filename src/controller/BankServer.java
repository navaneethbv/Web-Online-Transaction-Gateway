

package controller;


import java.lang.String;
import java.sql.SQLException;


public class BankServer 
{
  
   
   /*------------To Verify Login Credentials--------------*/
   public boolean isValidLogin(String userID, String password) throws SQLException {
       
       UserController uc = new UserController();
        return uc.isValidLogin(userID, password);
    }
   
   /*---------------To get the active status of the user-----*/
   public String getActiveStatus(String userID) throws SQLException
   {
       UserController userCheckStatusController = new UserController();
        String status = userCheckStatusController.getActiveStatus(userID);
        return status;

   }
   
   /*------------To Validate the Card Number --------------*/
   public boolean isValidCardNumber(String cardnumber) throws SQLException {
       
       CardController cc = new CardController();
       return cc.isValidCardNumber(cardnumber);               
    }
   
   /*------------To Verify Card Details --------------*/
   public boolean isValidCardDetails(String cardnumber,String cardname,int cvv,int expmonth,int expyear,String cardtype) throws SQLException {
      
	   CardController cc = new CardController();
       return cc.isValidCardDetails(cardnumber,cardname,cvv,expmonth,expyear,cardtype);
   }

  /*------------To Verify Transaction Password --------------*/
  public String isValidTP(String transactionpassword, String cardnumber) throws SQLException {
      
      CardController cc = new CardController();
      String val = cc.isValidTP(transactionpassword,cardnumber);
      return val;           
   }
  
  /*------------Card Authentication --------------*/
  public boolean isValidCardValues(String cardnumber, int randnum1, int randnum2, int randnum3,int first, int second, int third) throws SQLException {
      
      CardController cc = new CardController();
      return cc.isValidCardValues( cardnumber,  randnum1,  randnum2,  randnum3, first,  second,  third);
                 
   }
  
  
  /*------------Grid Authentication --------------*/
  public boolean isValidGridValues(String cardnumber, String randstr1, String randstr2, String randstr3,int first, int second, int third) throws SQLException {
      
      CardController cc = new CardController();
      return cc.isValidGridValues( cardnumber,  randstr1,  randstr2,  randstr3, first,  second,  third);
                 
   }
  
  /*------------To Verify OTP Credentials--------------*/
  public String getOTP(String user) throws SQLException {

      MailUtility mail = new MailUtility();
      String otp = mail.sendFromGMail(user);
      return otp;
  }
  
  /*------------To block the Card --------------*/
  public void blockCard(String cardnumber) throws SQLException {
      
      CardController cc = new CardController();
      blockCard(cardnumber);               
   }
  

}
