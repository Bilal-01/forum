<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

require_once '../classes/Database.php';

$db = Database::getInstance();
$method = $_SERVER['REQUEST_METHOD'];

switch($method){
   case 'GET':
       $canteenName = isset($_GET['canteenName']) ? $_GET['canteenName'] : 'default';
       $results = $db->complexQuery("SELECT menu.id, menu.name, menu.description, menu.price, menu.canteen_id,menu.image_path,canteen.image_path as main_image_path ,canteen.loc_img_path FROM menu LEFT JOIN canteen ON menu.canteen_id = canteen.id WHERE canteen.cname = ?", [$canteenName]);
       if($results->count()) {
        $response=['status'=>1,'results'=>$results->results(),'message'=>'Success'];
     } else {
        $response=['status'=>0,'results'=>$results->results(),'message'=>'Failure: ' . $db->errorMessage()];
     }
     
       echo json_encode($response);
       break;

   case 'POST':
       $data = json_decode(file_get_contents('php://input'));
       if($db->insert('menu', ['id' => null, 'name' => $data->name, 'description' => $data->description, 'price' => $data->price])){
           $response=['status' => 1, 'message'=>'Record inserted successfully'];
       }
       else{
           $response=['status' => 1, 'message' => 'Something went wrong'];
       }
       echo json_encode($response);
       break;

   case 'DELETE':
       $data = json_decode( file_get_contents('php://input') );
       $id = $data;
       if($db->delete('menu',['id', '=', $id]))
       {
           $response = ['status' => 1 , 'message'=>'Success'];
       }
       else{
           $response = ['status' => 0 , 'message'=>'Failure'];
       }
       echo json_encode($response);
       break;
}
?>
