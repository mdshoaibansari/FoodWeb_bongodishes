

function noCheck() {

}
function edit() {
    let chck = document.querySelectorAll('input[type="checkbox"]:checked').length;
    if (chck == 0) {
        alert("You haven't checked any record");
        return false;
    }
    else if (chck > 1) {
        alert("You are selected more than one record for Edit")
    }
    else {
        let ind = document.querySelector('input[type="checkbox"]:checked').value;
        let rowid = 'rowid' + ind;
        console.log(rowid);
        document.getElementById('buttonSet').innerHTML = `
  				 <button class="btn btn-warning" type="button" onclick="cancel()"> Cancel </button>
  				 
  				 <button class="btn btn-primary"  id="UpdateButton" onclick="update(${ind})"> Update </button>`;

        let elemnt = document.getElementById(rowid);
        elemnt.innerHTML = ` 
    	    	   <td scope="row"><input type="checkbox" name="userName"  value=${ind} disabled></td>
    	              
    	       <td> <input type="text" class="form-control" name="storename" id="" aria-describedby="helpId" value=${elemnt.cells[1].innerText}  placeholder="Enter Store Name "></td>
    	          <td> <input type="text" class="form-control" name="phnumber" id="" aria-describedby="helpId" value=${elemnt.cells[2].innerText} placeholder="Enter Phone Number"></td>
    	          <td> <input type="text" class="form-control" name="address" id="" aria-describedby="helpId" value=${elemnt.cells[3].innerText} placeholder="Enter Address"></td>
    	          <td> <select name="state" id="state" class="form-control" ><option value=${elemnt.cells[4].innerText} selected>${elemnt.cells[4].innerText}</option>
    	            <option value="Andhra Pradesh">Andhra Pradesh</option>
    	            <option value="Delhi">Delhi</option>
    	            <option value="Lakshadweep">Lakshadweep</option>
    	            <option value="Puducherry">Puducherry</option>
    	            <option value="Goa">Goa</option>
    	            <option value="Gujarat">Gujarat</option>
    	            <option value="Haryana">Haryana</option>
    	            <option value="Karnataka">Karnataka</option>
    	            <option value="Kerala">Kerala</option>
    	            <option value="Maharashtra">Maharashtra</option>
    	            <option value="Manipur">Manipur</option>
    	            <option value="Meghalaya">Meghalaya</option>
    	            <option value="Odisha">Odisha</option>
    	            <option value="Punjab">Punjab</option>
    	            <option value="Rajasthan">Rajasthan</option>
    	            <option value="Sikkim">Sikkim</option>
    	            <option value="Tamil Nadu">Tamil Nadu</option>
    	            <option value="Telangana">Telangana</option>
    	            <option value="Tripura">Tripura</option>
    	            <option value="Uttar Pradesh">Uttar Pradesh</option>
    	            <option value="West Bengal">West Bengal</option>
    	       </select></td>
    	   
    	           
    	        </form>`;
    }
}
function cancel() {
    location.reload(true);
}
function update(k) {

    let upstrid = "UpdateStrId=" + k;
    document.cookie = upstrid;
    let ele = document.getElementById('StrForm');
    ele.action = "UpdateStore";
    ele.submit()
}
function deleteStore() {
    if (document.querySelectorAll('input[type="checkbox"]:checked').length == 0) {
        alert("You haven't checked any record");
        return false;
    }

    var myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
    myModal.show();
    document.getElementById('deleteStr').addEventListener('click', () => {
        console.log('working');
        let ele = document.getElementById('StrForm');
        ele.action = "DeleteMultStore";
        ele.submit();

    })



}
function manage() {
    let chck = document.querySelectorAll('input[type="checkbox"]:checked').length;
    if (chck == 0) {
        alert("You haven't checked any record");
        return false;
    }
    else if (chck > 1) {
        alert("You are selected more than one record for Edit")
    }
    else {
        let ind = document.querySelector('input[type="checkbox"]:checked').value;
        window.location.href = "ManageStore.jsp?storeid=" + ind;
    }
}
function addStore() {

}



