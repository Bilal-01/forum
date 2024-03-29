<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';


$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];

switch($method){
    case 'GET':
        $results = $db->complexQuery("SELECT c.*, t.tname from course c left join teacher t on c.coordinator = t.tid");
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
        if($db->insert('course', ['cid' => $data->cid, 'cname' => $data->cname, 'coordinator' => $data->coordinator])){
            $response=['status' => 1, 'message'=>'Record inserted successfully'];
        }
        else{
            $response=['status' => 1, 'message' => 'Something went wrong'];
        }
        echo json_encode($response);
        break;

    case 'DELETE':
        $data = json_decode( file_get_contents('php://input') );
        $Bid = $data;
        if($db->delete('course',['cid','=', $cid]))
        {
            $response = ['status' => 1 , 'message'=>'Success'];
        }
        else{
            $response = ['status' => 0 , 'message'=>'Failure'];
        }
        break;
}