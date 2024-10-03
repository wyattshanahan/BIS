<!doctype html>
<html lang="en">
<head>
  <title>Student Gradebook</title>
  <meta name="viewport" content="width=device-width"> <!--make page adjust to device screen size-->
  <meta name="author" content="Wyatt Shanahan" />
  <link rel="stylesheet" href="style.css"> 
  <link rel="icon" type="image/x-icon" href="vibin.gif"> <!-- set icon-->
  <!-- ----------------------------------
			BIS2523 Documentation
   Name: WYATT SHANAHAN
   Date: 26 September 2024
   
   Variables used:
      $dbc  <store DB connexion>
      $query <store SQL query prior to execution>
      $courses <store mysql object from courses>
      $row < iterator for sql objects>
      $button <used to form string for radio buttons>
      $buttonval <used to store course ids>
      $sel <store selection from button>
      $Result < store result from query>
      $grade <store grade for printing>
      $name <store name for printing
  
   -------------------------------------  -->
</head>
<body>
        <h1 id="header">Homework 4</h1>
    <form id="input" method="post" action = "main.php">
        <?
        $dbc = new mysqli("localhost", "student", "password", "university"); // db connexion
        $query = "select * from courses";
        $courses = $dbc->query($query); // can use printr to iterate over an array

    while ($row = $courses->fetch_assoc()){ // iterate over the funny values
        $button = $row['dept'].' '.$row['code']; // build external button
        $buttonval = $row['course_id'];
        print "<input type='radio' name = 'course' value = $buttonval>$button<br />"; // output buttons
    }
    print "<br />
    <input type='submit' name='Submit' value='Submit'>";
        ?>
    </form>
    <div id="output">
        <?
        $sel = $_POST['course'];
        if ($sel != ""){
            $query = "SELECT * FROM courses_taken INNER JOIN student ON courses_taken.taken_student = student.student_id WHERE courses_taken.taken_course = $sel";
            $Result = $dbc->query($query);
            if (!$Result){ // troubleshooting, throw an error if query fails
                die("Query combo failed: " . $dbc->error);
            }
            print "<table> <tr>
                <th>Name MULTI</th>
                <th>Grade</th>
                </tr>";
            while ($row = $Result->fetch_assoc()){
                $grade = $row['grade'];
                $name = $row['fname'].' '.$row['lname'];
                print "<tr>";
                print "<td>$name";
                print "<td>$grade";
                print "</tr>";
            }
            print"</table>";
        }
        ?>
    </div>
</body>
</html>
