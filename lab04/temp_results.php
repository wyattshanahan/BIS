<!doctype html>
<html lang="en">
<head>
  <title> Temperature Converter Results </title>
  <link rel="stylesheet" href=""> 
  <!-- ----------------------------------
			BIS1523/BIS2523 Documentation
   Name:  
   Netid:
   Date:
   
   Variables used:
      $scale is either 'F' or 'C', based on the users radio button choice
      $input is their input value
      $dataOK is a flag variable for data validation
      $temp_out is our calculated temperature
  
   -------------------------------------  -->
</head>
<body>
<h1>Results</h1>
<?	 
    $input = $_POST['temp_in'];
    $scale = $_POST['scale'];
    
    //validate data
    $dataOK = true;
    if (!is_numeric($input)){
        $dataOK = false;
        print "Temperature must be numeric. <br />";
    }
    if (!isset($scale)){
        $dataOK = false;
        print "Select a unit type. <br />";
    }
    if ($scale == 'F'){
        $output = $input * 9/5 + 32;
        print "$input in Fahrenheit is " .number_format($output, 2); 
    }
    if ($scale == 'C'){
        $output = ($input - 32) * 5/9;
        print "$input in Celcius is " .number_format($output, 2); 
    }

// C to F is X*9/5+32
// F to C is (X -32)*5/9

?>

</body>
</html>