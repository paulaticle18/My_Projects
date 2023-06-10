<?php
  
include('dbconection.php');

if(isset($_POST['submit'])){
        $id = intval($_GET['id']);
        $coffeename = $_POST['coffeename'];
        $price = $_POST['price'];
        $amount = $_POST['amount'];
        $ingredients = $_POST['ingredients'];
        $comments = $_POST['comments'];
        $rateing = $_POST['rateing'];
        $sql ="UPDATE products SET coffeename='$coffeename', price='$price', amount='$amount', ingredients='$ingredients', comments='$comments', rateing='$rateing' WHERE id='$id'";
        $result = $mysqli->query($sql);
        if($mysqli->query($sql) === TRUE){
             header("Location: edit.php");
            } else {
             echo "Unable to Update Data";
            }
}
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >
    <?php include("template.html")?>
    <title>Edit product</title>
    <style>
        .container{
            padding-top: 70px;
        }
        .form-group{
            color:brown;
            background-color:#CBE0C9;
            font-family:'Droid Serif',serif;
        }
    </style>
    </head>
    <body>
    <div class='container'>
  <form method="post">
  <div class="form-group">
    <div class="form-group">
        <label><b>Name</b></label>
        <input type="text" class="form-control" placeholder="Enter new name" name="coffeename" value="">
    </div>
    <div class="form-group">
        <label><b>Price</b></label>
        <input type="text" class="form-control" placeholder="Enter new price" name="price" value="">
    </div>
    <div class="form-group">
        <label><b>Amount</b></label>
        <input type="text" class="form-control" placeholder="Enter new amount" name="amount" value="">
    </div>
    <div class="form-group">
        <label><b>Ingredients</b></label>
        <input type="text" class="form-control" placeholder="Enter new ingredients" name="ingredients" value="">
    </div>
    <div class="form-group">
        <label><b>Comments</b></label>
        <input type="text" class="form-control" placeholder="Enter new comment" name="comments" value="">
    </div>
    <div class="form-group">
        <label><b>Rateing</b></label>
        <input type="text" class="form-control" placeholder="Enter new rete (1 to 5)" name="rateing" value="">
    </div>
    <button type="submit" class="btn btn-primary" name="submit">Save Changes</button>
</form>

  </div>
  </body>
</html>