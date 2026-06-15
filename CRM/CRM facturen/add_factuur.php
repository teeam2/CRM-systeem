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

if(isset($_POST['toevoegen']))
{
    $klant_id = $_POST['klant_id'];
    $opdracht_id = $_POST['opdracht_id'];
    $factuurdatum = $_POST['factuurdatum'];
    $totaalbedrag = $_POST['totaalbedrag'];
    $status = $_POST['status'];

    $sql = "INSERT INTO facturen
    (klant_id, opdracht_id, factuurdatum, totaalbedrag, status)
    VALUES
    ('$klant_id', '$opdracht_id', '$factuurdatum', '$totaalbedrag', '$status')";

    mysqli_query($conn, $sql);

    header("Location: CRM facturen.php");
    exit();
}
?>

<h2>Nieuwe factuur</h2>

<link rel="stylesheet" href="../toevoegen en wijzigen.css">

<form method="post">

Klant ID:<br>
<input type="text" name="klant_id"><br><br>

Opdracht ID:<br>
<input type="text" name="opdracht_id"><br><br>

Factuurdatum:<br>
<input type="date" name="factuurdatum"><br><br>

Totaalbedrag:<br>
<input type="text" name="totaalbedrag"><br><br>

Status:<br>
<input type="text" name="status"><br><br>

<input type="submit" name="toevoegen" value="Toevoegen">

</form>