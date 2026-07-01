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

$sql = "SELECT * FROM klanten WHERE klanten_ID = $id";
$result = mysqli_query($conn, $sql);

$row = mysqli_fetch_assoc($result);

if(isset($_POST['opslaan']))
{
    $voornaam = $_POST['voornaam'];
    $tussenvoegsel = $_POST['tussenvoegsel'];
    $achternaam = $_POST['achternaam'];
    $bedrijfsnaam = $_POST['bedrijfsnaam'];
    $functie = $_POST['functie'];
    $email = $_POST['email'];
    $telefoon = $_POST['telefoon'];

    $sql = "UPDATE klanten SET
            Voornaam='$voornaam',
            Tussenvoegsel='$tussenvoegsel',
            Achternaam='$achternaam',
            bedrijfsnaam='$bedrijfsnaam',
            functie='$functie',
            email='$email',
            PhoneNumber='$telefoon'
            WHERE klanten_ID=$id";

    mysqli_query($conn, $sql);

    header("Location: CRM klanten.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <button type="button" onclick="window.location.href='CRM klanten.php'">
    Terug
    </button>
    <title>Klant wijzigen</title>
    <link rel="stylesheet" href="../toevoegen en wijzigen.css">
</head>
<body>

<h2>Klant wijzigen</h2>

<form method="post">

    Voornaam:<br>
    <input type="text" name="voornaam"
    value="<?php echo $row['Voornaam']; ?>"><br><br>

    Tussenvoegsel:<br>
    <input type="text" name="tussenvoegsel"
    value="<?php echo $row['Tussenvoegsel']; ?>"><br><br>

    Achternaam:<br>
    <input type="text" name="achternaam"
    value="<?php echo $row['Achternaam']; ?>"><br><br>

    Bedrijfsnaam:<br>
    <input type="text" name="bedrijfsnaam"
    value="<?php echo $row['bedrijfsnaam']; ?>"><br><br>

    Functie:<br>
    <input type="text" name="functie"
    value="<?php echo $row['functie']; ?>"><br><br>

    Email:<br>
    <input type="email" name="email"
    value="<?php echo $row['email']; ?>"><br><br>

    Telefoon:<br>
    <input type="text" name="telefoon"
    value="<?php echo $row['PhoneNumber']; ?>"><br><br>

    <input type="submit" name="opslaan" value="Opslaan">

</form>

</body>
</html>