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
   Name:
   Netid:
   Date: 26 September 2024
   
   Variables used:
      $dbc  <store DB connexion>
      $query <store SQL query prior to execution>
      $courses <store mysql object from courses>
      $row < iterator for sql objects>
      $button <used to form string for radio buttons>
      $buttonval <used to store course ids>
      $sel <store selection from button>
      $tcResult < store result from taken_course>
      $grades <array to store grades>
      $studentNums <array to store student ID nums>
      $studentList <sql object of student db>
      $studentnames <array storing student names matched from taken_student>
  
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
            $query = "SELECT * FROM courses_taken WHERE taken_course = $sel";
            $tcResult = $dbc->query($query);
            if (!$tcResult){ // troubleshooting, throw an error if query fails
                die("Query failed: " . $dbc->error);
            }
            $grades = array(); // create array to store grades
            $studentNums = array();
            while ($row = $tcResult->fetch_assoc()){ // iterate over the funny values
              $grades[]=$row['grade']; // store grades in $grades array
              $studentNums[]=$row['taken_student']; // add studentIDs to search for
            }
            $query = "SELECT * FROM student";
            $studentList = $dbc->query($query);
            $studentNames = array(); // create array to store names
            while ($row = $studentList->fetch_assoc()){
                if (in_array($row['student_id'], $studentNums)){
                    $studentNames[]=$row['fname'].' '.$row['lname'];
                }
            }
            print "<table> <tr>
            <th>Name</th>
            <th>Grade</th>
            </tr>";
            for ($i = 0; $i < count($studentNames); $i++){
                print"<tr>
                <td>$studentNames[$i]</td>
                <td>$grades[$i]</td>
                </tr>";
            }
            print"</table>";
        }
        ?>
    </div>
</body>
</html>
