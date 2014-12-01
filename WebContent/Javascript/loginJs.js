function validateForm()
{

var uid="",password="";


var valid=true;
uid = document.getElementById("userid");
password = document.getElementById("pwd");


if(uid.value == "" || uid.value == null)
{
//alert("Enter Uid !!");
document.getElementById("errUserid").innerHTML="Please enter UserId!";
//return false;
valid = false;
}

if(password.value == "" || password.value == null)
{
//alert("Enter Password !!");
document.getElementById("errPassword").innerHTML="Please enter password!";
//return false;
valid = false;
}




return valid;
}