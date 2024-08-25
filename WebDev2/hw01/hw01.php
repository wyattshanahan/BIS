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
      <$i> <counter variable>
      <$novels> <store a list of Novels from novels.txt>

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
?>    

</section>
</body>
</html>
