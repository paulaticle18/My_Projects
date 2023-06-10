<?php
  
include('dbconection.php');

// SQL query to select data from database
$sql = "SELECT * FROM products ";
$result = $mysqli->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <title>Edit a product</title>
    <?php include("template.html")?>
    <link rel="stylesheet" href="style1.css">
</head>
  
<body>
    <section>
        <h1>Edit me</h1>
        <h2><i><b>***Make your changes***</b></i></h2>
        <!-- TABLE CONSTRUCTION-->
        <table>
            <tr>
                <th>id</th>
                <th>Coffeename</th>
                <th>Price</th>
                <th>Amount</th>
                <th>Ingredients</th>
                <th>Comments</th>
                <th>Rateing</th>
                <th>Action</th>
            </tr>
            <!-- PHP CODE TO FETCH DATA FROM ROWS-->
            <?php   // LOOP TILL END OF DATA 
                while($rows=$result->fetch_assoc())
                {  
                    $id=$rows['id'];  
                    $coffeename=$rows['coffeename'];
                    $price=$rows['price'];
                    $amount=$rows['amount'];
                    $ingredients=$rows['ingredients'];
                    $comments=$rows['comments'];
                    $rateing=$rows['rateing'];             
             
           echo' <tr>
                <th scope="row">'.$id.'</th>
                <td>'.$coffeename.'</td>
                <td>'.$price.'</td>
                <td>'.$amount.'</td>
                <td>'.$ingredients.'</td>
                <td>'.$comments.'</td>
                <td>'.$rateing.'</td>
                <td><div class="container">
                    <button class="btn btn-primary"><a href="update2.php? id='.$id.'" class="text-light">Edit</a>
                    </button>
                </div></td>
            </tr>';
            ?>
            <?php
                }
             ?>
      </table>
    </section>
</body>
  
</html>