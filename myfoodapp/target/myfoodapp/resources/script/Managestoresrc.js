function edit(i){
    let chck=document.querySelectorAll('input[type="checkbox"]:checked').length;
    if(chck == 0){
        alert("You haven't checked any record");
        return false;
    }
    else if(chck>1){
       alert("You are selected more than one record for Edit") 
    }
    else{
       let ind=document.querySelector('input[type="checkbox"]:checked').value;
      let rowid='rowid'+ind;
      document.getElementById('buttonSet').innerHTML=`
          <button class="btn btn-warning" type="button" onclick="cancel()"> Cancel </button>
          
          <button class="btn btn-primary"  id="UpdateButton" onclick="update(${ind})"> Update </button>`;
    
      let elemnt =document.getElementById(rowid);
      elemnt.innerHTML =` 
          <td scope="row"><input type="checkbox" name="userName" id="mainCheck" value="${ind}" checked></td>
       
       <td>
       <select name="name" id="" class="form-control">
         `+document.getElementById('foodid').innerHTML+` 
       </select>
         </td>
         
         <td> <input type="text" class="form-control" name="price" id="" aria-describedby="helpId" value=${elemnt.cells[2].innerText} placeholder="Enter Price"></td>
            <td> <input type="text" class="form-control" name="quantity" id="" aria-describedby="helpId" value=${elemnt.cells[3].innerText} placeholder="Enter Quantity"></td>
         <td> <input type="file" class="form-control" name="imagefile" id="" aria-describedby="helpId"  placeholder="Enter Food Image">
       </td>
  
          
       `;
      
    }

}
function update(k){
    
    let ele=document.getElementById('FoodForm');
    ele.action="UpdateFoodInStore"; 
    ele.submit()
}
function deleteFood(){
    if(document.querySelectorAll('input[type="checkbox"]:checked').length == 0){
        alert("You haven't checked any record");
        return false;
    }
     var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
     myModal.show(); 
     document.getElementById('deleteFood').addEventListener('click',()=>{
         console.log('working');
         let ele=document.getElementById('FoodForm');
         ele.action="DeleteMultFoodInStore"; 
         ele.submit();
         
     })
}
function cancel(){
    location.reload(true);
}
function add(){
    document.getElementById('buttonSet').innerHTML=`
         <button class="btn btn-warning" type="button" onclick="cancel()"> Cancel </button>
         <button class="btn btn-primary"  id="FoodButton" > Add Food </button>`;
         var myModal = new bootstrap.Modal(document.getElementById('addstrfood'));
         myModal.show();  
         
    let ele2=document.getElementById('FoodForm');
    ele2.action="AddNewFoodInStore"; 

}
var form = document.getElementById('FoodFormModal');
/*document.getElementById('mySubmitButton').addEventListener('click',*/
/*
async function myuploadFile(){
	console.log("it is start working");
	const url = form.action;

  try {
      const formData = new FormData(form);
      const response = await fetch(url, {
          method: 'POST',
          body: formData
      });

      console.log(response);
  } catch (error) {
      console.error(error);
  }
	alert('The file upload with Ajax and Java was a success!');
}*/

async function myuploadFile(){
	console.log("it is start working");
	const formdata=new FormData(form);
    var message="";
    $.ajax({
	url : 'AddNewFoodInStore' ,
	type : 'POST',
	data : formdata ,
	processData: false,
	contentType: false,
	success: function(data){
                console.log(data);
                message=data;
	}
	})
	 var myModal = new bootstrap.Modal(document.getElementById('addstrfood'));
    myModal.hide();
	alert('File Uploadded Successfully');
    location.reload(false);
  
  
}
window.onload=function(){
    document.getElementById('setStoreid').value= get('storeid');

}
function get(name){
    if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
       return decodeURIComponent(name[1]);
}
/*
async function uploadFile() {
    let formData = new FormData(); 
    formData.append("file", ajaxfile.files[0]);
    let resp=await fetch('AddNewFoodInStore', {
      method: "POST", 
      body: formData
    }); 
    console.log(resp);
    alert('The file upload with Ajax and Java was a success!');
    return false;
   }
   form.onsubmit = async (e) => {
  e.preventDefault();
  const form = e.currentTarget;
  const url = form.action;

  try {
      const formData = new FormData(form);
      const response = await fetch(url, {
          method: 'POST',
          body: formData
      });

      console.log(response);
  } catch (error) {
      console.error(error);
  }
	alert('The file upload with Ajax and Java was a success!');
}
   
   */