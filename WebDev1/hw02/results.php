<!doctype html>
<html lang="en">
<head>
  <title>Product Feedback Receipt</title>
  <meta name="viewport" content="width=device-width"> <!--make page adjust to device screen size-->
  <meta name="author" content="Wyatt Shanahan" />
  <link rel="stylesheet" href="style.css"> 
  <link rel="icon" type="image/x-icon" href="vibin.gif"> <!-- set icon-->
  <!-- ----------------------------------
			BIS1523/BIS2523 Documentation
   Name: Wyatt Shanahan
   Netid: wls219
   Date: 24 Jan 2024
   
   Variables used:
      $product input product input
      $location input  location of transaction
      $level input  level of satisfaction
      $comments input comments
  
   -------------------------------------  -->
</head>
<body style="background-image:linear-gradient(to left,#186118,#3eb489,#186118)"> <!-- other colour: 00805b -->
    <h1 id="header">Generic Shop Product Feedback Receipt</h1> <!--header-->
    <section id="receipt">
    <?
    $product = $_POST['product'];
    $location = $_POST['city'];
    $level = $_POST['level'];
    $comments = $_POST['comments'];
    ?>
        <section id="thank">
        <b>THANK YOU!</b><br />
        Thank you for reviewing this product. We appreciate your help on improving the customer experience. <br />
        We hope you enjoyed this feedback site and process. If you have any questions, feel free to contact us at our corporate headquarters in Saskatoon, SK.
    </section>
        <img id="thumb" src="thumb5.png" alt="A man giving a thumbs up" height="350px" width="250px"/>
    <section id="out">
    <?
    print "Product Name: $product <br />";
    print "Purchase Location: $location <br />";
    print "Satisfaction Level: $level <br /><br />";
    print "Comments: <br/>";
    ?>
    <section id="coms">
        <?
        print"$comments";
        ?>
    </section>
    </section>
</body>
</html>
