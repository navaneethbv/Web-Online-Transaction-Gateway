function validateForm()
{

var first="",second="", third="";


var valid=true;


var first= document.getElementById("firstdigit");
var second = document.getElementById("seconddigit");
var third = document.getElementById("thirddigit");




if(first.value == "" || first.value == null )
{
valid = false;
}

if(second.value == "" || second.value == null)
{
valid = false;
}

if(third.value == "" || third.value == null)
{
valid = false;
}

if(!valid)  {
document.getElementById("errMessage").innerHTML=" Please enter the card values !!";	
}

if(valid)  {
document.getElementById("errMessage").innerHTML=" ";
}

return valid;
}