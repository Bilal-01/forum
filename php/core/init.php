<?php
session_start();
date_default_timezone_set('Asia/Karachi');
$GLOBALS['config'] = array(
    'mysql' => array(
        'host' => '127.0.0.1',
        'username' => 'root',
        'password' => '',
        'dbname' => 'test'
    ),
    'remember' => array(
        'cookie_name' => 'hash',
        'cookie_expiry' => '86400'
    ),
    'session' => array(
        'session_name' => 'user',
        'token_name' => 'token'
    )
);

spl_autoload_register(function ($class) {
    require_once 'classes/' . $class . '.php';
});

// require_once 'php/functions/sanitize.php';

// if(Cookie::exists(Config::get('remember/cookie_name')) && !Session::exists(Config::get('session/session_name'))){
//     $user_data = DB::getInstance()->get('remember',[Config::get('remember/cookie_name'), '=', Cookie::get(Config::get('remember/cookie_name'))]);
//     if($user_data->count()){
//         $user = new User($user_data->first()['user_id']);
//         $user->login();
//     }
// }