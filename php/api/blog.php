<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';
$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];
switch($method){
    case 'POST':
        $data = json_decode( file_get_contents('php://input') );
        $Heading = $data->Heading;
        $post_by = $data->post_by;
        $description = $data->description;
        if($db->insert('blog',[
            'Bid' => null,
            'Heading' => $Heading,
            'post_by' => $post_by,
            'date_of_post' => date('Y-m-d'),
            'description' => $description,
        ]))
        {
            $response = ['status' => 1 , 'message'=>'Success'];
        }
        else{
            $response = ['status' => 0 , 'message'=>'Failure'];
        }
        echo json_encode($response);
        break;

    case 'GET':
        $results=$db->get('blog',['date_of_post','<=',date('Y-m-d')]);
        if($results->count())
        {
            $response=['status'=>1,'results'=>$results->results(),'message'=>'Success'];
        }
        else{
            $response=['status'=>0,'results'=>$results->results(),'message'=>'Failure'];
        }
        echo json_encode($response);
        break;
    
    case 'DELETE':
        $data = json_decode( file_get_contents('php://input') );
        $Bid = $data;
        if($db->delete('blog',['Bid','=',$Bid]))
        {
            $response = ['status' => 1 , 'message'=>'Success'];
        }
        else{
            $response = ['status' => 0 , 'message'=>'Failure'];
        }
        break;
}