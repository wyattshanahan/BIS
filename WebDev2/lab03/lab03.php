<!doctype html>
<html lang="en">
<head>
  <title> </title>
  <link rel="stylesheet" href="lab03.css">
</head>
<body>

<section id="leftcol">
	<form method="post" action="lab03.php"> 
	   <h2>Population Search:</h2>  Upper Bound <input type="text" size="5" name="ub"> 
	   Lower Bound <input type="text" size="5" name="lb"> 
	   <input type="submit" value="submit">
	</form>
</section>

<section id="rightcol">
<table>
	<tr>
		<th> Name </th>
		<th>Continent</th>
		<th>Population </th>
		<th>Area</th>
    </tr>
<?
//    database information: name: un, table: countries, columns: continent, name, pop, area
    $ub = $_POST['ub'];
    $lb = $_POST['lb'];
    
    $dbc = new mysqli("localhost", "student", "password", "un");
    $query = "SELECT * FROM countries";
    
    if ($ub > 0){
        $query = "SELECT * FROM countries WHERE pop <= $ub";
    }
    
    if ($lb > 0){
        $query = "SELECT * FROM countries WHERE pop >= $lb";
    }
    
    if ($ub > 0 and $lb > 0){
        $query = "SELECT * FROM countries WHERE pop <= $ub AND pop >= $lb";
    }
    
    $result = $dbc->query($query);
    
    if (!$result){ // if error, then die
        print $dbc->error;
        die();
    }
    while ($row = $result->fetch_assoc()){
        $count++;
        $total_pop += $row['pop'];
        print "<tr>
                <td>$row[name]</td>
                <td>$row[continent]</td>
                <td>$row[pop]</td>
                <td>$row[area]</td>
                </tr>";
    }
    print "</table>";
    print "$count countries found :)";
    print "Total pop: $total_pop";
?>

</section>
</table>
</body>
</html>
