<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';


$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];

switch($method){
    case 'GET':
        $results = $db->complexQuery("SELECT s.society_id, s.sname, s.sdescription, s.head_id, s.president_id,s.socialMedia_link,s.image_path,t.tname,
        t.tid FROM society s LEFT JOIN teacher t ON s.head_id = t.tid");
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
        break;
}