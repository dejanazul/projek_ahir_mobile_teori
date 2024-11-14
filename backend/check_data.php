<?php
include('connect_db.php');
$con = dbConnection();

function ErrorHandling($con, $field, $variable)
{
    $query = "SELECT * FROM `user` WHERE `$field` = '$variable'";
    $result = mysqli_query($con, $query);
    return mysqli_num_rows($result) > 0;
}

$email = $_POST["email"] ?? null;
$password = $_POST["password"] ?? null;

if (!ErrorHandling($con, 'email', $email)) {
    echo json_encode(["success" => "false", "error" => "Wrong email!"]);
    return;
}

if (!ErrorHandling($con, 'password', $password)) {
    echo json_encode(["success" => "false", "error" => "Wrong password!"]);
    return;
}

$query = "SELECT * FROM `user` WHERE `email` = '$email' AND `password` = '$password'";
$ex = mysqli_query($con, $query);

$arr = [];
if ($ex) {
    $arr['success'] = 'true';
} else {
    $arr['success'] = 'true';
    $arr['error'] = 'Error occured!';
}

print(json_encode($arr));

mysqli_close($con);
