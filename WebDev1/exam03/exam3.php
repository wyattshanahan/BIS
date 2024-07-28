<!doctype html>
<html lang="en">
<head>
  <title>  </title>
  <link rel="stylesheet" href="exam3.css"> 
    <!-- ----------------------------------
   Date: 03 Apr 2024
   
   Variables used:
      <numRows>  <number of rows to print>
      <n2>  <stores n^2>
      <n3>  <stores n^3>
      <n4>  <stores n^4>
  
   -------------------------------------  -->
</head>
<body>

<?  // table with 4 columns: N, N^2, N^3, N^4

    function printRows($numRows){ //print table rows
        for($i=1; $i<=$numRows; $i++){
            $n2 = $i*$i;
            $n3 = $n2*$i;
            $n4 = $n3*$i;
            print "<tr>
                <td>$i</td>
                <td>$n2</td>
                <td>$n3</td>
                <td>$n4</td>
            </tr>";
        }
    }
    $numRows = $_POST['nums'];
    // initialise table
    print"<table>
            <tr>
                <th>N</th>
                <th>N^2</th>
                <th>N^3</th>
                <th>N^4</th>
            </tr>";
    printRows($numRows);
    print "</table>";
    
    
?>

</body>
</html>
