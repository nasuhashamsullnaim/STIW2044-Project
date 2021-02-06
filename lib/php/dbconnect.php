<?php
$servername = "localhost";
$username   = "itsmelel_admindeafzone";
$password   = "28rrLTNDT{9q";
$dbname     = "itsmelel_deafZoneBook";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>