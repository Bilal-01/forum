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
            
            $mail               = new PHPMailer();
            $body               = "<h1> Sending HTML Mails using gmail</h1><p>it's great !!</p>";
            $mail->IsSMTP();                                        // telling the class to use SMTP
            $mail->SMTPDebug    = 1;                                // enables SMTP debug information (for testing)
            $mail->SMTPAuth     = true;                             // enable SMTP authentication
            $mail->SMTPSecure   = "tls";                            // sets the prefix to the servier
            $mail->Host         = "smtp.gmail.com";                 // sets GMAIL as the SMTP server
            $mail->Port         = 587;                              // set the SMTP port for the GMAIL server

            $mail->Username     = "fastdirectory01@gmail.com"  ;           // GMAIL username
            $mail->Password     = 'Fast@1234' ;           // GMAIL password

            $mail->SetFrom('VALID_USER@gmail.com', 'Anis Halayem');
            $mail->Subject    = "Test Send Mails";
            $mail->MsgHTML($body);
            $address = $email;
            $mail->AddAddress($address, "USER NAME");

            if(!$mail->Send()) {
                echo "Mailer Error: " . $mail->ErrorInfo;
            } 
            else {
                echo "Message sent!";
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