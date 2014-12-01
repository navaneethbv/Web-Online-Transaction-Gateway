package controller;

public class LuhnAlgorithm {
	
	boolean valid = false;
	public boolean isValidCardNumber(String cardnumber)  {
		
		 int count = 0;
	        long array[] = new long [16];
	       do
	       {
	        count = 0;
	        array = new long [16];
	        long number = Long.parseLong(cardnumber);
	        for (int i = 0; number != 0; i++) {
	        array[i] = number % 10;
	        number = number / 10;
	        count++;
	        }
	       }
	        while(count < 13); 
	        if ((array[count - 1] == 4) || (array[count - 1] == 5) || (array[count - 1] == 3 && array[count - 2] == 7)){
	            if (isValid(array) == true) {
	                return true;
	        } else {
	        	return false;
	        }
	        } else{
	        	return false;
	        }
	 }  // End of Validate Credit Card Method
		
	
	
	    public static boolean isValid(long[] array) {
	        int total = sumOfDoubleEvenPlace(array) + sumOfOddPlace(array);        
	        if ((total % 10 == 0)) {
	            return true;
	        } else {
	            return false;
	        }
	    }
	    
	    public static int sumOfDoubleEvenPlace(long[] array) {
	        int result = 0;
	        long temp = 0;
	        for (int i=0; i< array.length; i++){
	        while (array[i] > 0) {
	             temp = array[i] % 100;
	             result += getDigit((int) (temp / 10) * 2);
	            array[i] = array[i] / 100;
	           }
	        }
	        return result;
	    }
	    
	    public static int sumOfOddPlace(long[] array) {
	        int result = 0;
	        for (int i=0; i< array.length; i++)
	        {
	        while (array[i] > 0) {
	            result += (int) (array[i] % 10);
	            array[i] = array[i] / 100;
	         }}
	        return result;
	    }
	    

	    public static int getDigit(int number) {
	        if (number <= 9) {
	            return number;
	        } else {
	            int firstDigit = number % 10;
	            int secondDigit = (int) (number / 10);
	            return firstDigit + secondDigit;
	        }
	    }
	      
}
	     
	       
	       
	       
	   



       
     