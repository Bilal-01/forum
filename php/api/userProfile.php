<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';


$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];

switch($method){
    case 'POST':
        $data = json_decode(file_get_contents('php://input'));
        $results = $db->update('profile', ['full_name' => $data->fullName, 'department'=>$data->department, 'skill'=>$data->skill, 'domain'=>$data->skill, 'quote'=>$data->quote, 'about'=>$data->about], $data->uid);
        if($results){
            $response = ['status' => 1, 'results' => $results->first(), 'message' => 'Success'];
        }
        else{
            $response = ['status' => 0, 'results' => $results->first(), 'message' => 'Failure'];
        }
        echo json_encode($response);
        break;
}