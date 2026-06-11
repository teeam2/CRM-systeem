<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "SELECT * FROM opdrachten WHERE opdracht_id=$id";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

if(isset($_POST['opslaan']))
{
    $sql = "UPDATE opdrachten SET
    klant_id='$_POST[klant_id]',
    titel='$_POST[titel]',
    beschrijving='$_POST[beschrijving]',
    status='$_POST[status]',
    uurprijs='$_POST[uurprijs]',
    startdatum='$_POST[startdatum]',
    einddatum='$_POST[einddatum]'
    WHERE opdracht_id=$id";

    mysqli_query($conn, $sql);

    header("Location: CRM opdrachten.php");
    exit();
}
?>

<h2>Opdracht wijzigen</h2>

<form method="post">

Klant ID:<br>
<input type="text" name="klant_id" value="<?= $row['klant_id'] ?>"><br><br>

Titel:<br>
<input type="text" name="titel" value="<?= $row['titel'] ?>"><br><br>

Beschrijving:<br>
<textarea name="beschrijving"><?= $row['beschrijving'] ?></textarea><br><br>

Status:<br>
<input type="text" name="status" value="<?= $row['status'] ?>"><br><br>

Uurprijs:<br>
<input type="text" name="uurprijs" value="<?= $row['uurprijs'] ?>"><br><br>

Startdatum:<br>
<input type="date" name="startdatum" value="<?= $row['startdatum'] ?>"><br><br>

Einddatum:<br>
<input type="date" name="einddatum" value="<?= $row['einddatum'] ?>"><br><br>

<input type="submit" name="opslaan" value="Opslaan">

</form>