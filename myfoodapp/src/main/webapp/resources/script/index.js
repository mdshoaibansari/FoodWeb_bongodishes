var placeSearch, autocomplete;


var componentForm = {
  autocomplete: ['street_number', 'route'],
  inputCity: 'locality',
  inputState: 'administrative_area_level_1',
  inputZip: 'postal_code',
  inputCounty: 'administrative_area_level_2',
  inputCountry: 'country'
};


function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */ (document.getElementById('autocomplete')),
      {type: ['geocode']});

  
  autocomplete.addListener('place_changed', fillInAddress);
}


function fillInAddress() {

  
  var place = autocomplete.getPlace();
  console.log(place);
  

  for (var component in componentForm) {
    document.getElementById(component).disabled = false;
    document.getElementById(component).value = search(componentForm[component], place.address_components);
  }

  
  if (search("street_number", place.address_components) != "") {
    document.getElementById("autocomplete").value = search("street_number", place.address_components) + " ";
  }
  document.getElementById("autocomplete").value += search("route", place.address_components);
  
  
  function search(type, placeObject) {
    for (var i = 0; i < placeObject.length; i++) {
      if (placeObject[i].types[0] === type) {
        return placeObject[i].short_name;
      } else if (i === placeObject.length - 1) {
        return "";
      }
    }
  }
}
