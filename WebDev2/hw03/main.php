<!doctype html>
<html lang="en">
<head>
  <title>  </title>
  <link rel="stylesheet" href="style.css"> 
  <!-- ----------------------------------
   BIS1523 Documentation
   Name:
   Netid:
   Date: 08 September 2024

   Variables used:
      <$covers>  <Store a list of cover URLs from covers.txt>
      <$dbc> <open and store DB connexion>
      <$query> <store SQL query>    
      <$result> <store result of SQL Query>
      <$row> <iteration variable>

   -------------------------------------  -->
</head>
<body>
<h1>Book Lookup - Homework 3</h1>

<section id="main">
<?
    $dbc = new mysqli("localhost", "student", "password", "novels");
    $query = "select * from novels";
    $result = $dbc->query($query);
    print "<table>
    <tr>
        <th>Book</th>
        <th>Cover</th>
        </tr>";

    while ($row = $result->fetch_assoc()){
        print "<tr>
            <td> $row[title]</td>
            <td><img src='" . $row['image'] . "' alt='an book cover'  height='100'></td>
            </tr>";
    }
?>    

</section>
</body>
</html>
