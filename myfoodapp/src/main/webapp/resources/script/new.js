// document.getElementById("somebutton").addEventListener('click',()=>{


//     // console.log("work1");  
//     $.get("cartservlet", function(responseText) {  
//     //    console.log("work2");    
//        $("#somebutton").html(responseText+` `+`<i class="fas fa-plus-circle">`);    
//         //    console.log(responseText);      
//        });
//    })
//    $("#somebutton").click(function() {
//     var id = $(this).attr('id'); // $(this) refers to button that was clicked
//     console.log(id);
// })
/*$.ajax({
        url : "cartservlet",
        data : {cid : i},
        success: function(data,textstatus,jqXHR){
            var btnid='btn'+i;
            document.getElementById(btnid).innerText=data;
            
        }
    })*/
function addcart(i){
    
    console.log(i);
   let arr= document.cookie.split(';').map(cookie => cookie.split('=')).reduce((accumulator, [key, value]) => ({ ...accumulator, [key.trim()]: decodeURIComponent(value) }), {});

   let a=parseInt(arr[i]);
   if(isNaN(a))
   	a=1;
   else
   {
	a++;
	arr[i]=a;
	}
	document.cookie=`${i}`+"="+a;
   
   var btnid='btn'+i;
   document.getElementById(btnid).innerText=a;
   
}

function removecart(i){
    /*$.ajax({
        url : "removecart",
        data : {cid : i},
        success: function(data,textstatus,jqXHR){
            var btnid='btn-'+i;
            document.getElementById(btnid).innerText=data;
            
        }
    })*/
     let arr= document.cookie.split(';').map(cookie => cookie.split('=')).reduce((accumulator, [key, value]) => ({ ...accumulator, [key.trim()]: decodeURIComponent(value) }), {});

   let a=parseInt(arr[i]);
   if(!isNaN(a))
   {
	if(a>=0)
    	a--;
	arr[i]=a;
   }
   let btnid='btn'+i;
   document.cookie=`${i}`+"="+a;
    document.getElementById(btnid).innerText=a;
}

function setcart(i){
    var ele='btngrp'+i;
    let element=document.getElementById(ele);
    // let element=this;
    console.log(i);
    let v="btn"+`${i}`;
    element.innerHTML=`<button class="btn" onclick="removecart(${i})"> <i class="fas fa-minus-circle"></i></button>
                <button class="btn" id="${v}" ></button>
                <button class="btn"  " onclick="addcart(${i})">  <i class="fas fa-plus-circle"></i></button>
                `;
    addcart(i);
}

 // Get the modal
 var modal = document.getElementById("myModal");

 // Get the button that opens the modal
 var btn = document.getElementById("myBtn");

 // Get the <span> element that closes the modal
 var span = document.getElementsByClassName("close")[0];

 // When the user clicks on the button, open the modal
//  btn.onclick = function () {
//      console.log('working');
//      modal.style.display = "block";
//  }
 /*document.getElementById('myBtn').addEventListener('click',()=>{
    console.log('working');
    modal.style.display = "block";
 })

 // When the user clicks on <span> (x), close the modal
 span.onclick = function () {
     modal.style.display = "none";
 }

 // When the user clicks anywhere outside of the modal, close it
 window.onclick = function (event) {
     if (event.target == modal) {
         modal.style.display = "none";
     }
 }*/
// btns = document.getElementsByClassName("saveBtn");
// for (var i = 0; i < btns.length; i++) {
//     btns[i].addEventListener("click", function () {
//         //Add function here
//     });
// }
   
// $(".remove").click(function() {
//     alert(this.parentElement)
//   });

//   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
// <div>
//   Some entry here
//   <button id="0" class="remove">Remove</button>
// </div>
// <div>
//   Another entry here
//   <button id="1" class="remove">Remove</button>
// </div>