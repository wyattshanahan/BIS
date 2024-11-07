// make button clickable
    document.forms.form1.submit.onclick = drawTable; 

function drawTable() {
    // force rows to be numeric with parseInt
    var rows = parseInt(document.forms.form1.rows.value);
    var i; // used for looping
    
    var tableString = "<table>" +
                        "<tr>" + 
                        "<th>Sequence</th>"+
                        "<th>S-1</th>"+
                        "<th>S-2</th>"+
                        "</tr>";
    var seq=0;
    var num1 = 1;
    var num2 = 0;
    for (i=1; i <= rows; i++){
        seq = num1+num2;
        tableString += "<tr>" +
                        "<td>"+seq+"</td>"+
                        "<td>"+num1+"</td>"+
                        "<td>"+num2+"</td>"+
                        "</tr>";
                        num2 = num1;
                        num1 = seq;
    }
    tableString += "</table";
    document.getElementById("outarea").innerHTML=tableString;


    return false; // disable php
}
