<?php
include("connect_db.php");
$con = dbConnection();

function ErrorHandling($con, $field, $variable)
{
    $query = "SELECT * FROM `user` WHERE `$field` = '$variable'";
    $result = mysqli_query($con, $query);
    return mysqli_num_rows($result) > 0;
}

$username = $_POST['username'] ?? null;
$email = $_POST['email'] ?? null;
$password = $_POST['password'] ?? null;

if (ErrorHandling($con, 'username', $username)) {
    echo json_encode(["success" => "false", "error" => "Username already exist!"]);
    return;
}

if (ErrorHandling($con, 'email', $email)) {
    echo json_encode(["success" => "false", "error" => "Email already exist!"]);
    return;
}

$query = "INSERT INTO `user` (`username`, `email`, `password`) VALUES ('$username', '$email', '$password')";
$ex = mysqli_query($con, $query);

$arr = [];
if ($ex) {
    $arr['success'] = 'true';
} else {
    $arr['success'] = 'false';
    $arr['error'] = 'Error occured';
}

print(json_encode($arr));

mysqli_close($con);
