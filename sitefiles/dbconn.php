<?php
$server='localhost';
$username='root';
$password='Qwerty789';
$dbname='FAME';

// Create connection to a database server.
$conn = mysqli_connect($server, $username, $password, $dbname);

// Always check your connection before you try to do anything else!
if (!$conn) {die( "Connection failed: " . mysqli_connect_error());}
?>