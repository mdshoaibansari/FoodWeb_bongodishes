function edit_row(no)
{
 document.getElementById("edit_button"+no).style.display="none";
 document.getElementById("save_button"+no).style.display="block";
	
 var storeid=document.getElementById("store id_row"+no);
 var storename=document.getElementById("store name_row"+no);
 var phonenumber=document.getElementById("phone number_row"+no);
 var address=document.getElementById("address_row"+no);
 var state=document.getElementById("state_row"+no);

 

	
 var storeid_data=storeid.innerHTML;
 var storename_data=storename.innerHTML;
 var phonenumber_data=phonenumber.innerHTML;
 var address_data=address.innerHTML;
 var state_data=state.innerHTML;

 storeid.innerHTML="<input type='text' id='store id_text"+no+"' value='"+storeid_data+"'>";
 storename.innerHTML="<input type='text' id='store name_text"+no+"' value='"+storename_data+"'>";
 phonenumber.innerHTML="<input type='text' id='phone numbertext"+no+"' value='"+phonenumber_data+"'>";
 address.innerHTML="<input type='text' id='address_text"+no+"' value='"+address_data+"'>";
 state.innerHTML="<input type='text' id='statey_text"+no+"' value='"+state_data+"'>";
 
}

function save_row(no)
{
 var storeid_val=document.getElementById("store id_text"+no).value;   
 var storename_val=document.getElementById("store name_text"+no).value;
 var phonenumber_val=document.getElementById("phone number_text"+no).value;
 var address_val=document.getElementById("address_text"+no).value;
 var state_val=coument.getElementById("state_text"+no).value;

 document.getElementById("store id_row"+no).innerHTML=storeid_val;
 document.getElementById("store name_row"+no).innerHTML=storename_val;
 document.getElementById("phone number_row"+no).innerHTML=phonenumber_val;
 document.getElementById("address_row"+no).innnerHTML=address_val;
 document.getElementById("state_row"+no).innnerHTML=state_val;

 document.getElementById("edit_button"+no).style.display="block";
 document.getElementById("save_button"+no).style.display="none";
}

function delete_row(no)
{
 document.getElementById("row"+no+"").outerHTML="";
}

