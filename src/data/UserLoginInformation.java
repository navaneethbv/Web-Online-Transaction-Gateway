package data;

public class UserLoginInformation {

	    private String password;
	    private String userID;
	    private String useractivestatus;



	    public void setPassword(String password) {
	        this.password = password;
	    }

	    public String getPassword() {
	        return password;
	    }

		public String getUserID() {
			return userID;
		}

		public void setUserID(String userID) {
			this.userID = userID;
		}

		public String getActive() {
			return useractivestatus;
		}

		public void setActive(String active) {
			this.useractivestatus = active;
		}
	    
	    

}
