<?php
  
// Username is root
$user = 'root';
$password = 'QXBXirN6DI8YpQw64UUl'; 
$database = 'internPROJECT'; 
$servername='127.0.0.1';
$mysqli = new mysqli($servername, $user, $password, $database);
  
// Checking for connections
if ($mysqli->connect_error) {
    die('Connect Error (' . 
    $mysqli->connect_errno . ') '. 
    $mysqli->connect_error);
}
  
// SQL query to select data from database
$sql = "SELECT * FROM products ";
$result = $mysqli->query($sql);
$products = mysqli_fetch_all($result, MYSQLI_ASSOC);
$mysqli->close(); 
?>
<!DOCTYPE HTML>
<html>
<?php include('template.html')?>
</html>
