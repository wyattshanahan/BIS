window.addEventListener("load", link_events);

function link_events(){
    document.getElementById("submitButton").onclick = Calculate;
}

function Calculate(){
    // input rate pop years
    var rate = document.forms["inputForm"]["rate"].value; 
    var pop = document.forms["inputForm"]["pop"].value;
    var years = document.forms["inputForm"]["years"].value;
    var output = ""; // initialise output
    var i = 0; // initialise i
    var outarea = document.getElementById("results");
    var prevpop;
    var change;
    var STOP = years;
    // data validation
    var dataValid = true;
    if (isNaN(rate)){
        alert("Rate should be numeric");
        dataValid = false;}
    if (isNaN(pop)){
        alert("Population should be numeric");
        dataValid = false;}
    if (isNaN(years)){
        alert("Years should be numeric");
        dataValid = false;}
    
    if (dataValid){
        pop = pop * 1; // done to force pop to be a number
        outarea.innerHTML = "<table>";
        output = "<table>";
        output += "<tr><th>Year</th><th>Population</th><th>Change</th></tr>";
        for (i=1;i<=years;i++){
            currYear = 2024+i;
            growth = pop * (rate/100);
            pop = pop + growth;
            output+="<tr><td>"+currYear+"</td>"
            +"<td>"+pop.toFixed(0)+"</td>"+
            "<td>"+growth.toFixed(0)+"</td></tr>";
        }
        output+="</table>";
        console.log(output);
        outarea.innerHTML = output;
        outarea.innerHTML += "</table>";
    }
    return false; // prevent php from reloading
}
