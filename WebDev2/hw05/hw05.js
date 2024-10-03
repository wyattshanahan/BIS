window.addEventListener("load", link_events);

function link_events(){
    document.forms["inputForm"]["submitButton"].onclick = Calculate();
}

function Calculate(){
    // input
    //var temp = "ello";
    var units = document.forms["inputForm"]["units"].value; // the moment i try to set var from doc.forms, it force reloads
    var temp = document.forms["inputForm"]["temp"].value;
    
    // data validation
    var dataValid = true;
    if (isNaN(temp)){
        alert("Temperature should be numeric");
        dataValid = false;
    }
    //alert("bonjour");
    document.getElementById("results").innerHTML = "Hello";
    
    return false;
}

