let menu = document.querySelector('#menu-bars');
let navbar = document.querySelector('.navbar');

menu.onclick = () => {
  menu.classList.toggle('fa-times');
  navbar.classList.toggle('active');
}

let section = document.querySelectorAll('section');
let navLinks = document.querySelectorAll('header .navbar a');

window.onscroll = () => {

  menu.classList.remove('fa-times');
  navbar.classList.remove('active');

  section.forEach(sec => {

    let top = window.scrollY;
    let height = sec.offsetHeight;
    let offset = sec.offsetTop - 150;
    let id = sec.getAttribute('id');

    if (top >= offset && top < offset + height) {
      navLinks.forEach(links => {
        links.classList.remove('active');
        document.querySelector('header .navbar a[href*=' + id + ']').classList.add('active');
      });
    };

  });

}

document.querySelector('#search-icon').onclick = () => {
  document.querySelector('#search-form').classList.toggle('active');
}

document.querySelector('#close').onclick = () => {
  document.querySelector('#search-form').classList.remove('active');
}

var swiper = new Swiper(".home-slider", {
  spaceBetween: 30,
  centeredSlides: true,
  autoplay: {
    delay: 7500,
    disableOnInteraction: false,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  loop: true,
});

var swiper = new Swiper(".review-slider", {
  spaceBetween: 20,
  centeredSlides: true,
  autoplay: {
    delay: 7500,
    disableOnInteraction: false,
  },
  loop: true,
  breakpoints: {
    0: {
      slidesPerView: 1,
    },
    640: {
      slidesPerView: 2,
    },
    768: {
      slidesPerView: 2,
    },
    1024: {
      slidesPerView: 3,
    },
  },
});
function searchFotIt() {
  elmnt = document.getElementById('search-form');
  elmnt.submit();
}


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
  $.ajax({

    url: "isAvailable",
    data: { rid: i },
    success: function (responseText, textstatus, jqXHR) {
      console.log(responseText);
      if (parseInt(responseText) < 0) {
        a--;
        document.cookie = `${i}` + "=" + a;
        alert('Sorry.. our Limit for this food is crossed');
      }
      else {
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
    }
  });
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
  $.get("isSignIn", function (responseText) {
    console.log(responseText);
    if (parseInt(responseText) < 0) {
      alert('You have to sign in first...');
      window.location.href = "inin.jsp";
    }
    else {
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
  });
}
function readyfight() {

}
