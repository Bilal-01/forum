<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';


$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];

switch($method){
    case 'GET':
        $results = $db->complexQuery("SELECT b.*, c.cname as course_name from book b LEFT JOIN course c on b.course_id = c.cid");
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
        if($db->insert('book', ['book_id' => null, 'isbn' => $data->isbn, 'title' => $data->title,'author' => $data->author,'pages' => $data->pages,'course_id' => $data->courseId,'available' => $data->available,])){
            $response=['status' => 1, 'message'=>'Record inserted successfully'];
        }
        else{
            $response=['status' => 1, 'message' => 'Something went wrong'];
        }
        echo json_encode($response);
        break;

    case 'DELETE':
        $data = json_decode( file_get_contents('php://input') );
        $sid = $data;
        if($db->delete('book',['book_id','=',$sid]))
        {
            $response = ['status' => 1 , 'message'=>'Success'];
        }
        else{
            $response = ['status' => 0 , 'message'=>'Failure'];
        }
        break;
}