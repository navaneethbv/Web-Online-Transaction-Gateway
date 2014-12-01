package data;

public class Card {

	private String cardtype, cardname, transactionpassword, cardnumber;
	private int expmonth, expyear, cvv;

	
	
	public String getCardtype() {
		return cardtype;
	}
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	public String getCardname() {
		return cardname;
	}
	public void setCardname(String cardname) {
		this.cardname = cardname;
	}
	public String getTransactionpassword() {
		return transactionpassword;
	}
	public void setTransactionpassword(String transactionpassword) {
		this.transactionpassword = transactionpassword;
	}
	public String getCardnumber() {
		return cardnumber;
	}
	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}
	public int getExpmonth() {
		return expmonth;
	}
	public void setExpmonth(int expmonth) {
		this.expmonth = expmonth;
	}
	public int getExpyear() {
		return expyear;
	}
	public void setExpyear(int expyear) {
		this.expyear = expyear;
	}
	
	
	
}
