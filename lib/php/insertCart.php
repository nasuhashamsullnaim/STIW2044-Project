<?php
error_reporting(0);
include_once("dbconnect.php");
$email = $_POST['email'];
$bookid = $_POST['bookid'];
$bookquantity = $_POST['quantity'];

$sqlcheck = "SELECT * FROM CART WHERE BOOKID = '$bookid' AND EMAIL = '$email'";
$result = $conn->query($sqlcheck);
if ($result->num_rows > 0) {
    $sqlupdate = "UPDATE CART SET QUANTITY = '$bookquantity' WHERE BOOKID = '$bookid' AND EMAIL = '$email'";
    if ($conn->query($sqlupdate) === TRUE){
       echo "success";
    }  
}
else{
    $sqlinsert = "INSERT INTO CART(EMAIL,BOOKID,QUANTITY) VALUES ('$email','$bookid','$bookquantity')";
    if ($conn->query($sqlinsert) === TRUE){
       echo "success";
    }    
}

?>