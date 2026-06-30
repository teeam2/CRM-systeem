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

$klanten = mysqli_query($conn, "
    SELECT klanten_ID, Voornaam 
    FROM klanten 
    ORDER BY klanten_ID
");

$opdrachten = mysqli_query($conn, "
    SELECT opdracht_id, titel 
    FROM opdrachten 
    ORDER BY opdracht_id
");

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

Klant:<br>

<select name="klant_id" required>

    <?php while($k = mysqli_fetch_assoc($klanten)) { ?>
        <option value="<?php echo $k['klanten_ID']; ?>">
            <?php echo $k['klanten_ID'] . " - " . $k['Voornaam']; ?>
        </option>
    <?php } ?>

</select>

<br><br>

Opdracht:<br>

<select name="opdracht_id" required>

    <?php while($o = mysqli_fetch_assoc($opdrachten)) { ?>
        <option value="<?php echo $o['opdracht_id']; ?>">
            <?php echo $o['opdracht_id'] . " - " . $o['titel']; ?>
        </option>
    <?php } ?>

</select>

<br><br>

Factuurdatum:<br>
<input type="date" name="factuurdatum"><br><br>

Totaalbedrag:<br>
<input type="number" name="totaalbedrag" min="0" step="0.01" required><br><br>


Status: <select id="status" name="status"> 
    <option value="betaald">betaald</option> 
    <option value="verzonden">verzonden</option>
    <option value="open">open</option>
    <option value="te_laat">te_laat</option>
</select><br>

<input type="submit" name="toevoegen" value="Toevoegen">

</form>