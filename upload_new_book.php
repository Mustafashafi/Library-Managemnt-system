<?php
require_once("connection.php");

if(isset($_POST['add_book_btn'])){
    $name = $_POST['book_name'];
    $author = $_POST['Author'];
    $id = $_POST['book_id'];
    $quantity = $_POST['Quantity'];
    $allowed_extensions = array("png", "jpg", "jpeg", "gif");

    // Check if the book ID already exists
    $check_query = "SELECT * FROM `available_books` WHERE `book_id` = '$id'";
    $result = mysqli_query($con, $check_query);

    if(mysqli_num_rows($result) > 0){
        // Book ID already exists, display message
        $_SESSION['message'] = '<div class="alert alert-danger alert-dismissible" style="text-align:center;">
                               Book ID already exists!..
                            </div>';
        header("location:addbook.php");
        exit; // Stop execution
    }

    // Extract the file extension
    $file_extension = pathinfo($_FILES['photo']['name'], PATHINFO_EXTENSION);
    $file_extension = strtolower($file_extension); // Convert to lowercase to ensure case-insensitive check

    // Check if the file extension is allowed
    if(in_array($file_extension, $allowed_extensions)){
        // If the book ID is unique, proceed with insertion
        if(move_uploaded_file($_FILES['photo']['tmp_name'], "images/".$_FILES['photo']['name'])){
            $photo = $_FILES['photo']['name'];
            $query = "INSERT INTO `available_books` VALUES ('$id','$name','$author','$quantity','$photo') ";

            if(mysqli_query($con, $query)){
                // Book inserted successfully
                $_SESSION['message'] = '<div class="alert alert-success alert-dismissible" style="text-align:center;">
                                       Book uploaded Successfully!.. 
                                    </div>';
                header("location:addbook.php");
            }else{
                // Failed to insert book
                $_SESSION['message'] = '<div class="alert alert-danger alert-dismissible" style="text-align:center;">
                                       Book Failed to upload Successfully!.. 
                                    </div>';
            }
        }else{
            // Failed to move uploaded file
            $_SESSION['message'] = '<div class="alert alert-danger alert-dismissible" style="text-align:center;">
                                   Book not uploaded Successfully!.. 
                                </div>';
        }
    }else{
        // Invalid file format
        $_SESSION['message'] = '<div class="alert alert-danger alert-dismissible" style="text-align:center;">
                               Invalid file format! Only PNG, JPG, and GIF are allowed.
                            </div>';
        header("location:addbook.php");
    }
}
?>
