<!doctype html>
<html lang="en">
<head>
  <title>Exam 4</title>
  <link rel="stylesheet" href="exam4.css"> 
  <!-- ----------------------------------
   Date: 24 April 2024
   
   Variables used:
      <$fname>  <stores first name from the csv>
      <$lname> <stores last names from csv>
      <$state> <stores states from csv>
      <$zip> <stores zips from csv>
      <$data> <stores file data>
      <$row> <for counting rows when reading data>
      <$searchState> <stores what state is being queried>
  
   -------------------------------------  -->
</head>
<body>
<section id="leftcol">
  <h1></h1> <!--left blank as no header given on the exam-->
  
  <form action="exam4.php" method="post">
      Enter state to search for: <input type="text" name="inputstate" required> <br >
	<input type="submit" name="submit" value="Search" />
  </form>
</section>
<?
    $data = file("people.csv");
    $searchState = $_POST['inputstate'];
    if($searchState != ''){
        print"<section id='rightcol'>";
        print"<h2> People found for $searchState </h2><b />";
        print'<table>
            <tr>
                <th>Name</th>
                <th>Zipcode</th>
            </tr>';
    }
    
    foreach($data as $row){
        list($fname, $lname, $state, $zip) = explode(",", $row);
        if($state == $searchState){
                print"<tr>";
                print"<td>$fname $lname";
                print"<td>$zip";
                print"</tr>";
        }
        print"<row hit>";
    }
?>  
</section>
</body>
</html>
