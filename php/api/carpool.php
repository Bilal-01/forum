<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';
//$carpool = new Carpool()
//if($Carpool->getlink)
$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];
switch($method){
    case 'POST':
        $data = json_decode( file_get_contents('php://input') );
        $pick_up = $data->pick_up;
        $drop_off = $data->drop_off;
        $route = $data->route;
        $captain_id = $data->captain_id;
        $phoneNo = $data->phoneNo;
        $time = $data->time;
        $day = $data->day;
        if($db->insert('carpool',[
            'pick_up' => $pick_up,
            'drop_off' => $drop_off,
            'route' => $route,
            'captain_id'=>$captain_id,
            'phoneNo' =>$phoneNo,
            'time' =>$time,
            'day' =>$day,
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
        $results=$db->get('carpool',['carpool_id','>=',1]);
        if($results->count())
        {
            $response=['status'=>1,'results'=>$results->results(),'message'=>'Success'];
        }
        else{
            $response=['status'=>0,'results'=>$results->results(),'message'=>'Failure'];
        }
        echo json_encode($response);

    case 'DELETE':
        $data = json_decode( file_get_contents('php://input') );
        $carpool_id = $data;
            if($db->delete('carpool',['carpool_id','=',$carpool_id]))
            {
                $response = ['status' => 1 , 'message'=>'Success'];
            }
            else{
                $response = ['status' => 0 , 'message'=>'Failure'];
            }
            break;
        
}