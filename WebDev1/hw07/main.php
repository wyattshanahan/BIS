<!doctype html>
<html lang="en">
<head>
  <title>Student Gradebook</title>
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
      $names  <store student names file content>
      $grades <store grades>
      $i <iterator>
      $sel <user selected grade>
  
   -------------------------------------  -->
</head>
<body>
    <h1 id="header">Student Gradebook</h1> <!--header-->
    <form method="post" action="main.php" id="selector">
        <h2><b>Select Grade to List:</b></h2>
        <input type="radio" name="grade" value="A" required>A <!--required attribute forces an input for one of radio buttons--> <br />
        <input type="radio" name="grade" value="B">B <br />
        <input type="radio" name="grade" value="C">C <br />
        <input type="radio" name="grade" value="D">D <br />
        <input type="radio" name="grade" value="F">F <br />
        <br />
        <input type="submit" name="Submit" value="Submit">
    </form>
    <?
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
    ?>
</body>
</html>
