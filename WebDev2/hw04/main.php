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
   Date:
   
   Variables used:
      $names  <store student names file content>
      $grades <store grades>
      $i <iterator>
      $sel <user selected grade>
  
   -------------------------------------  -->
</head>
<body>
    <form id="input" method="post" action = "main.php">
        <?
        $dbc = new mysqli("localhost", "student", "password", "university"); // db connexion
        $query = "select * from courses";
        $courses = $dbc->query($query);

    while ($row = $courses->fetch_assoc()){ // iterate over the funny values
        $buttonInt = $row['dept'].$row['code']; // build a string for each button
        $button = $row['dept'].' '.$row['code']; // build external button
        print "<input type='radio' name = 'course' value = $buttonInt>$button<br />"; // output buttons
    }
    print "<br />
    <input type='submit' name='Submit' value='Submit'>";
        ?>
    </form>
    <!-- this part below is incomplete and needs finishing
    <div id="output">
        <?
        $sel = $_POST['course'];
        if ($sel != ""){
            $query = "select * from courses_taken";
            $result = $dbc->query($query);
            print $result;
            print $query;
        print $sel;}
        ?>
    </div>
    

    
    
    
    
    <?/*
        $i = 0; //initialise i
        $names = file("student.names.txt", FILE_IGNORE_NEW_LINES); //open file
        $grades = file("student.grades.txt", FILE_IGNORE_NEW_LINES); //open/file
        $sel = $_POST['grade']; //post selection
        if ($sel != ""){
        print"<section id='gradeTable'>
        <table>";
        print" <tr>
                <th>Name</th>
                <th>Grade</th>
            </tr>";
        }
        foreach($grades as $i=>$grades[$i]){
            if ($sel == 'A' and $grades[$i] > 90){
                print"<tr>";
                print"<td> $names[$i] </td>";
                print "<td> $grades[$i] </td>";
                print "</tr>";
            }
            elseif ($sel == 'B' and $grades[$i] >= 80 and $grades[$i] < 90){
                print"<tr>";
                print"<td> $names[$i] </td>";
                print "<td> $grades[$i] </td>";
                print "</tr>";
            }
            elseif ($sel == 'C' and $grades[$i] >= 70 and $grades[$i] < 80){
                print"<tr>";
                print"<td> $names[$i] </td>";
                print "<td> $grades[$i] </td>";
                print "</tr>";
            }
            elseif ($sel == 'D' and $grades[$i] >= 60 and $grades[$i] < 70){
                print"<tr>";
                print"<td> $names[$i] </td>";
                print "<td> $grades[$i] </td>";
                print "</tr>";
            }
            elseif ($sel == 'F' and $grades[$i] <60){
                print"<tr>";
                print"<td> $names[$i] </td>";
                print "<td> $grades[$i] </td>";
                print "</tr>";
            }
        }
        print"</table>
    </section>";
    */
    ?>
</body>
</html>
