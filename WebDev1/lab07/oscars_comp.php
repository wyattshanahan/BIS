<!doctype html>
<html lang="en">
<head>
  <title>  </title>
  <link rel="stylesheet" href="oscars.css"> 
  <!-- ----------------------------------
  BIS1523 Documentation
   Name:
   Netid:
   Date:

   Variables used:
      <variable name>  <description of data variable will hold>

   -------------------------------------  -->
</head>
<body>
<h1>Awards Search</h1>
<section id="leftcol">
    <form method="get" action="oscars_comp.php">
        Starting Year: <input type="text" name="startyear" size="4"> <br />
    Ending Year: <input type="text" name="endyear" size="4"> <br />
        <input type="submit" name="submit" value="submit">
    </form>
</section>

<section id="rightcol">
<?
    $years = file("years.txt", FILE_IGNORE_NEW_LINES);
    $actresses = file("actresses.txt", FILE_IGNORE_NEW_LINES);
    $actors = file("actors.txt", FILE_IGNORE_NEW_LINES);
    $min = $_GET["startyear"];
    $max = $_GET['endyear'];
    //1928-2016
    if($min >= 1928 && $max <= 2016){
    print "<table>
            <tr>
                <th>Year</th>
                <th>Actress</th>
                <th>Actor</th>
                </tr>";

    foreach($years as $i=>$curryear){
        if($curryear >= $min && $curryear <= $max){
        print "<tr>
                <td>$curryear</td>
                <td>$actresses[$i]</td>
                <td>$actors[$i]</td>
                </tr>";
        }
    }
}
else{
    print "Invalid years: Only years 1928 to 2016 are supported at this time";
}
?>    

</section>


</body>
</html>
