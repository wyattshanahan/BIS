window.addEventListener("load", link_events);

function link_events(){
    document.getElementById("submitButton").onclick = Calculate;
}

function Calculate(){
    // input
    var units = document.forms["inputForm"]["units"].value; 
    var temp = document.forms["inputForm"]["temp"].value;
    var output = " ";
    // data validation
    var dataValid = true;
    if (isNaN(temp)){
        alert("Temperature should be numeric");
        dataValid = false;}
    // verify if scale is checked
    if (!units){
        alert("Scale must be selected");
        dataValid = false;
    }
    if (!(isNaN(temp))){
        if (units === "C"){ // F to C
            output = (temp -32) * 5 / 9;   
        }
        else if(units === "F"){ // C to F
            output = temp * 9/5 + 32;
        }
        else{
            output = "Failed to parse radio input";
        }
    }
    document.getElementById("results").innerHTML = "<h2>Temperature is: " + output.toFixed(1) + "</h2>"; // toFixed does rounding
    
    return false; // prevent php from reloading
}
