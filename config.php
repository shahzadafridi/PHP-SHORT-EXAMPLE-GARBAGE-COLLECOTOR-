<?php
ini_set('display_errors', 0);
session_start();
define('DBTYPE', 'mysql');
define('DBHOST', 'localhost');
define('DBNAME', 'usama');
define('DBUSER', 'root');
define('DBPASS', '');
$conn = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
if ($conn->connect_error)
{
    echo "connection failed to established";
    die("Connection failed: " . $conn->connect_error);
}
?>
