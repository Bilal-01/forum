<?php

    class Database{
        private static $_instance = null;
        public
            $_pdo;
        private 
            $_query,
            $_results,
            $_error = false,
            $_count = 0,
            $_errorMessage = '';
        
        private function __construct(){
            try {
                $this->_pdo = new PDO('mysql:host=127.0.0.1;dbname=forum', 'root', '');
            } catch (PDOException $e) {
                if (Config::get('mysql/dbname') !== "forum") {
                    echo 'IT SHOULD BE Forum';
                }
            }
        }

        public static function getInstance(){
            if (!isset(self::$_instance)) {
                self::$_instance = new Database();
            }
            return self::$_instance;
        }

        public function query($sql, $params = []){
            $this->error = false;
            if ($this->_query = $this->_pdo->prepare($sql)) {
                if (count($params)) {
                    $x = 1;
                    foreach ($params as $param) {
                        $this->_query->bindValue($x, $param);
                        $x++;
                    }
                }
                if ($this->_query->execute()) {
                    $this->_results = $this->_query->fetchAll();
                    $this->_count = count($this->_results);
                    return $this;
                } 
            } 
            $this->_error = true;
            return $this;
        }

        // public function complexQuery($sql){
        //     $this->error = false;
        //     if($this->_query = $this->_pdo->prepare($sql)){
        //         if ($this->_query->execute()) {
        //             $this->_results = $this->_query->fetchAll();
        //             $this->_count = count($this->_results);
        //             return $this;
        //         } 
        //     }
        //     $this->_error = true;
        //     return $this;
        // }
        public function complexQuery($sql, $params = []){
            $this->error = false;
            if($this->_query = $this->_pdo->prepare($sql)){
                if ($this->_query->execute($params)) {
                    $this->_results = $this->_query->fetchAll();
                    $this->_count = count($this->_results);
                    return $this;
                } else {
                    $this->_error = true;
                    $this->_errorMessage = $this->_query->errorInfo();
                    return $this;
                } 
            } else {
                $this->_error = true;
                $this->_errorMessage = $this->_pdo->errorInfo();
                return $this;
            }
        }
       
        public function errorMessage() {
            return $this->_errorMessage;
        }
              
       
         
         
        public function action($action, $table, $where = []){
            if (count($where) === 3) {
                $operators = ['!=', '=', '>', '<', '<=', '>='];
                $field = $where[0];
                $operator = $where[1];
                $value = $where[2];
                if (in_array($operator, $operators)) {
                    $sql = "{$action} FROM {$table} WHERE {$field} {$operator} ?";
                    if (!$this->query($sql, [$value])->error()) {
                        return $this;
                    }
                }
            }
            return false;
        }

        //$where [user_id, =, 2]
    
        public function get($table, $where = []){    
            $this->action('SELECT *', $table, $where);
            return $this;
        }

        public function getWithJoin($table, $columns=[], $where = [], $joinCondition){
            $this->complexAction('SELECT *', $table, $where, $joinCondition);
            return $this;
        }

        public function delete($table, $where = []){
            $this->action('DELETE ', $table, $where);
            return $this;
        }


        

        public function insert($table, $fields = []){
            $count = count($fields);
            if ($count) {
                $keys = array_keys($fields);
                $values = '';
                $x = 1;

                foreach ($fields as $field) {
                    $values .= '?';
                    if ($x < $count) {
                        $values .= ', ';
                    }
                    $x++;
                }
                $sql = "INSERT INTO {$table} (`" . implode('`, `', $keys) . "`) VALUES ({$values})";
                if (!$this->query($sql, $fields)->error()) {
                    return $this;
                }
            }
            return false;
        }

        public function update($table, $fields = [], $user_id){
            $x = 1;
            $set = '';
            $count = count($fields);
            foreach ($fields as $name => $value) {
                $set .= "{$name} = ?";
                if ($x < $count) {
                    $set .= ", ";
                }
                $x++;
            }
            $sql = "UPDATE {$table} SET {$set} WHERE `uid` = '{$user_id}'";
            if (!$this->query($sql, $fields)->error()){
                return $this;
            }
            return false;
        }

        
        public function count(){
            return $this->_count;
        }
    
        public function error(){
            return $this->_error;
        }
    
        public function results(){  
            return $this->_results;
        }
    
        public function first(){
            return $this->results()[0];
        }

    }

    $conn = null;

?>