<?php
$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "DELETE FROM facturen WHERE factuur_id=$id";
mysqli_query($conn, $sql);

header("Location: CRM facturen.php");
exit();