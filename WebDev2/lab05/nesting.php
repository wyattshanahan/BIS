<!doctype html>
<html lang="en">
<head>
  <title> </title>
  <link rel="stylesheet" href="nesting.css">
</head>
<body>
<table>

	<tr>
		<th> Student Name </th>
		<th> Department </th>
		<th> Semesters Enrolled </th>
    </tr>
<?

    // Program to print every student name, their department name, and the semesters they have grades
    
	// open connection to database
    $dbc = new mysqli("localhost", "student", "password", "university");
	// Query the database
    $studentQuery = "SELECT * FROM student INNER JOIN department ON major=dept_code";
    $studentResult = $dbc->query($studentQuery);
    
    while ($studentRow = $studentResult->fetch_assoc()){
        print "<tr>
            <td>$studentRow[fname] $studentRow[lname]</td>
            <td>$studentRow[name]</td>
            <td>";
            $semQuery = "SELECT DISTINCT semester FROM courses_taken WHERE taken_student = $studentRow[student_id]"; // distinct removes duplicate values of semester
            // DISTINCT * won't work for this case since it returns both grade and semester
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
