
function addcart(i) {
   let arr = document.cookie.split(';').map(cookie => cookie.split('=')).reduce((accumulator, [key, value]) => ({ ...accumulator, [key.trim()]: decodeURIComponent(value) }), {});
   let a = parseInt(arr[i]);
   if (isNaN(a))
      a = 1;
   else {
      a++;
      arr[i] = a;
   }
   document.cookie = `${i}` + "=" + a;
   var btnid = 'btn' + i;
   var amountid = 'amount' + i;
   var priceid = 'price' + i;
   document.getElementById(btnid).innerText = a;
   let temp = document.getElementById(priceid).innerText;
   let totalamountDiv = document.getElementById('totalamount');
   console.log(temp + " + " + a);
   let total = a * parseInt(temp);
   let val = document.getElementById(amountid);
   let totalamount = parseInt(totalamountDiv.innerText) - parseInt(val.innerText) + total;
   val.innerText = total;
   totalamountDiv.innerText = totalamount;
   document.cookie = `totalamount` + "=" + totalamount;
}

function removecart(i) {
   let arr = document.cookie.split(';').map(cookie => cookie.split('=')).reduce((accumulator, [key, value]) => ({ ...accumulator, [key.trim()]: decodeURIComponent(value) }), {});
   let a = parseInt(arr[i]);
   if (!isNaN(a)) {
      if (a >= 0)
         a--;
      arr[i] = a;
   }
   document.cookie = `${i}` + "=" + a;
   var btnid = 'btn' + i;
   var amountid = 'amount' + i;
   var priceid = 'price' + i;
   document.getElementById(btnid).innerText = a;
   let temp = document.getElementById(priceid).innerText;
   let totalamountDiv = document.getElementById('totalamount');
   console.log(temp + " + " + a);
   let total = a * parseInt(temp);
   let val = document.getElementById(amountid);
   let totalamount = parseInt(totalamountDiv.innerText) - parseInt(val.innerText) + total;
   val.innerText = total;
   totalamountDiv.innerText = totalamount;
   document.cookie = `totalamount` + "=" + totalamount;
}

function setcart(i) {
   var ele = 'btngrp' + i;
   let element = document.getElementById(ele);
   // let element=this;
   console.log(i);
   let v = "btn" + `${i}`;
   element.innerHTML = `<button class="btn" onclick="removecart(${i})"> <i class="fas fa-minus-circle"></i></button>
                <button class="btn" id="${v}" ></button>
                <button class="btn"  " onclick="addcart(${i})">  <i class="fas fa-plus-circle"></i></button>
                `;
   addcart(i);
}
function readyfight(){
	
}
