package controller;

import java.util.Random;


public class RandomOTPGenerator {
	 public static String generateSessionKey(){
		  String alphabet = 
		          new String("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"); //9
		  int n = alphabet.length(); //10

		  String result = new String(); 
		  Random r = new Random(); //11

		  for (int i=0; i<6; i++) //12
		      result = result + alphabet.charAt(r.nextInt(n)); //13

		  return result;
		  }
	}
	  

