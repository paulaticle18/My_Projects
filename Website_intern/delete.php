<?php
  
    include('dbconection.php');

    if(isset($_POST['delete'])) {
       $id = $_POST['id'];
    $sql = "DELETE FROM products WHERE id = '$id'";
    $mysqli->query($sql);
    if($mysqli->query($sql) === TRUE){
      header("Location: delete.php");
    } else {
      echo "Unable to Delete Data";
    }
}
// SQL query to select data from database
$sql = "SELECT * FROM products ";
$result = $mysqli->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <title>Delete a product</title>
    <?php include("template.html")?> 
    <link rel="stylesheet" href="style1.css">

</head>
  
<body>
    <section>
    <h1>Delete Me</h1>
    <h2><i><b>***Choose your less favorite***</b></i></h2>
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
             ?>
            <tr>
                <!--FETCHING DATA FROM EACH 
                    ROW OF EVERY COLUMN-->
                <td><?php echo $rows['id'];?></td>
                <td><?php echo $rows['coffeename'];?></td>
                <td><?php echo $rows['price'];?></td>
                <td><?php echo $rows['amount'];?></td>
                <td><?php echo $rows['ingredients'];?></td>
                <td><?php echo $rows['comments'];?></td>
                <td><?php echo $rows['rateing'];?></td>
                <td><form action="delete.php" method="POST">
                <input type="hidden" name="id" value='<?php echo $rows['id'] ?> '> 
                <input type="submit" class="submit" name="delete" value="DELETE"></form></td>
            </tr>
            <?php
                }
             ?>
      </table>
    </section>
</body>
  
</html>