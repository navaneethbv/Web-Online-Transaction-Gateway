package controller;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import org.apache.catalina.mbeans.ClassNameMBean;

public class MailUtility {


		String USER_NAME = "richiethakur1809@gmail.com";  // GMail user name (just the part before "@gmail.com")
		String PASSWORD = "richie1809"; // GMail password
	  
		String from = USER_NAME;
		String pass = PASSWORD;
		String subject = " Priority mail : OTP PIN";
	

     public String sendFromGMail(String username) {
    	
    	String RECIPIENT = getUserEmail(username); //Reciever's email ID
    	String[] to = { RECIPIENT }; // list of recipient email addresses
    	
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");    
        props.put("mail.smtp.ssl.trust", "*");
        props.put("mail.smtp.host", host);    
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
        
        RandomOTPGenerator otpGenerator = new RandomOTPGenerator();
        String onetimepaswd = otpGenerator.generateSessionKey();
        String body = "The 3D PIN for your account - " + onetimepaswd;
        

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
        
        return onetimepaswd;
    }
     
     
     /*------------------------get user email id -----------------------------*/
     public String getUserEmail(String username) {
    	 
    	DatabaseHandler db = new DatabaseHandler();		 
    	return db.getUserEmail(username); 
     }
    /*-------------------------------------------------------------------------*/
    
}
