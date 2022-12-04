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

            $mail->smtpClose();

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
                if(!$result->count()){
                    if($this->_db->insert('user', ['id' => $id, 'email' => $email, 'password' => $password , 'uname' => $name, 'role' => 1])){
                        return true;
                    }
                }
            }
            return false;
        }


    }

?>