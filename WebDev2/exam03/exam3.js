// make button clickable
    document.forms.form1.submit.onclick = drawTable; 

function drawTable() {
    // force rows to be numeric with parseInt
    var rows = parseInt(document.forms.form1.rows.value);
    var i; // used for looping
    var calc = 0;
    var dataOk = true;
    if (!rows || isNaN(rows)){ // !var checks if empty
        alert("Rows must be a number");
        dataOk = false;
    }
    if (!document.forms.form1.calculation.value){
        alert("Select a calculation");
        dataOk = false;
    }
    if (dataOk){
    var tableString = "<table>" +
                        "<tr>" + 
                        "<th>Number</th>";
        switch(document.forms.form1.calculation.value){
            case "squared":
                tableString+= "<th>Squared</th>";
                break;
            case "cubed":
                tableString+= "<th>Cubed</th>";
                break;
            case "quartic":
                tableString+= "<th>Quartic</th>";
                break;
        }
        tableString += "</tr>";
    for (i=1; i <= rows; i++){
        tableString+="<tr>" + "<td>" + i + "</td>"; // from here, add td value and end row
        switch(document.forms.form1.calculation.value){
            case "squared":
                calc = i*i;
                tableString+= "<td>" + calc + "</td>"+ "</tr>";
                break;
            case "cubed":
                calc =  i*i*i;
                tableString+= "<td>" + calc + "</td>"+ "</tr>";
                break;
            case "quartic":
                calc = i*i*i*i;
                tableString+= "<td>" + calc + "</td>"+ "</tr>";
                break;
        }
    }
    tableString += "</table";
    document.getElementById("outarea").innerHTML=tableString;
    }

    return false; // disable php
}