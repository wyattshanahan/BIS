// make button clickable

document.forms.form1.submit.onclick = calculate;

function calculate(){
    //accept input
    var radius = document.forms.form1.radius.value;
    var height = document.forms.form1.height.value;
    var shape = document.forms.form1.shape.value;
    var dataOk = true;
    var result;
    // data validation
    if (!radius || isNaN(radius)){ // !var checks if empty
        alert("Radius must be a number");
        dataOk = false;
    }
    
    if (!height || isNaN(height)){
        alert("Height must be a number");
        dataOk = false;
    }
    
    if (!shape){
        alert("Select a shape");
        dataOk = false;
    }
    //calculations
    if (dataOk){
        if (shape == "cone"){
            result = Math.PI*radius*radius+Math.PI*radius*Math.sqrt(height*height+radius*radius);
        }
        if (shape == "cylinder"){
            result = 2*height*radius*Math.PI+Math.PI*radius*radius;
        }
        if (shape == "capsule"){
            result = 2*Math.PI*height*radius*radius+2*Math.PI*radius*height;
        }
        
        document.getElementById("outarea").innerHTML = "Surface area of a " + shape + " with radius " + radius + " and height " + height + " is " + result.toFixed(2);
    }
    
    
    //output
    
    return false; // disable php
}
