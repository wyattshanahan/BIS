<!doctype html>
<html lang="en">
<head>
  <title>Exam 1 - Lumen Results</title>
  <meta name="viewport" content="width=device-width"> <!--make page adjust to device screen size-->
  <meta name="author" content="Wyatt Shanahan" />
  <link rel="stylesheet" href="exam1.css"> 
  <!-- ----------------------------------
			BIS1523/BIS2523 Documentation
   Name: Wyatt Shanahan
   Netid: wls219
   Date: 07 Feb 2024
   
   Variables used:
      $colour input colour choice
      $wattage input wattage
  
   -------------------------------------  -->
</head>
<body> <!-- other colour: 00805b -->
    <h1 id="header">Product Feedback Receipt</h1> <!--header-->
    <section id="output">
    <?
    $wattage = $_POST['wattage'];
    $colour = $_POST['colour'];
    print "The wattage was $wattage and the colour was $colour."
    ?>
    </section>
    </section>
</body>
</html>
