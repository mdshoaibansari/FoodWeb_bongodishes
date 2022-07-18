const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});
function validate(){
	let ele=document.getElementById('pass');
	let ele2=document.getElementById('pass2');
	if(ele.value==ele2.value)
	 return true;
	document.getElementById('message').innerText="Your Password & Confirm Password must match";
	return false
}