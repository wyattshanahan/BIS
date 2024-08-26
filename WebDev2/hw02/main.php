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
      <$xml>  <store data from XML document>
  
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
    $xml = simplexml_load_file("purchasing.xml");
    foreach ($xml->item as $item){
        if ($item->quantity > 0 ){
            $lineprice = $item->quantity * $item->price;
            print"<tr>
                <td>$item->name</td>
                <td>$item->price</td>
                <td>$item->quantity</td>
                <td>$lineprice</td>
            </tr>";
        }
    } 
?>
</body>
</html>
