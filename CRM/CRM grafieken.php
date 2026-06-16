<?php
session_start();

if(!isset($_SESSION['voornaam'])){
?>
    <p>Je moet eerst inloggen</p>
    <a href="CRM inlog pagina.php">← Ga naar login</a>
<?php
    exit;
}

if($_SESSION['rol'] != 'admin'){
?>
    <p>Geen toegang</p>
    <a href="CRM home.php">← ga naar home</a>
<?php
    exit;
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "crm_systeem";

$conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

if(!$conn){
    die("Database connectie mislukt");
}

/* =========================
   OMZET PER JAAR
========================= */
$jaren = [];
$omzet = [];

$sql2 = "
SELECT
    YEAR(startdatum) as jaar,
    SUM(uurprijs) as totaal_omzet
FROM opdrachten
GROUP BY YEAR(startdatum)
ORDER BY YEAR(startdatum)
";

$result2 = mysqli_query($conn, $sql2);

while($row = mysqli_fetch_assoc($result2)){
    $jaren[] = $row['jaar'];
    $omzet[] = $row['totaal_omzet'];
}

/* =========================
   UREN PER MAAND
========================= */
$maanden = [];
$uren = [];

$sql = "
SELECT
    MONTHNAME(datum) as maand,
    SUM(aantal_uren) as totaal_uren
FROM werkzaamheden
GROUP BY MONTH(datum), MONTHNAME(datum)
ORDER BY MONTH(datum)
";

$result = mysqli_query($conn, $sql);

while($row = mysqli_fetch_assoc($result)){
    $maanden[] = $row['maand'];
    $uren[] = $row['totaal_uren'];
}

/* =========================
   STATUSSEN OPDRACHTEN
========================= */
$statusLabels = [];
$statusCounts = [];

$sql3 = "
SELECT
    status,
    COUNT(*) as aantal
FROM opdrachten
GROUP BY status
ORDER BY status
";

$result3 = mysqli_query($conn, $sql3);

while($row = mysqli_fetch_assoc($result3)){
    $statusLabels[] = $row['status'];
    $statusCounts[] = $row['aantal'];
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>CRM Grafieken</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAV -->
<ul class="navbar">
  <li><a href="CRM home.php">Home</a></li>
  <li><a href="CRM klanten/CRM klanten.php">Klanten</a></li>
  <li><a href="CRM medewerkers/CRM medewerkers.php">Medewerkers</a></li>
  <li><a href="CRM opdrachten/CRM opdrachten.php">Opdrachten</a></li>
  <li><a href="CRM werkzaamheden/CRM werkzaamheden.php">Werkzaamheden</a></li>
  <li><a href="CRM facturen/CRM facturen.php">Facturen</a></li>
  <li><a class="active" href="#">Grafieken</a></li>
</ul>

<!-- GRAFIEKEN -->
<div style="width: 900px; margin: 30px auto;">
    <canvas id="urenGrafiek"></canvas>
</div>

<div style="width: 900px; margin: 30px auto;">
    <canvas id="omzetGrafiek"></canvas>
</div>

<div style="width: 900px; margin: 30px auto;">
    <canvas id="statusGrafiek"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

/* =========================
   PHP → JS DATA
========================= */
const jaren = <?php echo json_encode($jaren); ?>;
const omzet = <?php echo json_encode($omzet); ?>;

const maanden = <?php echo json_encode($maanden); ?>;
const uren = <?php echo json_encode($uren); ?>;

const statusLabels = <?php echo json_encode($statusLabels); ?>;
const statusCounts = <?php echo json_encode($statusCounts); ?>;

/* =========================
   1. UREN PER MAAND
========================= */
new Chart(document.getElementById('urenGrafiek'), {
    type: 'line',
    data: {
        labels: maanden,
        datasets: [{
            label: 'Gewerkte uren',
            data: uren,
            borderColor: 'rgb(75, 192, 192)',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            fill: true,
            tension: 0.3
        }]
    }
});

/* =========================
   2. OMZET PER JAAR
========================= */
new Chart(document.getElementById('omzetGrafiek'), {
    type: 'line',
    data: {
        labels: jaren,
        datasets: [{
            label: 'Omzet per jaar (€)',
            data: omzet,
            borderColor: 'rgb(255, 99, 132)',
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            fill: true,
            tension: 0.3
        }]
    }
});

/* =========================
   3. STATUSSEN (STAafdiagram)
========================= */
new Chart(document.getElementById('statusGrafiek'), {
    type: 'bar',
    data: {
        labels: statusLabels,
        datasets: [{
            label: 'Aantal opdrachten',
            data: statusCounts,
            backgroundColor: 'rgba(54, 162, 235, 0.6)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
        }]
    }
});

</script>

</body>
</html>