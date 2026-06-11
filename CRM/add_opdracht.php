<?php
$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

if(isset($_POST['toevoegen']))
{
    $klant_id = $_POST['klant_id'];
    $titel = $_POST['titel'];
    $beschrijving = $_POST['beschrijving'];
    $status = $_POST['status'];
    $uurprijs = $_POST['uurprijs'];
    $startdatum = $_POST['startdatum'];
    $einddatum = $_POST['einddatum'];

    $sql = "INSERT INTO opdrachten
    (klant_id, titel, beschrijving, status, uurprijs, startdatum, einddatum)
    VALUES
    ('$klant_id', '$titel', '$beschrijving', '$status', '$uurprijs', '$startdatum', '$einddatum')";

    mysqli_query($conn, $sql);

    header("Location: CRM opdrachten.php");
    exit();
}
?>

<h2>Nieuwe opdracht</h2>

<form method="post">

Klant ID:<br>
<input type="text" name="klant_id"><br><br>

Titel:<br>
<input type="text" name="titel"><br><br>

Beschrijving:<br>
<textarea name="beschrijving"></textarea><br><br>

Status:<br>
<input type="text" name="status"><br><br>

Uurprijs:<br>
<input type="text" name="uurprijs"><br><br>

Startdatum:<br>
<input type="date" name="startdatum"><br><br>

Einddatum:<br>
<input type="date" name="einddatum"><br><br>

<input type="submit" name="toevoegen" value="Toevoegen">

</form>