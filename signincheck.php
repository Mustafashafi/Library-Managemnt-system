<?php
require_once("connection.php");

if(isset($_POST["btn_submit"])){
     $email = $_POST['email'];
     $password = $_POST['password'];

    $query = "SELECT * FROM `user` WHERE `email` = '$email' AND `password` = '$password' ";
    $result = mysqli_query($con,$query);
    if(mysqli_num_rows($result)>0){
        $row = mysqli_fetch_assoc($result);
        $_SESSION['id'] = $row['id'];
        header("location:project.php");

    }else{
        $_SESSION['message'] = '<div class="alert alert-danger alert-dismissible fade show" role="alert" style="padding:30px 40px">
        <strong>Invalid Email or Password!</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>';
        header("location:signin.php");
    }

}


?>