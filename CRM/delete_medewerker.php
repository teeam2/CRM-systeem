<?php
$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "DELETE FROM medewerkers WHERE medewerker_id=$id";
mysqli_query($conn, $sql);

header("Location: CRM medewerkers.php");
exit();