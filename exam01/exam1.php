<!doctype html>
<html lang="en">
<head>
  <title>Exam 1 - Output</title>
  <meta name="viewport" content="width=device-width"> <!--make page adjust to device screen size-->
  <meta name="author" content="Wyatt Shanahan" />
  <link rel="stylesheet" href="exam1.css"> 
  <!-- ----------------------------------
			BIS1523/BIS2523 Documentation
   Name: Wyatt Shanahan
   Netid: wls219
   Date: 07 Feb 2024
   
   Variables used:
      $userID  userID as per the text input box
      $classID class input from radio 
  
   -------------------------------------  -->
</head>
<body> <!-- other colour: 00805b -->
    <!--<h1 id="header">Product Feedback Receipt</h1> <!--header--> 
    <section id="output">
    <?
    $userID = $_POST['userID'];
    $classID = $_POST['classID'];
    print "Userid Entered: $userID <br />";
    print "Section entered: $classID";
    ?>
    </section>
    </section>
</body>
</html>