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
   Date:28 Jan 2024
   
   Variables used:
      $inputA <first number input>
      $inputB <second number input>
      $inputC <third number input>
      $dataOK <boolean flag if data valid/not>
      $result <final result>
      $largest <return val of getLargest()>
  
   -------------------------------------  -->
</head>
<body>
    <h1 id="header">Largest Number Result</h1> <!--header-->
    <?
    function getLargest($inputA, $inputB, $inputC){ // use input vals
        $largest = $inputA; // set largest to A
        if ($largest<$inputB){ // if B>largest, then set largest to B
            $largest=$inputB;
        }
        if ($largest<$inputC){ // if C>largest, then set largest to C
            $largest=$inputC;
        }
        return $largest; // return largest
    }
    $inputA = $_POST['inputA'];
    $inputB = $_POST['inputB'];
    $inputC = $_POST['inputC'];
    $dataOK = true; /*initialise variable*/
    $inputA = str_replace(',', '',$inputA); //strip any commas out to use number for math and comparisons
    $inputB = str_replace(',', '',$inputB); //strip any commas out to use number for math and comparisons
    $inputC = str_replace(',', '',$inputC); //strip any commas out to use number for math and comparisons
    if ((!is_numeric($inputA)) or (!is_numeric($inputB)) or (!is_numeric($inputC))){ /*if any not a number, then set bool to false and output error message*/
        $dataOK = false;
        print "Invalid input. Please ensure you are entering only numbers.";
        print "<br /> <br />";
    }
    if ($dataOK==true){ // if all numbers are acceptable and cleaned then do this
        $return = getLargest($inputA, $inputB, $inputC);
        print "Max number entered is: $return";
    }
        ?>
        <br />
        <br />
    <img id="oilers" src="oilers.gif" alt="a dancing guy" height="300px" width="300px"/>
</body>
</html>