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
    $voornaam = $_POST['voornaam'];
    $tussenvoegsel = $_POST['tussenvoegsel'];
    $achternaam = $_POST['achternaam'];
    $functie = $_POST['functie'];
    $email = $_POST['email'];
    $wachtwoord = $_POST['wachtwoord'];
    $telefoon = $_POST['telefoon'];
    $rol = $_POST['rol'];

    $sql = "INSERT INTO medewerkers
    (voornaam, tussenvoegsel, achternaam, functie, email, wachtwoord, telefoonnummer, rol)
    VALUES
    ('$voornaam', '$tussenvoegsel', '$achternaam', '$functie', '$email', '$wachtwoord', '$telefoon', '$rol')";

    mysqli_query($conn, $sql);

    header("Location: CRM medewerkers.php");
    exit();
}
?>

<form method="post">

<link rel="stylesheet" href="../toevoegen en wijzigen.css">

Voornaam: <input type="text" name="voornaam"><br>
Tussenvoegsel: <input type="text" name="tussenvoegsel"><br>
Achternaam: <input type="text" name="achternaam"><br>
Functie: <input type="text" name="functie"><br>
Email: <input type="email" name="email"><br>
Wachtwoord: <input type="password" name="wachtwoord"><br>
Telefoon: <input type="number" name="telefoon"><br>
Rol: <select id="rol" name="rol"> 
    <option value="medewerker">Medewerker</option> 
    <option value="admin">Admin</option> 
</select><br>

<input type="submit" name="toevoegen" value="Toevoegen">

</form>