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
      $obj  <type of object>
      $radius <object radius>
      $height <object height>
      $dataOK <boolean flag if data valid/not>
      $result <final result>
  
   -------------------------------------  -->
</head>
<body style="background-image:linear-gradient(to left,#186118,#3eb489,#186118)"> <!-- other colour: 00805b -->
    <h1 id="header">Surface Area Results</h1> <!--header-->
<?
$dataOK = true; /*initialise bool*/
$obj = $_POST['objtype']; /*tested and confirmed 28Jan24, uses lowercase names from the radio defs*/
$radius = $_POST['radius'];
$height = $_POST['height'];
if (!isset($obj)){ /*if no radio button selected*/
    $dataOK = false;
    print "Invalid input. Please ensure you are selecting an object.";
    print "<br /> <br />";
}
if ((!is_numeric($radius)) or (!is_numeric($height))){ /*if either radius or height is not a number, then set bool to false and output error message*/
    $dataOK = false;
    print "Invalid input. Please ensure you are entering only numbers.";
    print "<br /> <br />";
}
if ($dataOK == false){ /* ensure only prints once, even if both issues arise*/
    ?>
    <img id="sad" src="sad.gif" alt="a frowning emote" height="300px" width="300px"/>
    <?
}
if ($dataOK == true){ /*using an if rather than an else as personal preference to ensure all checks passed*/
    if ($obj == 'cone'){
        $result = pi()*$radius*$radius + pi()*$radius*sqrt($height*$height+$radius*$radius); /*calculate surface area of cone*/
    }
    elseif ($obj == 'capsule'){
        $result = 2*pi()*($radius*$radius)*$height + 2*pi()*$radius*$height; /* calculate surface area of capsule*/
    }
    elseif ($obj == 'cylinder'){
        $result = 2*pi()*$radius*$height + 2*pi()*($radius*$radius); /*calculate surface area of cyl*/
    }
print "The surface area of a $obj with radius $radius and height $height is: ".number_format($result,2); /*round result*/
?>
    <img id="happy" src="happy.gif" alt="a smiley face with a thumbs up" height="300px" width="300px"/>
<?
/*output happy.gif*/
}
?>
</body>
</html>
