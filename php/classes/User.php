<?php

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    require 'vendor/autoload.php';

    class User{

        private 
            $_isLoggedIn,
            $_db,
            $_session;
        
        public function __construct()
        {
            $this->_db = Database::getInstance();
        }

        public function create($fields = []) {
            if($this->_db->insert('user', $fields)->error()) {
                throw new Exception('There was a problem creating an account!');
            }
        }

        public function login($email, $password)
        {
            $result = $this->_db->get('user', ['email', '=', $email]);
            if($result->count()){
                if ($email === $result->first()['email'] && $password === $result->first()['password']){
                    return true;
                }
            }
            return false;
        }
        
        public function sendEmail($email, $password){
            $mail = new PHPMailer(true);
            
            try {
                $mail->SMTPDebug = 2;                                       
                $mail->isSMTP();                                
                $mail->Host       = 'smtp.gmail.com'   ;                 
                $mail->SMTPAuth   = true;                             
                $mail->Username   = 'fastdirectory01@gmail.com';                 
                $mail->Password   = 'jdtbtedvetueorcx';                        
                $mail->SMTPSecure = 'tls';                              
                $mail->Port       = 587;  
            
                $mail->setFrom('fastdirectory01@gmail.com', 'Fast Directory');           
                $mail->addAddress($email);
                
                $mail->isHTML(true);                                  
                $mail->Subject = 'Subject';
                $mail->Body    = 'Email: <b>' .$email. '</b><br/>Password: <b>' .$password. '</b>';
                
                $mail->AltBody = 'Body in plain text for non-HTML mail clients';
                $mail->send();
                echo "Mail has been sent successfully!";
            } catch (Exception $e) {
                echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
            }
        }

        public function register($email,$name)
        {
            if(explode('@', $email)[1] === 'nu.edu.pk'){
                $password = substr($email, 0, 7);
                $digits = 5;
                $rnumber = rand(pow(10, $digits-1), pow(10, $digits)-1);
                $password = $password . $rnumber;
                $this->sendEmail($email, $password);
                $result = $this->_db->get('user', ['email', '=', $email]);
                $id = substr($email, 0, 7);
                try{
                    
                    // $this->_pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $this->_db->_pdo->beginTransaction();
                    if(!$result->count()){
                        echo 'Inside query';
                        $this->_db->insert('user', ['id' => $id, 'email' => $email, 'password' => $password , 'uname' => $name, 'role' => 1]);
                        $this->_db->insert('profile',['id' => null, 'full_name' => $name, 'department' => null, 'domain' => null, 'skill' => null, 'about' => null, 'uid' => $id]);
                        $this->_db->_pdo->commit();
                    }
                    else{
                        return false;
                    }
                }catch(PDOException $e) {
                    $this->_db->_pdo->rollback();
                    echo "Error: " . $e->getMessage();
                }
            }
            else{
                return false;
            }
        }

        public function getAll(){
            $res = $this->_db->get('user', ['role', '>=', 0]);
            if($res->count()){
                return $res;
            }
            return null;
        }

        public function sendQuery($data){
            $mail = new PHPMailer(true);
            
            try {
                $mail->SMTPDebug = 2;                                       
                $mail->isSMTP();                                
                $mail->Host       = 'smtp.gmail.com'   ;                 
                $mail->SMTPAuth   = true;                             
                $mail->Username   = 'fastdirectory01@gmail.com';                 
                $mail->Password   = 'jdtbtedvetueorcx';                        
                $mail->SMTPSecure = 'tls';                              
                $mail->Port       = 587;  
            
                $mail->setFrom('fastdirectory01@gmail.com', 'Fast Directory');           
                $mail->addAddress('k200397@nu.edu.pk');
                
                $mail->isHTML(true);                                  
                $mail->Subject = $data->subject;
                $mail->Body    = $data->message;
                
                $mail->AltBody = 'Body in plain text for non-HTML mail clients';
                $mail->send();
                echo "Mail has been sent successfully!";
            } catch (Exception $e) {
                echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
            }
        }


    }

?>