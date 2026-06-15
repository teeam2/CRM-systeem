<?php
session_start();

$rol = $_SESSION['rol'];

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "SELECT * FROM werkzaamheden WHERE werkzaamheid_id=$id";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

if(isset($_POST['opslaan']))
{
    $sql = "UPDATE werkzaamheden SET
    medewerker_id='$_POST[medewerker_id]',
    opdracht_id='$_POST[opdracht_id]',
    datum='$_POST[datum]',
    aantal_uren='$_POST[aantal_uren]',
    omschrijving='$_POST[omschrijving]'
    WHERE werkzaamheid_id=$id";

    mysqli_query($conn, $sql);

    header("Location: CRM werkzaamheden.php");
    exit();
}
?>

<h2>Werkzaamheid wijzigen</h2>

<form method="post">

Medewerker ID:<br>
<?php if($rol == 'admin'): ?>
    <input type="text" name="medewerker_id" value="<?= $row['medewerker_id'] ?>"><br><br>
<?php else: ?>
    <input type="text" value="<?= $row['medewerker_id'] ?>" disabled><br><br>
<?php endif; ?>

Opdracht ID:<br>
<input type="text" name="opdracht_id" value="<?= $row['opdracht_id'] ?>"><br><br>

Datum:<br>
<input type="date" name="datum" value="<?= $row['datum'] ?>"><br><br>

Aantal uren:<br>
<input type="number" step="0.1" name="aantal_uren" value="<?= $row['aantal_uren'] ?>"><br><br>

Omschrijving:<br>
<textarea name="omschrijving"><?= $row['omschrijving'] ?></textarea><br><br>

<input type="submit" name="opslaan" value="Opslaan">

</form>