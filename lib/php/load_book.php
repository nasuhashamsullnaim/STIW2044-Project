<?php
error_reporting(0);
include_once("dbconnect.php");
//$shopid = $_POST['shopid'];
//$type = $_POST['type'];

$sql = "SELECT * FROM BOOK"; 
$result = mysqli_query($conn,$sql);

if ($result->num_rows > 0) {
    $response["book"] = array();
    while ($row = $result ->fetch_assoc()){
        $booklist = array();
        $booklist[bookid] = $row["BOOKID"];
        $booklist[bookname] = $row["BOOKNAME"];
        $booklist[bookprice] = $row["BOOKPRICE"];
        $booklist[bookquantity] = $row["QUANTITY"];
        $booklist[image] = $row["IMAGE"];
        $booklist[status] = $row["STATUS"];
        array_push($response["book"], $booklist);
    }
    echo json_encode($response);
}else{
    echo "nodata";
}
?>