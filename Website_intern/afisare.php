<?php
  
include('dbconection.php');
  
// SQL query to select data from database
$sql = "SELECT * FROM products ";
$result = $mysqli->query($sql);
$mysqli->close(); 
?>
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <title>Our products</title>
    <?php include("template.html")?>
    <link rel="stylesheet" href="style1.css">
</head>
  
<body>
    <section>
    <h1>Menu</h1>
    <h2><i><b>***Choose your favorite***</b></i></h2>
        <!-- TABLE CONSTRUCTION-->
        <table>
            <tr>
                <th>Coffeename</th>
                <th>Price</th>
                <th>Amount</th>
                <th>Ingredients</th>
                <th>Comments</th>
                <th>Rateing</th>
            </tr>
            <!-- PHP CODE TO FETCH DATA FROM ROWS-->
            <?php   // LOOP TILL END OF DATA 
                while($rows=$result->fetch_assoc())
                {
             ?>
            <tr>
                <!--FETCHING DATA FROM EACH 
                    ROW OF EVERY COLUMN-->
                <td><?php echo $rows['coffeename'];?></td>
                <td><?php echo $rows['price'];?></td>
                <td><?php echo $rows['amount'];?></td>
                <td><?php echo $rows['ingredients'];?></td>
                <td><?php echo $rows['comments'];?></td>
                <td><?php echo $rows['rateing'];?></td>
            </tr>
            <?php
                }
             ?>
        </table>
    </section>
</body>
  
</html>