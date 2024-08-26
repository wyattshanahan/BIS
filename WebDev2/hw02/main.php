<!doctype html>
<html lang="en">
<head>
  <title> Homework 2 - XML </title>
  <link rel="stylesheet" href="style.css"> 
  <!-- ----------------------------------
			BIS2523 Documentation
   Name:
   Netid:
   Date:
   
   Variables used:
      <$totalprice> <counter variable for total price>
      <$totalquantity> <counter variable for total quantity>
      <$xml>  <store data from XML document>
      <$item> <each item of the xml when being iterated over>
      <$lineprice> <price * quantity of each item>
  
   -------------------------------------  -->
</head>
<body>
    <table>
        <tr>
            <th>Item</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Line Price</th>
        </tr>
<?
    $totalprice = 0; // initialise variable
    $totalquantity = 0; // initialise variable
    $xml = simplexml_load_file("purchasing.xml");
    foreach ($xml->item as $item){
        if ($item->quantity > 0 ){
            $lineprice = $item->quantity * $item->price;
            $totalprice = $totalprice + $lineprice;
            $totalquantity = $totalquantity + $item->quantity;
            print"<tr>
                <td>$item->name</td>
                <td>$item->price</td>
                <td>$item->quantity</td>
                <td>$lineprice</td>
            </tr>";
        }
    }
    print"<tr>
        <td colspan='2' id='colspan'>Totals:</td>
        <td>$totalquantity</td>
        <td>$totalprice</td>
    </tr>";
?>
</body>
</html>
