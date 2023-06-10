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


?>