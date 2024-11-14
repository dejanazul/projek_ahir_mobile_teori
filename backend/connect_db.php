<?php
    function dbConnection(){
        $con = mysqli_connect('localhost', 'root', '', 'project_ahir_mobile_teori');
        return $con;
    }