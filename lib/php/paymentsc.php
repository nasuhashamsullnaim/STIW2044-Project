<?php
error_reporting(0);
include_once("dbconnect.php");
$userid = $_POST['userid'];
$amount = $_POST['amount'];
$orderid = $_POST['orderid'];
$receiptid ="storecr";

 $sqlcart ="SELECT CART.BOOKID, CART.CQUANTITY, BOOK.BOOKPRICE FROM CART INNER JOIN BOOK ON CART.BOOKID = BOOK.BOOKID WHERE CART.EMAIL = '$userid'";
        $cartresult = $conn->query($sqlcart);
        if ($cartresult->num_rows > 0)
        {
        while ($row = $cartresult->fetch_assoc())
        {
            $bookid = $row["BOOKID"];
            $cq = $row["CQUANTITY"]; //cart qty
            $pr = $row["BOOKPRICE"];
            $sqlinsertcarthistory = "INSERT INTO CARTHISTORY(EMAIL,ORDERID,BILLID,BOOKID,CQUANTITY) VALUES ('$userid','$orderid','$receiptid','$prodid','$cq')";
            $conn->query($sqlinsertcarthistory);
            
            $selectproduct = "SELECT * FROM BOOK WHERE BOOKID = '$bookid'";
            $productresult = $conn->query($selectproduct);
             if ($productresult->num_rows > 0){
                  while ($rowp = $productresult->fetch_assoc()){
                    $prquantity = $rowp["QUANTITY"];
                    $prevsold = $rowp["SOLD"];
                    $newquantity = $prquantity - $cq; //quantity in store - quantity ordered by user
                    $newsold = $prevsold + $cq;
                    $sqlupdatequantity = "UPDATE BOOK SET QUANTITY = '$newquantity', SOLD = '$newsold' WHERE ID = '$bookid'";
                    $conn->query($sqlupdatequantity);
                  }
             }
        }
        
       $sqldeletecart = "DELETE FROM CART WHERE EMAIL = '$userid'";
       $sqlinsert = "INSERT INTO PAYMENT(ORDERID,BILLID,USERID,TOTAL) VALUES ('$orderid','$receiptid','$userid','$amount')";
        
       $conn->query($sqldeletecart);
       $conn->query($sqlinsert);
      
       echo "success";
        }else{
            echo "failed";
        }

?>