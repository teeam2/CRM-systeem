<?php
session_start();


if(!isset($_SESSION['voornaam'])){
?>
    <p>Je moet eerst inloggen</p>
    <a href="../CRM inlog pagina.php">← Ga naar login</a>
<?php
    exit;
}

if($_SESSION['rol'] != 'admin'){
?>
    <p>Geen toegang</p>
    <a href="CRM werkzaamheden.php">← Terug naar overzicht</a>
<?php
    exit;
}

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "DELETE FROM werkzaamheden WHERE werkzaamheid_id=$id";
mysqli_query($conn, $sql);

header("Location: CRM werkzaamheden.php");
exit();