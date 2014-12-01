package controller;
import java.util.Random;

public class RandomNumberGenerator {

	
	    public static int[] myNumbers = null; 
	    public int num1,num2,num3;
	    
	    public void printNumbers(){
	      try
	      {
	          myNumbers = new int[3];
	         
	          Random r = new Random();
	          int total_elements_cnt = 0;
	          boolean loop_status = true;
	          while(loop_status)
	          {
	              int next_num = r.nextInt(15)+1;          
	              if(!isCompleted()){
	                  if(!isDuplicate(next_num)){
	                      myNumbers[total_elements_cnt] = next_num;
	                      total_elements_cnt++;
	                  }else{
	                      continue;
	                  }
	              }else{
	                  loop_status = false;
	              }
	          }
	          //System.out.println("-------- my final values -------------");
	          
	        	   num1 = myNumbers[0];
	        	   num2 = myNumbers[1];
	        	   num3 = myNumbers[2];
	              // System.out.println("Num 1: "+num1+" Num 2 :"+num2+" Num 3: "+num3);
	          
	      } catch (Exception e) {
	          e.printStackTrace();
	      }
	  }
	    public int getnum1()
	    {
	    	return num1;
	    }
	    
	    public int getnum2()
	    {
	    	return num2;
	    }
	    public int getnum3()
	    {
	    	return num3;
	    }
	    
	  public static boolean isCompleted(){
	      boolean status = true;
	      for (int i = 0; i < myNumbers.length; i++){
	          if(myNumbers[i]==0){
	              status = false;
	              break;
	          }
	      }
	      return  status;
	  }
	  public static boolean isDuplicate(int num){
	      boolean status = false;
	      for (int i = 0; i < myNumbers.length; i++){
	          if(myNumbers[i]== num){
	              status = true;
	              break;
	          }
	      }
	      return  status;
	  }
	
}
