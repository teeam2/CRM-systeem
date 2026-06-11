<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "SELECT * FROM medewerkers WHERE medewerker_id=$id";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

if(isset($_POST['opslaan']))
{
    $sql = "UPDATE medewerkers SET
    voornaam='$_POST[voornaam]',
    tussenvoegsel='$_POST[tussenvoegsel]',
    achternaam='$_POST[achternaam]',
    functie='$_POST[functie]',
    email='$_POST[email]',
    wachtwoord='$_POST[wachtwoord]',
    telefoonnummer='$_POST[telefoon]',
    rol='$_POST[rol]'
    WHERE medewerker_id=$id";

    mysqli_query($conn, $sql);

    header("Location: CRM medewerkers.php");
    exit();
}
?>

<form method="post">

Voornaam: <input type="text" name="voornaam" value="<?= $row['voornaam'] ?>"><br>
Tussenvoegsel: <input type="text" name="tussenvoegsel" value="<?= $row['tussenvoegsel'] ?>"><br>
Achternaam: <input type="text" name="achternaam" value="<?= $row['achternaam'] ?>"><br>
Functie: <input type="text" name="functie" value="<?= $row['functie'] ?>"><br>
Email: <input type="text" name="email" value="<?= $row['email'] ?>"><br>
Wachtwoord: <input type="text" name="wachtwoord" value="<?= $row['wachtwoord'] ?>"><br>
Telefoon: <input type="text" name="telefoon" value="<?= $row['telefoonnummer'] ?>"><br>
Rol: <input type="text" name="rol" value="<?= $row['rol'] ?>"><br>

<input type="submit" name="opslaan" value="Opslaan">

</form>