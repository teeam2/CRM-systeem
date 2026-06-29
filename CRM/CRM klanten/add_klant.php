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
    $bedrijfsnaam = $_POST['bedrijfsnaam'];
    $functie = $_POST['functie'];
    $email = $_POST['email'];
    $telefoon = $_POST['telefoon'];

    $sql = "INSERT INTO klanten
    (Voornaam, Tussenvoegsel, Achternaam, bedrijfsnaam, functie, email, PhoneNumber)
    VALUES
    ('$voornaam', '$tussenvoegsel', '$achternaam', '$bedrijfsnaam', '$functie', '$email', '$telefoon')";

    mysqli_query($conn, $sql);

    header("Location: CRM klanten.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Klant toevoegen</title>
    <link rel="stylesheet" href="../toevoegen en wijzigen.css">
</head>
<body>

<h2>Nieuwe klant toevoegen</h2>

<form method="post">

    Voornaam:<br>
    <input type="text" name="voornaam"><br><br>

    Tussenvoegsel:<br>
    <input type="text" name="tussenvoegsel"><br><br>

    Achternaam:<br>
    <input type="text" name="achternaam"><br><br>

    Bedrijfsnaam:<br>
    <input type="text" name="bedrijfsnaam"><br><br>

    Functie:<br>
    <input type="text" name="functie"><br><br>

    Email:<br>
    <input type="email" name="email"><br><br>

    Telefoon:<br>
    <input type="number" name="telefoon"><br><br>

    <input type="submit" name="toevoegen" value="Toevoegen">

</form>

</body>
</html>