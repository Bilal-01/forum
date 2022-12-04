<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Headers: *");
    header("Access-Control-Allow-Methods: *");

    require_once 'core/init.php';


    $db = Database::getInstance();
    $user = new User();
    $method = $_SERVER['REQUEST_METHOD'];
    switch($method) {
        case "GET":
            $users = (file_get_contents('php://input'));
            $db->get('user', ['id', '=', 1]);

            echo json_encode($users);
            break;

        case "POST":
            $data = json_decode( file_get_contents('php://input') );
            if($data->password === ''){
                if($user->register($data->email)){
                    $response = ['status' => 1, 'message' => 'User successfully registered'];
                }
                else{
                    $response = ['status' => 0, 'message' => 'User cannot be registered'];
                }
            }
            else if($user->login($data->email, $data->password)){
                $userData = $db->get('user', ['email', '=', $data->email])->first();
                $response = ['status' => 1, 'message' => 'Login successfull.', 'user' => $userData];
            }
            else{
                $response = ['status' => 0, 'message' => 'Incorrect email / password.'];
            }
            echo json_encode($response);
            break;


        case "PUT":
            $user = json_decode( file_get_contents('php://input') );
            $sql = "UPDATE users SET name= :name, email =:email, mobile =:mobile, updated_at =:updated_at WHERE id = :id";
            $stmt = $conn->prepare($sql);
            $updated_at = date('Y-m-d');
            $stmt->bindParam(':id', $user->id);
            $stmt->bindParam(':name', $user->name);
            $stmt->bindParam(':email', $user->email);
            $stmt->bindParam(':mobile', $user->mobile);
            $stmt->bindParam(':updated_at', $updated_at);

            if($stmt->execute()) {
                $response = ['status' => 1, 'message' => 'Record updated successfully.'];
            } else {
                $response = ['status' => 0, 'message' => 'Failed to update record.'];
            }
            echo json_encode($response);
            break;

        case "DELETE":
            $sql = "DELETE FROM users WHERE id = :id";
            $path = explode('/', $_SERVER['REQUEST_URI']);

            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':id', $path[3]);

            if($stmt->execute()) {
                $response = ['status' => 1, 'message' => 'Record deleted successfully.'];
            } else {
                $response = ['status' => 0, 'message' => 'Failed to delete record.'];
            }
            echo json_encode($response);
            break;
    }
?>