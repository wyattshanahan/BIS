window.addEventListener("load", link_events, false);
var xhr;
var filter;
var countries;
function link_events(){ // retrieve file
    xhr = new XMLHttpRequest();
    //xhr.addEventListener("readystatechange", ajaxRequest, false);
    xhr.open("GET","un.xml");
    xhr.send();
    document.getElementById("submitButton").onclick = showTable;
}
/*
function ajaxRequest(){
    if (xhr.readyState == 4 && xhr.status == 200){ // if file retrieved successfully
    countries = xhr.responseXML.getElementsByTagName("country"); 
    }
}*/

function showTable(){
    var i;
    var output = "<table><tr><th>Name</th><th>Population</th><th>Area</th></tr>";
    
    if (xhr.readyState == 4 && xhr.status == 200){ // if file retrieved successfully
        var countries = xhr.responseXML.getElementsByTagName("country");  // set countries by selecting from AJAX XML country
        if (document.forms["cont"]["cont"].value){ 
            filter = document.forms["cont"]["cont"].value;
        for (i=0; i<countries.length; i++){
            if (countries[i].getElementsByTagName("continent")[0].firstChild.textContent === filter){
                output += "<tr><td>" + countries[i].getElementsByTagName("name")[0].firstChild.textContent + "</td><td>" + 
                countries[i].getElementsByTagName("pop")[0].firstChild.textContent + "</td><td>" + countries[i].getElementsByTagName("area")[0].firstChild.textContent
                + "</td></tr>";
            }
        }
        output += "</table>";
        document.getElementById("results").innerHTML = output; // toFixed does rounding
            //continent = countries[i].getElementsByTagName("continent")[0].firstChild.textContent;
            //alert(filter);
                //document.getElementById("results").innerHTML = "<h2>Temperature is: " + output.toFixed(1) + "</h2>"; // toFixed does rounding
        }
    }
    return false; // prevent php from reloading
}

