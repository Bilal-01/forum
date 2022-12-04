<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';
$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];
switch($method){
    case 'GET':
        $results = $db->complexQuery("SELECT `tcode` FROM timetable");
        if($results->count())
        {
            $response=['status'=>1,'results'=>$results->results(),'message'=>'Success'];
        }
        else{
            $response=['status'=>0,'results'=>$results->results(),'message'=>'Failure'];
        }
        echo json_encode($response);
        break;
    
    case 'POST':
        $data = json_decode(file_get_contents('php://input'));
        $resultContainer = [];
        foreach ($data as $element){
            $results = $db->get('timetable', ['tcode', '=', $element]);
            if($results->count()){
                array_push($resultContainer, $results->first());
            }
        }
        if($results->count()){
            $response = ['status' => 1, 'results' => $resultContainer, 'message' => 'Success'];
        }
        else{
            $response = ['status' => 0, 'results' => $resultContainer, 'message' => 'Failure'];
        }
        echo json_encode($response);
        break;
}