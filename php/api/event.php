<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';

$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];

switch($method){
    case 'GET':
        $results = $db->complexQuery("SELECT * FROM event");
     
        if($results->count()) {
            $response=['status'=>1,'results'=>$results->results(),'message'=>'Success'];
        } else {
            $response=['status'=>0,'results'=>$results->results(),'message'=>'Failure'];
        }
     
        echo json_encode($response);
        break;
     

   case 'POST':
       $data = json_decode(file_get_contents('php://input'));

       if($db->insert('events', ['id' => $data->id, 'month' => $data->month, 'image_path' => $data->image_path, 'society_id' => $data->society_id])) {
           $response=['status' => 1, 'message'=>'Record inserted successfully'];
       } else {
           $response=['status' => 0, 'message' => 'Something went wrong'];
       }

       echo json_encode($response);
       break;
}
?>
