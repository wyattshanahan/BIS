<!doctype html>
<html lang="en">
    <!--LAB 1: USER INPUT 5FEB2024-->
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
   Date:
   
   Variables used:
      $var  <what var does>
      
  
   -------------------------------------  -->
</head>
<body style="background-image:linear-gradient(to left,#186118,#3eb489,#186118)"> <!-- other colour: 00805b -->
    <h1 id="header">Results</h1> <!--header-->
    <?
    $fname=$_POST['fname'];
    $class=$_POST['class'];
    $drink=$_POST['drink'];
    $comments=$_POST['comments'];
    print "First Nom: $fname <br />";
    print "Class: $class <br />";
    print "Drink of choice: $drink <br />";
    print "Comments: $comments <br />";
    ?>
</body>
</html>