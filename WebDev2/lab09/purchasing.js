// process  purchase.xml
// Columns in Table:
// item name
// quantitiy ordered
// unit price
// price for this item

// also calculate overall # of items ordered, and total price

/* link events to functions when window loads*/
document.forms.form1.submit.onclick=clickHandler;

var xhr; // global var to hold xmlHttpRequest
function clickHandler() {
    xhr = new XMLHttpRequest();
    xhr.addEventListener("readystatechange", showFile);
    xhr.open("GET", "purchase.xml")
    xhr.send();
    
    
    
    return false; // disable php
}


function showFile() {
   var outstring = "<table><tr><th>Product</th><th>Quantity</th><th>Unit Price</th><th>Total Price</th></tr>";
   if (xhr.readyState == 4 && xhr.status == 200){//wait until file here  readyState 4 means complete file
    var products = xhr.responseXML.getElementsByTagName("product"); // in JS, not a huge issue to repetitively declare since it'll just overwrite previous version
    var i;
    var linetotal;
    var itemTotal = 0;
    var priceTotal = 0;
    for (i=0;i<products.length;i++){
        var name = products[i].getElementsByTagName("name")[0].firstChild.textContent;
        var quantity = parseInt(products[i].getElementsByTagName("quantity")[0].firstChild.textContent);
        var price = parseFloat(products[i].getElementsByTagName("price")[0].firstChild.textContent);
        linetotal = price * quantity;
        if (quantity > 0){
        outstring += "<tr>" +
                    "<td>" + name + "</td>" +
                    "<td>" + quantity + "</td>" +
                    "<td>" + price + "</td>" +
                    "<td>" + linetotal + "</td>" +
                    "</tr>";
                itemTotal += quantity;
                priceTotal += linetotal;
        }
    }
   }
   outstring += "</table>" + "Items ordered: " + itemTotal + "<br />" + "Total Cost: $" + priceTotal.toFixed(2);
   document.getElementById("outarea").innerHTML = outstring; 
	// not triggered by button click so no need to return false
}

