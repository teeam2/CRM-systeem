<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

if($_SESSION['rol'] != 'admin'){
    die("Geen toegang");
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "DELETE FROM facturen WHERE factuur_id=$id";
mysqli_query($conn, $sql);

header("Location: CRM facturen.php");
exit();