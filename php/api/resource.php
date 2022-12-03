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
        $course_id = $data->course_id;
        $student_id = $data->student_id;
        $Drive_Link = $data->drive_link;
		var_dump($Drive_Link);
        if($db->insert('resource',[
            'ID' => null,
            'course_id' => $course_id,
            'student_id' => $student_id,
            'Drive_Link' => $Drive_Link,
            'date_of_publish' => date('Y-m-d'),
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
        $results=$db->get('resource',['date_of_publish','<=',date('Y-m-d')]);
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
        $ID = $data;
        if($db->delete('resource',['ID','=',$ID]))
        {
            $response = ['status' => 1 , 'message'=>'Success'];
        }
        else{
            $response = ['status' => 0 , 'message'=>'Failure'];
        }
        break;
}