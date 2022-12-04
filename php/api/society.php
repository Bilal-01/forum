<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';


$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];

switch($method){
    case 'GET':
        $results = $db->complexQuery("SELECT s.society_id, s.sname, s.sdescription, s.head_id, s.president_id,s.socialMedia_link,t.tname,
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
        $data = json_decode(file_get_contents('php://input'));
        if($db->insert('society', ['society_id' => null, 'sname' => $data->sname, 'sdecription' => $data->sdescription, 'head_id' => $data->head, 'president_id' => $data->president, 'socialMedia_link' => $data->link])){
            $response=['status' => 1, 'message'=>'Record inserted successfully'];
        }
        else{
            $response=['status' => 1, 'message' => 'Something went wrong'];
        }
        echo json_encode($response);
        break;
        break;

    case 'DELETE':
        $data = json_decode( file_get_contents('php://input') );
        $sid = $data;
        if($db->delete('blog',['society_id','=',$sid]))
        {
            $response = ['status' => 1 , 'message'=>'Success'];
        }
        else{
            $response = ['status' => 0 , 'message'=>'Failure'];
        }
        break;
}