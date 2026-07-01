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

$sql = "SELECT * FROM facturen WHERE factuur_id=$id";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

if(isset($_POST['opslaan']))
{
    $sql = "UPDATE facturen SET
    klant_id='$_POST[klant_id]',
    opdracht_id='$_POST[opdracht_id]',
    factuurdatum='$_POST[factuurdatum]',
    totaalbedrag='$_POST[totaalbedrag]',
    status='$_POST[status]'
    WHERE factuur_id=$id";

    mysqli_query($conn, $sql);

    header("Location: CRM facturen.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <button type="button" onclick="window.location.href='CRM facturen.php'">
    Terug
    </button>
    <title>Factuur wijzigen</title>
    <link rel="stylesheet" href="../toevoegen en wijzigen.css">
</head>
<body>

<h2>Factuur wijzigen</h2>

<link rel="stylesheet" href="../toevoegen en wijzigen.css">

<form method="post">

Klant ID:<br>
<input type="text" name="klant_id" value="<?= $row['klant_id'] ?>"><br><br>

Opdracht ID:<br>
<input type="text" name="opdracht_id" value="<?= $row['opdracht_id'] ?>"><br><br>

Factuurdatum:<br>
<input type="date" name="factuurdatum" value="<?= $row['factuurdatum'] ?>"><br><br>

Totaalbedrag:<br>
<input type="text" name="totaalbedrag" value="<?= $row['totaalbedrag'] ?>"><br><br>

Status:<br>
<input type="text" name="status" value="<?= $row['status'] ?>"><br><br>

<input type="submit" name="opslaan" value="Opslaan">

</form>

</body>
</html>