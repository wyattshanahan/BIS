// also calculate overall # of items ordered, and total price

/* link events to functions when window loads*/
document.forms.form1.submit.onclick=clickHandler;

var xhr; // global var to hold xmlHttpRequest
function clickHandler() {
    xhr = new XMLHttpRequest();
    xhr.addEventListener("readystatechange", showFile);
    xhr.open("GET", "purchase.json")
    xhr.send();
    
    
    
    return false; // disable php
}


function showFile() {
   var outstring = "<table><tr><th>Product</th><th>Quantity</th><th>Unit Price</th><th>Total Price</th></tr>";
   if (xhr.readyState == 4 && xhr.status == 200){//wait until file here  readyState 4 means complete file
    var products = JSON.parse(xhr.responseText).inventory; // in JS, not a huge issue to repetitively declare since it'll just overwrite previous version
    var i;
    var linetotal;
    var itemTotal = 0;
    var priceTotal = 0;
    for (i=0;i<products.length;i++){
        var name = products[i].name;
        var quantity = parseInt(products[i].quantity);
        var price = parseFloat(products[i].price);
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

