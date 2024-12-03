// also calculate overall # of items ordered, and total price

/* link events to functions when window loads*/
window.onload=clickHandler;
var xhr; // global var to hold xmlHttpRequest
function clickHandler() {
    xhr = new XMLHttpRequest();
    xhr.addEventListener("readystatechange", showFile);
    xhr.open("GET", "airports.json")
    xhr.send();
    return false; // disable php
}


function showFile() {
   var outstring = "<table><tr><th>Code</th><th>Location</th><th>Latitude</th><th>Longitude</th></tr>";
   if (xhr.readyState == 4 && xhr.status == 200){//wait until file here  readyState 4 means complete file
    var airports = JSON.parse(xhr.responseText).airport; // in JS, not a huge issue to repetitively declare since it'll just overwrite previous version
    var i;
    var code; //store iata code
    var city; //store city
    var state; // store airport state
    var lat; // store latitude
    var long; // store longitude
    for (i=0;i<airports.length;i++){
        code = airports[i].iata;
        city = airports[i].city;
        state = airports[i].state;
        lat = airports[i].lat;
        long = airports[i].long;
        outstring += "<tr>" +
                    "<td>" + code + "</td>" +
                    "<td>" + city + ", " + state + "</td>" +
                    "<td>" + lat + "</td>" +
                    "<td>" + long + "</td>" +
                    "</tr>";
        }
   }
   outstring += "</table>";
   document.getElementById("outarea").innerHTML = outstring; 
	// not triggered by button click so no need to return false
}

