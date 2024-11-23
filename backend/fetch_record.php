<?php
include("connect_db.php");
$con = dbConnection();

function ErrorHandling($con, $field, $variable)
{
    $query = "SELECT * FROM `user` WHERE `$field` = '$variable'";
    $result = mysqli_query($con, $query);
    return mysqli_num_rows($result) > 0;
}

$loginEmail = $_POST["loginEmail"] ?? null;
if (!$loginEmail) {
    echo json_encode(["error" => "Email is required"]);
    exit;
}

if (!ErrorHandling($con, 'email', $loginEmail)) {
    echo json_encode(["success" => "false", "error" => "Incorrect Email!"]);
    return;
}


$query = "SELECT `iv` FROM `user` WHERE `email` = '$loginEmail'";
$execute = mysqli_query($con, $query);

if (mysqli_num_rows($execute) > 0) {
    $row = mysqli_fetch_assoc($execute);
    $iv = $row["iv"];

    //iv diubah jadi json
    echo json_encode(["iv" => $iv]);
} else {
    echo json_encode(["error" => "Erorr Fetching Data $loginEmail"]);
}
