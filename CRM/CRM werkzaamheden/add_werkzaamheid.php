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

$medewerkers = mysqli_query($conn, "
    SELECT medewerker_id, voornaam 
    FROM medewerkers 
    ORDER BY medewerker_id
");

$opdrachten = mysqli_query($conn, "
    SELECT opdracht_id, titel 
    FROM opdrachten 
    ORDER BY opdracht_id
");

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

<!DOCTYPE html>
<html>
<head>
    <button type="button" onclick="window.location.href='CRM werkzaamheden.php'">
    Terug
    </button>
    <title>Werkzaamheid toevoegen</title>
    <link rel="stylesheet" href="../toevoegen en wijzigen.css">
</head>
<body>

<h2>Nieuwe werkzaamheid toevoegen</h2>

<form method="post">

Medewerker:<br>

<?php if($rol == 'admin'): ?>

<select name="medewerker_id" required>

    <?php while($m = mysqli_fetch_assoc($medewerkers)) { ?>
        <option value="<?php echo $m['medewerker_id']; ?>">
            <?php echo $m['medewerker_id'] . " - " . $m['voornaam']; ?>
        </option>
    <?php } ?>

</select>

<br><br>

<?php else: ?>

<input type="text" value="<?= $medewerker_id_session ?>" disabled>
<input type="hidden" name="medewerker_id" value="<?= $medewerker_id_session ?>">

<br><br>

<?php endif; ?>

Opdracht:<br>

<select name="opdracht_id" required>

    <?php while($o = mysqli_fetch_assoc($opdrachten)) { ?>
        <option value="<?php echo $o['opdracht_id']; ?>">
            <?php echo $o['opdracht_id'] . " - " . $o['titel']; ?>
        </option>
    <?php } ?>

</select>

<br><br>

Datum:<br>
<input type="date" name="datum"><br><br>

Aantal uren:<br>
<input type="number" step="0.1" name="aantal_uren"><br><br>

Omschrijving:<br>
<textarea name="omschrijving"></textarea><br><br>

<input type="submit" name="toevoegen" value="Toevoegen">

</form>