<?php

include('dbconection.php');

if(isset($_POST['submit'])){ // Fetching variables of the form which travels in URL
    $coffeename = $_POST['coffeename'];
    $price = $_POST['price'];
    $amount = $_POST['amount'];
    $ingredients = $_POST['ingredients'];
    $comments = $_POST['comments'];
    $rateing = $_POST['rateing'];
    if($coffeename !=''||$price !=''){


// Execute query
$query = $mysqli->real_query("insert into products( coffeename, price, amount, ingredients, comments, rateing) VALUES ('$coffeename', '$price', '$amount', '$ingredients', '$comments', '$rateing')");

// Check for errors
if($mysqli->connect_errno){
    echo $mysqli->connect_error;
    }

    header("Location: afisare.php");
}
else{
echo "<p>Insertion Failed <br/> Some Fields are Blank....!!</p>";
}
}

$mysqli->close();

?>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Product</title>
        <?php include("template.html")?>
        <link rel="stylesheet" href="style2.css">
    </head>

    <body>
        <div class="maindiv">
            <div class="form_div">
                <div class="title">
                    <h2><i><b>***Add a product to our menu***</b></i></h2>
                </div>
                <form action="add.php" method="post">
                    <h2>Form</h2>
                    <label>Name:</label>
                        <input class="input" name="coffeename" type="text" value="">
                    <label>Price:</label>
                        <input class="input" name="price" type="text" value="">
                    <label>Amount:</label>
                        <input class="input" name="amount" type="text" value="">
                    <label>Ingredients:</label>
                        <input class="input" name="ingredients" type="text" value="">
                    <label>Comments:</label>
                        <input class="input" name="comments" type="text" value="">  
                    <label>Rateing:</label>
                        <input class="input" name="rateing" type="text" value="">
                        <input class="submit" name="submit" type="submit" value="Add">
                </form>
</div>
</div>
    </body>
</html>