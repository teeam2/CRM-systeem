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

if(isset($_GET['id']))
{
    $id = (int)$_GET['id'];

    try {

        $sql = "DELETE FROM klanten WHERE klanten_ID = $id";
        mysqli_query($conn, $sql);

        header("Location: CRM klanten.php?success=1");
        exit();

    } catch (mysqli_sql_exception $e) {

        header("Location: CRM klanten.php?error=facturen");
        exit();

    }
}