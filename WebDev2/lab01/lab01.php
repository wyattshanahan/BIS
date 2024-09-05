<!doctype html>
<META HTTPEQUIV="CACHECONTROL" CONTENT="NOCACHE">
<meta httpequiv="expires" content="0" />
<html lang="en">
<head>
  <title> </title>
  <link rel="stylesheet" href="lab01.css">
</head>
<body>
<section id="input_area">

	<form action="lab01.php" method="post">
		Enter in a range of populations to search for: 
<?
		print "
		<p> Minimum Population: <input type=\"text\" name=\"min\" size=\"10\" value=\"$_POST[min]\" /> </p>
		<p> Maximum Population: <input type=\"text\" name=\"max\" size=\"10\" value=\"$_POST[max]\" /> </p>
		";
?>		
		<input type="submit" value="Submit" />
	</form>

</section>

<section id="output_area">

<? 
  
?>
</section>

</body>
</html>
