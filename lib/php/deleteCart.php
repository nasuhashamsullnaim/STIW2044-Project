<?php
error_reporting(0);
include_once("dbconnect.php");
$email = $_POST['email'];
$bookid = $_POST['bookid'];


if (isset($_POST['bookid'])){
    $sqldelete = "DELETE FROM CART WHERE EMAIL = '$email' AND BOOKID='$bookid'";
}else{
    $sqldelete = "DELETE FROM CART WHERE EMAIL = '$email'";
}
    
    if ($conn->query($sqldelete) === TRUE){
       echo "success";
    }else {
        echo "failed";
    }
?>