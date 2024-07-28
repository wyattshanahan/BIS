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
   Name: Wyatt Shanahan
   Netid: wls219
   Date: 28 Jan 2024
   
   Variables used:
      $name  user's name
      $exam1 exam 1 score
      $exam2 exam 2 score
      $exam3 exam 3 score
      $hw1 homework 1 score
      $hw2 homework 2 score
      $hw3 homework 3 score
      $hw4 homework 4 score
      $hw5 homwork 5 score
      $avgexm exam score average
      $avghw homework score average
      $final final average
  
   -------------------------------------  -->
</head>
<body id="output">
    <h1 id="header">
    <? 
    $name = $_POST['nom']; /*post value for name from nom*/
    $exam1 = $_POST['exam1']; /* read in and assign vals for exams*/
    $exam2 = $_POST['exam2'];
    $exam3 = $_POST['exam3'];
    $hw1 = $_POST['hw1']; /*read in and assign vals for homeworks */
    $hw2 = $_POST['hw2'];
    $hw3 = $_POST['hw3'];
    $hw4 = $_POST['hw4'];
    $hw5 = $_POST['hw5'];
    print "Grade Report for $name";
    ?>
    </h1>
    <h2 id="finalavg">
        <?
        $avgexm = ($exam1 + $exam2 + $exam3)/3;/*calculate exam average*/
        $avghw = ($hw1 + $hw2 + $hw3 + $hw4 + $hw5)/5; /*calculate homework average*/
        $final = (($avgexm *.85) + ($avghw * .15)); /*calculate the final average, weighting exams at 85% and homeworks at 15%*/
        print "Your final average is: ".number_format($final,2); /* print out final, rounded to 2 digits*/
        ?>
    <img id="grade" src="grade.png" alt="a man holding a paper" height="150px" width="200 px"/>
    </h2>
    <?
    print "Your exam average is: ".number_format($avgexm, 2);
    print "<br />Your homework average is: ".number_format($avghw,2);
    ?>
    <br />
</body>
</html>
