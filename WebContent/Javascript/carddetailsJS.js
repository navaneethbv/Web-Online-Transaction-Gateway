function validateForm()
{

var cardnumber="",cardname="",cardtype="",transactionpassword="",cvv="";


var valid=true;


var cardnumber= document.getElementById("cardnumber");
var cardname = document.getElementById("cardname");
var transactionpassword = document.getElementById("transactionpassword");
var cvv = document.getElementById("cvv");


if(document.getElementById("carddtype").checked == false && document.getElementById("cardctype").checked == false)
{
valid = false;
}

if(cardnumber.value == "" || cardnumber.value == null )
{
valid = false;
}

if(cvv.value == "" || cvv.value == null )
{
valid = false;
}

if(cardname.value == "" || cardname.value == null)
{
valid = false;
}

if(transactionpassword.value == "" || transactionpassword.value == null)
{
valid = false;
}

if(!valid)  {
document.getElementById("errMessage").innerHTML=" Values entered are not correct !!";	
}

if(valid)  {
document.getElementById("errMessage").innerHTML=" ";
}

return valid;
}