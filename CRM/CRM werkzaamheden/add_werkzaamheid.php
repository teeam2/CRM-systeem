<?php
session_start();
$rol = $_SESSION['rol'];
$medewerker_id_session = $_SESSION['medewerker_id'];

if(!isset($_SESSION['voornaam'])){
?>
    <p>Je moet eerst inloggen</p>
    <a href="../CRM inlog pagina.php">← Ga naar login</a>
<?php
    exit;
}

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

if(isset($_POST['toevoegen']))
{
    $medewerker_id = $_POST['medewerker_id'];
    $opdracht_id = $_POST['opdracht_id'];
    $datum = $_POST['datum'];
    $aantal_uren = $_POST['aantal_uren'];
    $omschrijving = $_POST['omschrijving'];

    $sql = "INSERT INTO werkzaamheden
    (medewerker_id, opdracht_id, datum, aantal_uren, omschrijving)
    VALUES
    ('$medewerker_id', '$opdracht_id', '$datum', '$aantal_uren', '$omschrijving')";

    mysqli_query($conn, $sql);

    header("Location: CRM werkzaamheden.php");
    exit();
}
?>

<h2>Nieuwe werkzaamheid</h2>

<form method="post">

Medewerker ID:<br>

<?php if($rol == 'admin'): ?>

    <input type="text" name="medewerker_id"><br><br>

<?php else: ?>

    <input type="text" value="<?= $medewerker_id_session ?>" disabled>
    <input type="hidden" name="medewerker_id" value="<?= $medewerker_id_session ?>">

    <br><br>

<?php endif; ?>

Opdracht ID:<br>
<input type="text" name="opdracht_id"><br><br>

Datum:<br>
<input type="date" name="datum"><br><br>

Aantal uren:<br>
<input type="number" step="0.1" name="aantal_uren"><br><br>

Omschrijving:<br>
<textarea name="omschrijving"></textarea><br><br>

<input type="submit" name="toevoegen" value="Toevoegen">

</form>