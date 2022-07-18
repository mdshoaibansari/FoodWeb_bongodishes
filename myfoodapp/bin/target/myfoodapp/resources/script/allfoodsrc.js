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
             

         <td> <input type="text" class="form-control" name="name" id="" aria-describedby="helpId" value=${elemnt.cells[1].innerText} placeholder="Enter Food Name"></td>
         <td> <input type="text" class="form-control" name="price" id="" aria-describedby="helpId" value=${elemnt.cells[2].innerText} placeholder="Enter Price"></td>
         <td> <select name="type" id="foodtype" class="form-control"><option value=${elemnt.cells[3].innerText} selected>${elemnt.cells[3].innerText}</option>
      <option value="nv">Non-veg</option>
   <option value="v">Veg</option>
      </select></td>
  
          
       `;
      
    }

}
function update(k){
    
    let ele=document.getElementById('FoodForm');
    ele.action="UpdateFood"; 
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
         ele.action="DeleteMultFood"; 
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
    let ele2=document.getElementById('FoodForm');
       ele2.action="SaveFood"; 

 document.getElementById('newRow').innerHTML = `
 <td scope="row"><input type="checkbox" name="userName" id="mainCheck"  checked></td>
 <td> <input type="text" class="form-control" name="name" id="" aria-describedby="helpId"  placeholder="Enter Food Name"></td>
 <td> <input type="text" class="form-control" name="price" id="" aria-describedby="helpId"  placeholder="Enter Price"></td>
 <td> <select name="type" id="foodtype" class="form-control"><option value="select" selected>Select Type</option>
 <option value="nv">Non-veg</option>
 <option value="v">Veg</option>
 </select></td>   
 `;

}