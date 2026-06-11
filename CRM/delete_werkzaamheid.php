<?php
$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "DELETE FROM werkzaamheden WHERE werkzaamheid_id=$id";
mysqli_query($conn, $sql);

header("Location: CRM werkzaamheden.php");
exit();