package controller;

import java.sql.SQLException;


public class UserController {

	 DatabaseHandler dbHandler;

	    public UserController() {
	        dbHandler = new DatabaseHandler();
	    }
	    
	    
	    public boolean isValidLogin(String userID, String password) throws SQLException 
	      {
	      
	        dbHandler = new DatabaseHandler();
	        return dbHandler.isValidLogin(userID,password);  
	      }

	      public String getActiveStatus(String userID) throws SQLException
	      {
	          String status = dbHandler.getActiveStatus(userID);
	          return status;
	      }
}
