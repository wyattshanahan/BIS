<!doctype html>
<html lang="en">
<head>
  <title> Exam 01 </title>
  <link rel="stylesheet" href="style.css"> 
  <!-- ----------------------------------
			BIS2523 Documentation
   Name: Wyatt Shanahan
   Netid: wls219
   Date: 24 Sep 2024
   
   Variables used:
      <$student> <iterator for each student object>
      <$currGrade> <quality of life varaiable storing the grade for the current student>
      <$xml>  <store data from XML document>
  
   -------------------------------------  -->
</head>
<body>
    <table>
        <tr>
            <th>Name</th>
            <th>Numeric Grade</th>
            <th>Letter Grade</th>
        </tr>
<?
    $xml = simplexml_load_file("grades.xml");
    foreach ($xml->student as $student){
        print"<tr>
            <td>$student->name</td>
            <td>$student->grade</td>";
            $currGrade = $student->grade;
            if ($currGrade > 89){
                print"<td>A</td>";
            }
            elseif (($currGrade>79)and($currGrade<90)){
                print"<td>B</td>";
            }
            elseif (($currGrade>69)and($currGrade<80)){
                print"<td>C</td>";
            }
            elseif (($currGrade>59)and($currGrade<70)){
                print"<td>D</td>";
            }
            else{
                print"<td>F</td>";
            }
            print "</tr>";
    }
    print "</table>";

?>
</body>
</html>