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

$klanten = mysqli_query($conn, "SELECT klanten_ID, Voornaam FROM klanten ORDER BY klanten_ID");

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

<link rel="stylesheet" href="../toevoegen en wijzigen.css">

<form method="post">

Klant:<br>
<select name="klant_id" required>

    <?php while($klant = mysqli_fetch_assoc($klanten)) { ?>
        <option value="<?php echo $klant['klanten_ID']; ?>">
            <?php echo $klant['klanten_ID'] . " - " . $klant['Voornaam']; ?>
        </option>
    <?php } ?>

</select><br><br>

Titel:<br>
<input type="text" name="titel"><br><br>

Beschrijving:<br>
<textarea name="beschrijving"></textarea><br><br>

Status: <select id="status" name="status"> 
    <option value="actief">actief</option> 
    <option value="afgerond">afgerond</option>
    <option value="betaald">betaald</option>
    <option value="gefactureerd">gefactureerd</option>
</select><br>

Uurprijs:<br>
<input type="number" name="uurprijs" min="0" step="0.01" required><br><br>

Startdatum:<br>
<input type="date" name="startdatum"><br><br>

Einddatum:<br>
<input type="date" name="einddatum"><br><br>

<input type="submit" name="toevoegen" value="Toevoegen">

</form>