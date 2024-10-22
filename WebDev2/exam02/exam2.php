<!doctype html>
<html lang="en">
<head>
  <title> </title>
  <link rel="stylesheet" href="exam2.css">
</head>
<body>
<table>

	<tr>
		<th> Course Code </th>
		<th> Description </th>
		<th> Department </th>
		<th> Semesters Offered </th>
    </tr>
<?

    // exam 2: table printing course code, desc, dept, and semesters offered
    // courseQuery finds course information
    // semQuery is nested to find semesters offered for each course
	// open connection to database
    $dbc = new mysqli("localhost", "student", "password", "university");
    
	// Query the database
    $courseQuery = "SELECT * FROM courses INNER JOIN department ON dept=dept_code";
    $courseResult = $dbc->query($courseQuery);
    
    while ($courseRow = $courseResult->fetch_assoc()){
        print "<tr>
            <td>$courseRow[dept] $courseRow[code]</td>
            <td>$courseRow[description]</td>
            <td>$courseRow[name]</td>
            <td>";
            // find unique semesters offered
            $semQuery = "SELECT DISTINCT semester FROM courses_taken WHERE taken_course = $courseRow[course_id]"; // distinct removes duplicate values of semester
            // exam should be able to use SELECT DISTINCT *
            $semResult = $dbc->query($semQuery);
            while ($semRow = $semResult->fetch_assoc()){ // nested query is calling this while loop from inside the while on line 25
                print"$semRow[semester]<br />";
            }
            print"</td>
        </tr>";
    }
	// loop through all the rows one at a time and print them out


?>

</body>
</html>
