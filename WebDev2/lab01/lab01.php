<!doctype html>
<META HTTPEQUIV="CACHECONTROL" CONTENT="NOCACHE">
<meta httpequiv="expires" content="0" />
<html lang="en">
<head>
  <title> </title>
  <link rel="stylesheet" href="lab01.css">
</head>
<body>
<section id="input_area">

    <form action="lab01.php" method="post">
        Enter in a range of populations to search for: 
<?
        print "
        <p> Minimum Population: <input type=\"text\" name=\"min\" size=\"10\" value=\"$_POST[min]\" /> </p>
        <p> Maximum Population: <input type=\"text\" name=\"max\" size=\"10\" value=\"$_POST[max]\" /> </p>
        ";
?>        
        <input type="submit" value="Submit" />
    </form>

</section>

<section id="output_area">

<? 
        $min = $_POST['min'];
        $max = $_POST['max'];
        $total = 0;
    
        $names = file("names.txt", FILE_IGNORE_NEW_LINES);
        $pops = file("pops.txt", FILE_IGNORE_NEW_LINES);
        
        print "<table>
                    <tr>
                        <th>Country</th>
                        <th>Population</th>
                    </tr>";
                    
        foreach ($names as $i=>$name) {
            if (!is_numeric($max) and is_numeric($min) and ($pops[$i] > $min)) {
            print "<tr>
                    <td>$name</td>
                    <td>$pops[$i]</td>
                   </tr>";
            $total += $pops[$i];
            }
            if (!is_numeric($min) and is_numeric($max) and ($pops[$i] < $max)) {
            print "<tr>
                    <td>$name</td>
                    <td>$pops[$i]</td>
                   </tr>";
            $total += $pops[$i];
            }
            if (is_numeric($min) and is_numeric($min) and ($pops[$i] > $min) and ($pops[$i] < $max)) {
            print "<tr>
                    <td>$name</td>
                    <td>$pops[$i]</td>
                   </tr>";
            $total += $pops[$i];
            }
        }            
        print "<tr>
                <td><b> Total Population </b></td>
                <td>$total</td>
                </tr>";            
        print "</table>";
?>
</section>

</body>
</html>
