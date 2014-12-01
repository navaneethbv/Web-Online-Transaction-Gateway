function validateForm()
{

var first="",second="", third="";


var valid=true;


var first= document.getElementById("first");
var second = document.getElementById("second");
var third = document.getElementById("third");




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
document.getElementById("errMessage").innerHTML=" Please enter the grid values !!";	
}

if(valid)  {
document.getElementById("errMessage").innerHTML=" ";
}

return valid;
}