//document.getElementById("aline").onmouseover = HelloWorld;
 document.getElementById("aline").onclick = HelloWorld;
document.getElementById("oneword").onclick = AddOne;

function HelloWorld(){
    var message = "<h1>Hello, World!</h1>";
    //alert(message);
    // below is basically print
    document.getElementById("aline").innerHTML = message; // retrieve value and embed into the HTML
    document.getElementById("outarea").innerHTML = message; // retrieve value and embed into the HTML
    //document.getElementById("areatochange").innerHTML = message; // retrieve value and embed into the HTML
}

function AddOne(){
    var loc = document.getElementById("oneword"); // we can use this to store a location
    var count;
    //count = loc.innerHTML;
    count = document.getElementById("oneword").innerHTML;
    count++;
    if (count > 10){
        count = 0;
    }
    document.getElementById("oneword").innerHTML = count;
}
