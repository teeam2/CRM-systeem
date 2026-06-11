<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

if(isset($_GET['id']))
{
    $id = $_GET['id'];

    $sql = "DELETE FROM klanten WHERE klanten_ID = $id";

    mysqli_query($conn, $sql);
}

header("Location: CRM klanten.php");
exit();