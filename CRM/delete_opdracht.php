<?php
$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "DELETE FROM opdrachten WHERE opdracht_id=$id";
mysqli_query($conn, $sql);

header("Location: CRM opdrachten.php");
exit();