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
	document.getElementById('Error').innerText="Your Password & Confirm Password must match";
	return false;
}
window.onload=function(){
	let val=document.getElementById('Error');
	if(val.innerText.length>0){
		container.classList.add("right-panel-active");
	}
	else{
		val.innerHTML=`<br>`;
	}
}