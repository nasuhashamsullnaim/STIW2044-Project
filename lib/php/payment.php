<?php
error_reporting(0);
//include_once("dbconnect.php");

$email = $_GET['email']; 
$mobile = $_GET['mobile']; 
$name = $_GET['name']; 
$amount = $_GET['amount']; 
$orderid = $_GET['orderid'];

$api_key = '6727cb21-676c-4918-bc6f-2b5d73c15428';
$collection_id = 'mhya0ouc';
$host = 'https://billplz-staging.herokuapp.com/api/v3/bills';


$data = array(
          'collection_id' => $collection_id,
          'email' => $email,
          'mobile' => $mobile,
          'name' => $name,
          'amount' => $amount * 100, 
		  'description' => 'Payment for order id '.$orderid,
          'callback_url' => "https://itsmelele.com/DeafZone3/return_url",
          'redirect_url' => "https://itsmelele.com/DeafZone3/php/paymentUpdate.php?userid=$email&mobile=$mobile&amount=$amount&orderid=$orderid" 
);


$process = curl_init($host );
curl_setopt($process, CURLOPT_HEADER, 0);
curl_setopt($process, CURLOPT_USERPWD, $api_key . ":");
curl_setopt($process, CURLOPT_TIMEOUT, 30);
curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($process, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($process, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($process, CURLOPT_POSTFIELDS, http_build_query($data) ); 

$return = curl_exec($process);
curl_close($process);

$bill = json_decode($return, true);

header("Location: {$bill['url']}");
?>