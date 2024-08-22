<!doctype html>
<html lang="en">
<head>
  <title>  </title>
  <link rel="stylesheet" href="oscars.css"> 
  <!-- ----------------------------------
   BIS1523 Documentation
   Name:
   Netid:
   Date:

   Variables used:
      <variable name>  <description of data variable will hold>

   -------------------------------------  -->
</head>
<body>
<h1>Book Lookup - Homework 1</h1>

<section id="main">
<?
    $covers = file("covers.txt", FILE_IGNORE_NEW_LINES);
    $novels = file("novels.txt", FILE_IGNORE_NEW_LINES);
    print "<table>
    <tr>
        <th>Book</th>
        <th>Cover</th>
        </tr>";

    for ($i = 0; $i < count($covers); $i++){
        print "<tr>
            <td> $novels[$i]</td>
            <td><img src='" . $covers[$i] . "' alt='an book cover'  height='100'></td>
            </tr>";
    }
    print"$covers[1]";
    print"</br>";
    print"$novels[1]";
?>    

</section>
</body>
</html>
