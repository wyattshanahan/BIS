window.addEventListener("load", link_events, false);

function link_events(){
    document.getElementById("calc").onclick = Calculate;
}

function Calculate(){
    // input
    //var temp = "ello";
    //var unit = document.forms["inputForm"]["units"].value; // the moment i try to set var from doc.forms, it force reloads
    //var temp = document.forms["inputForm"]["temp"].value;
    //alert(temp);
    document.getElementById("results").innerHTML = "Hello";
    return false;
}
