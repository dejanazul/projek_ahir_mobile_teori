<?php
include("connect_db.php");
$con = dbConnection();

$username = $_POST['username'] ?? null;
$email = $_POST['email'] ?? null;
$password = $_POST['password'] ?? null;

$query = "INSERT INTO `user` (`username`, `email`, `password`) VALUES ('$username', '$email', '$password')";
$ex = mysqli_query($con, $query);

$arr = [];

if ($ex) {
    $arr['success'] = 'true';
} else {
    $arr['success'] = 'false';
}

print(json_encode($arr));

mysqli_close($con);
