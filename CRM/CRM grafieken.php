<?php
session_start();

if(!isset($_SESSION['voornaam'])){
?>
    <p>Je moet eerst inloggen</p>
    <a href="CRM inlog pagina.php">← Ga naar login</a>
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
   UREN PER MAAND
========================= */
$maanden = [];
$uren = [];

$sql1 = "
SELECT
    MONTHNAME(datum) as maand,
    SUM(aantal_uren) as totaal_uren
FROM werkzaamheden
GROUP BY MONTH(datum), MONTHNAME(datum)
ORDER BY MONTH(datum)
";

$result1 = mysqli_query($conn, $sql1);

while($row = mysqli_fetch_assoc($result1)){
    $maanden[] = $row['maand'];
    $uren[] = $row['totaal_uren'];
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
   STATUS OPDRACHTEN
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

/* =========================
   MEDEWERKERS PER FUNCTIE
========================= */
$functieLabels = [];
$functieCounts = [];

$sql4 = "
SELECT
    functie,
    COUNT(*) as aantal
FROM medewerkers
GROUP BY functie
ORDER BY functie
";

$result4 = mysqli_query($conn, $sql4);

while($row = mysqli_fetch_assoc($result4)){
    $functieLabels[] = $row['functie'];
    $functieCounts[] = $row['aantal'];
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

<ul class="navbar">
    <li class="nav-title">Mijn CRM</li>
    <li><a href="CRM home.php">Home</a></li>
<?php
  if($_SESSION['rol'] == 'admin'){
?>
  <li><a href="CRM klanten/CRM klanten.php">Klanten</a></li>
  <li><a href="CRM medewerkers/CRM medewerkers.php">Medewerkers</a></li>
  <li><a href="CRM opdrachten/CRM opdrachten.php">Opdrachten</a></li>
<?php
}?>
  <li><a href="CRM werkzaamheden/CRM werkzaamheden.php">Werkzaamheden</a></li>
<?php
  if($_SESSION['rol'] == 'admin'){
?>
  <li><a href="CRM facturen/CRM facturen.php">Facturen</a></li>
<?php
}?>
  <li><a class="active" href="#">Grafieken</a></li>

  <li class="search-container">
    <form action="" method="get">

        <?php if(isset($_SESSION['voornaam'])): ?>

            <a href="logout.php" class="logout-btn">
                Uitloggen
            </a>

        <?php else: ?>

            <a href="CRM inlog pagina.php" class="logout-btn">
                Inloggen
            </a>

        <?php endif; ?>
    </form>
</li>
</ul>

<!-- LAYOUT: 2 naast elkaar -->
<div style="display:flex; justify-content:center; gap:20px; flex-wrap:wrap; margin:30px auto; width:95%;">

    <div style="width:45%;">
        <canvas id="urenGrafiek"></canvas>
    </div>

    <div style="width:45%;">
        <canvas id="omzetGrafiek"></canvas>
    </div>

</div>

<div style="display:flex; justify-content:center; gap:20px; flex-wrap:wrap; margin:30px auto; width:95%;">

    <div style="width:45%;">
        <canvas id="statusGrafiek"></canvas>
    </div>

    <div style="width:45%;">
        <canvas id="functieGrafiek"></canvas>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

/* =========================
   PHP → JS DATA
========================= */
const maanden = <?php echo json_encode($maanden ?? []); ?>;
const uren = <?php echo json_encode($uren ?? []); ?>;

const jaren = <?php echo json_encode($jaren ?? []); ?>;
const omzet = <?php echo json_encode($omzet ?? []); ?>;

const statusLabels = <?php echo json_encode($statusLabels ?? []); ?>;
const statusCounts = <?php echo json_encode($statusCounts ?? []); ?>;

const functieLabels = <?php echo json_encode($functieLabels ?? []); ?>;
const functieCounts = <?php echo json_encode($functieCounts ?? []); ?>;

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
   3. STATUS OPDRACHTEN
========================= */
new Chart(document.getElementById('statusGrafiek'), {
    type: 'bar',
    data: {
        labels: statusLabels,
        datasets: [{
            label: 'Aantal opdrachten',
            data: statusCounts,
            backgroundColor: 'rgba(54, 162, 235, 0.6)',
            borderWidth: 1
        }]
    }
});

/* =========================
   4. MEDEWERKERS FUNCTIE
========================= */
new Chart(document.getElementById('functieGrafiek'), {
    type: 'bar',
    data: {
        labels: functieLabels,
        datasets: [{
            label: 'Medewerkers per functie',
            data: functieCounts,
            backgroundColor: 'rgba(153, 102, 255, 0.6)',
            borderWidth: 1
        }]
    }
});

</script>

</body>
</html>