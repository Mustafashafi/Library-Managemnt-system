<?php 
session_start();

$con = mysqli_connect("localhost","root","","project");
if(mysqli_connect_error()){
    echo "connection failed";
}


?>