<?php


class AdminController{

    

    private 
        $_isLoggedIn,
        $_db,
        $_session;
    
    public function __construct()
    {
        $this->_db = Database::getInstance();
    }

    //projects
    public function viewProjects(){

    }

    
    public function deleteProjects($user_id){
        
    }
    //resources
    public function viewResources(){

    }

    public function removeResources($user_id){

    }

    //courses
    public function addCourses(){

    }
    
    public function viewCourses(){

    }

    public function deleteCourses(){

    }

    //users
    public function viewUsers(){

    }

    //teachers
    public function removeUsers($user_id){

    }

    //societies
    
    public function addSocieties(){

    }

    public function removeSocieties($society_id){

    }

    public function viewSocieties(){

    }

    //blogs


    //timetable
    public function addTimetable($timetable){

    }

    public function removeTimetable($timetable_id){

    }

    public function viewTimetable(){

    }

    //carpool
    public function removeCarpoool(){

    }

    public function viewCarpool(){

    }

}