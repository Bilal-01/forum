<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';
require_once '../classes/User.php';
$user = new User();

$method = $_SERVER['REQUEST_METHOD'];
switch($method){
    case 'POST':
        $data = json_decode(file_get_contents('php://input'));
        if($user->sendQuery($data)){
            $response = ['status' => 1, 'message' => 'Success'];
        }
        else{
            $response = ['status' => 1, 'message' => 'Success'];
        }
        echo json_encode($response);
}