<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';
//$project = new project()
//if($project->getlink)
$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];
switch($method){
    case 'POST':
        $data = json_decode( file_get_contents('php://input') );
        $course_id =$data->course_id;
        $student_id = $data->student_id;
        $date_of_post = $data->date_of_post;
        $github_link = $data->github_link;
        if($db->insert('project',[
        'course_id' =>$course_id,
        'student_id' => $student_id,
        'date_of_post' => $date_of_post,
        'github_link' => $github_link,
            
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
        $results=$db->get('project',['project_id','>=',1]);
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
            $project_id = $data;
                if($db->delete('project',['project_id','=',$project_id]))
                {
                    $response = ['status' => 1 , 'message'=>'Success'];
                }
                else{
                    $response = ['status' => 0 , 'message'=>'Failure'];
                }
                break;
        
}