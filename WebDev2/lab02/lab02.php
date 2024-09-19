<!doctype html>
<html lang="en">
<head>
  <title>Lab 02 - Simple XML Example</title>
  <link rel="stylesheet" href="lab02.css">
</head>
<body>
<form name="cont" method=post action="lab02.php">
	<input type="radio" name="cont" value="Africa"> Africa </input> <br />
	<input type="radio" name="cont" value="Australia/Oceania"> Australia/Oceania </input><br />
	<input type="radio" name="cont" value="Europe"> Europe</input><br />
	<input type="radio" name="cont" value="North America"> North America </input><br />
	<input type="radio" name="cont" value="South America"> South America</input>   <br />
	<button id="Button">Search</button>

</form>
<div id="outarea"> 
<?php

    print "<table>
             <tr>
                 <th>Name</th>
                 <th>Pop</th>
                 <th>Area</th>
				 <th>Density</th>
             </tr>"; 
    $xml = simplexml_load_file("un.xml");
    foreach ($xml->country as $un_country){ // un_country is an iterator // ".$var." to escape print
        if($un_country->continent == $_POST['cont']){
            $density = $un_country->pop*1000000/$un_country->area;
            $total_pop += $un_country->pop;
            $total_area += $un_country->area;
            print "<tr>
                    <td>$un_country->name</td>
                    <td>$un_country->pop</td>
                    <td>$un_country->area</td>
                    <td>".number_format($density,2)."</td>
                   </tr>";
        }
    }
    print "<tr>
            <td></td>
            <td>Total Pop: $total_pop</td>
            <td>Total Area: $total_area</td>
            <td></td>
            </tr>";
    print "</table> <br />";
    	
   
?>
</div>
</body>
</html>
