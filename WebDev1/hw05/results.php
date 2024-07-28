<!doctype html>
<html lang="en">
<head>
  <title>Results</title>
  <meta name="viewport" content="width=device-width"> <!--make page adjust to device screen size-->
  <meta name="author" content="Wyatt Shanahan" />
  <link rel="stylesheet" href="style.css"> 
  <link rel="icon" type="image/x-icon" href="vibin.gif"> <!-- set icon-->
  <!-- ----------------------------------
			BIS1523/BIS2523 Documentation
   Name:Wyatt Shanahan
   Netid:wls219
   Date: 30 Jan 2024
   
   Variables used:
      $rate  <population growth rate>
      $i <iterator>
      $curr <current starting population>
      $years <number of years to calculate for, used as end of iteration>
      $dataOK <boolean for checking input validity>
      $prevpop <store previous population>
      $change <store change in population>
      $yearcal <store each year in for loop>
      $intcurr <integer version of current population for output>
      
  
   -------------------------------------  -->
</head>
<body>
    <h1 id="header">Population Growth Projection Results</h1> <!--header-->
    <?
    $rate = $_POST['rate'];
    $curr = $_POST['curr'];
    $years = $_POST['years'];
    $dataOK = true; /*initialise variable*/
    $curr = str_replace(',', '',$curr); //strip any commas out to use number for math and comparisons
    $rate = str_replace('%','',$rate);//remove % sign to validate and use for maths
    if ((!is_numeric($rate)) or (!is_numeric($curr)) or (!is_numeric($years))){ /*if any not a number, then set bool to false and output error message*/
        $dataOK = false;
        print "Invalid input. Please ensure you are entering only numbers.";
        print "<br /> <br />";
        ?>
            To go back, <a href="main.html">Click here.</a>
        <? 
    }
    if ($dataOK==true){
            $rate = (float)$rate . '%';
        ?>
        <h4 id="information">
            <?
            print "Starting Population: $curr <br />";
            print "Growth Rate: ".number_format($rate,2);
            print "%";
            print " <br /> <br />";
            ?>
            To perform another calculation <a href="main.html">click here.</a>
            </h4>
            <br />
            <?
            print"<table>
                <tr>
                    <th>Year</th>
                    <th>Population</th>
                    <th>Change</th>
                    </tr>";
            for ($i = 1; $i <= $years; $i++){
                $prevpop = $curr; //set prevpop to curr to store pop from previous year
                $curr = $curr + ($curr * ($rate/100));
                $change = round($curr - $prevpop,0);
                $intcurr = round($curr,0);
                $yearcal = 2024+$i;
                print "<tr>
                        <td>$yearcal</td>
                        <td>$intcurr</td>
                        <td>$change</td>
                    </tr>";
            }
            print "</table>";
    }
            ?>
    </body>
</html>
