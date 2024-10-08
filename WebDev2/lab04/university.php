<!doctype html>
<html lang="en">
<head>
  <title> </title>
  <link rel="stylesheet" href="university.css">
</head>
<body>
<section id="leftcol">
    <form action="university.php" method="post">
         Course Number: <input type="text" name="course_id"> <br />
    	 <input type="submit" name="submit" value="Search">
    </form>
</section>

<section id="rightcol">
    <table>
    
    
    
    	<tr>
    		<th> Student Name </th>
    		<th> Department </th>
    		<th> Semester </th>
        </tr>
<?
    if (is_numeric($_POST['course_id'])){
    // Program to print every student name, their department name, that failed a course

    $dbc = new mysqli("localhost", "student", "password", "university");
    $query = "SELECT * FROM student INNER JOIN department ON major=dept_code INNER JOIN courses_taken ON student_id=taken_student 
    WHERE grade='F' AND taken_course = $_POST[course_id]";
    $result = $dbc->query($query);
    while ($row = $result->fetch_assoc()){
        print " <tr>
                   <td>$row[fname] $row[lname]</td>
                   <td>$row[name]</td>
                   <td>$row[semester]</td>
                </tr>";
    }
    }
	
?>

</section>

</body>
</html>
