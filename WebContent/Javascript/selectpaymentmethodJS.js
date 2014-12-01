
function pageLoad() {
	
	document.getElementById("btnSubmit").onclick = validateForm();
	
}

function validateForm() {
	
	var option = document.getElementById("paymenttype").value;
	if(option == 1) {
		document.getElementById("errMethod").innerHTML="* Please select a payment method ";
	}
	if(option == 2) {
		document.getElementById("errMethod").innerHTML=" ";
	}
	if(option == 3) {
		document.getElementById("errMethod").innerHTML=" ";
	}
	
}