function validatePass() {
    var passwd = document.getElementById("inputPassword");
    var passwdRegex = /^(?=.*\d)(?=.*[A-Z]).{6,20}$/;
    if (!passwd.value.match(passwdRegex)) {
        alert("Invalid password!");
        passwd.focus();
        console.log("failed");
        return false;
    }
    console.log("passed");
    return true;
}
function validatePass2(){
    var pswd=document.getElementById("inputPassword");
    var pswd2=document.getElementById("inputPassword2");
    var oldpswd=document.getElementById("inputOldPassword");
    var passwdRegex = /^(?=.*\d)(?=.*[A-Z]).{6,20}$/;
    if(pswd.value!=pswd2.value){
        alert("New Password and Confirm Password Mismatch!");
        console.log("passowd mismatch");
        return false;
    }
    if(pswd.value.match(passwdRegex)&&(oldpswd.value.match(passwdRegex)))
     return true;
    alert("Invalid Passord!");
    console.log("invalid Password");
    pswd.focus();
    return false;
}
function validateDetails() {
    var userID = document.getElementById("userID").value;
    var passwd = document.getElementById("passwd").value;
    var confpasswd = document.getElementById("confpasswd").value;
    var dob = document.getElementById("dob").value;
    var contact = document.getElementById("contact").value;

    var userIDregex = /.{4,8}/;
    var passwdRegex = /^(?=.*\d)(?=.*[A-Z]).{6,20}$/;
    var contactRegex = /(?=.*\d){10}/;
    var dobDate = new Date(dob);
    var today = new Date();
    if(confpasswd!=passwd){
        alert("Password & Confirm Password Mistmatch!");
        return false
    }
    if (
        userID.match(userIDregex) &&
        passwd.match(passwdRegex) &&
        dobDate.getTime() < today.getTime() &&
        contact.match(contactRegex)
    ) 
        return true;
   
        alert("Invalid Details!");
        return false;
    
}
