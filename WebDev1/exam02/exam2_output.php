<!doctype html>
<html lang="en">
<head>
  <title>  </title>
  <link rel="stylesheet" href=""> 
  <!-- ----------------------------------
			BIS1523/BIS2523 Documentation
   Name: Wyatt Shanahan
   Netid: WLS219
   Date: 04 March 2024
   
   Variables used:
      $num  <number input from the text box>
      $operation <stores the operation, as per the radio buttons>
      $dataOK <boolean flag variable for data validation>
      $output <stores the output of the calculation>
  
   -------------------------------------  -->
</head>
<body>
<h1>Results</h1>
<?
    $num = $_POST['numIn'];
    $operation = $_POST['convert'];
    $dataOK = true; //initialise bool
    
    if (!is_numeric($num)){
        $dataOK = false;
        print "Error in inputs. <br />";
    }
    
    if (!isset($operation)){
        $dataOK = false;
        print "Error in inputs. <br />";
    }
    
    if ($dataOK){
        if($operation == 'YardMetre'){
            $output = $num * 0.9144;
            print"$num in yards is  ".number_format($output,2);
            print" meters. <br />";
        }
        if($operation == 'PoundKg'){
            $output = $num * 0.454;
            print"$num Pounds is  ".number_format($output,2);
            print" Kilograms. <br />";
        }
        if ($operation == 'QuartLitre'){
            $output = $num * 0.946;
            print"$num Quarts is  ".number_format($output,2);
            print" Liters. <br />";
        }
    }
?>
</body>
</html>
