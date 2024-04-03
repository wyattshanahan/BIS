<!doctype html>
<html lang="en">
<head>
  <title>  </title>
  <link rel="stylesheet" href="multtable.css"> 
  
</head>
<body>

<?  // table with 3 columns: Multiplicand  Multiplier    Product
    $starting = $_POST['starting'];
    $iterations = $_POST['iterations'];
    
    print "<h1>Multiplication Table for $starting</h1>";
    print"<table>
            <tr>
                <th>Multiplicant</th>
                <th>Multiplier</th>
                <th>Product</th>
            </tr>";
            
    for($i=1; $i<=$iterations; $i++){ //i as 1 to ensure that multiplication works correctly
        $product = $i*$starting;
        print "<tr>
                <td>$starting</td>
                <td>$i</td>
                <td>$product</td>
            </tr>";
    }

    print "</table>";
?>

</body>
</html>