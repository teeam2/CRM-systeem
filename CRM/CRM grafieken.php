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
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Klanten</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<ul class="navbar">
  <li><a href="CRM home.php">Home</a></li>
  <li><a href="CRM klanten/CRM klanten.php">Klanten</a></li>
  <li><a href="CRM medewerkers/CRM medewerkers.php">Medewerkers</a></li>
  <li><a href="CRM opdrachten/CRM opdrachten.php">Opdrachten</a></li>
  <li><a href="CRM werkzaamheden/CRM werkzaamheden.php">Werkzaamheden</a></li>
  <li><a href="CRM facturen/CRM facturen.php">Facturen</a></li>
  <li><a class="active" href="#">Grafieken</a></li>

<li class="search-container">
    <form action="" method="get">
        <input type="text" name="search" placeholder="Search user by name">

        <div class="info-button">
            ?
            <div class="info-tooltip">
                Je kunt zoeken op:
                <ul>
                    <li>#</li>
                    <li>#</li>
                    <li>#</li>
                    <li>#</li>
                </ul>
            </div>
        </div>
        <?php if(isset($_SESSION['voornaam'])): ?>

            <a href="../logout.php" class="logout-btn">
                Uitloggen
            </a>

        <?php else: ?>

            <a href="../CRM inlog pagina.php" class="logout-btn">
                Inloggen
            </a>

        <?php endif; ?>
    </form>
</li>
</ul>



<?php 
     $db_server = "localhost";
     $db_user = "root";
     $db_pass = "";
     $db_name = "crm_systeem";
     $conn = "";

     $conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

    if($conn){
      echo "";
    }
    else{
      echo "you did not do it";
    }

$maanden = [];
$uren = [];

$sql = "
SELECT
    MONTHNAME(datum) as maand,
    SUM(aantal_uren) as totaal_uren
FROM werkzaamheden
GROUP BY MONTH(datum)
ORDER BY MONTH(datum)
";

$result = mysqli_query($conn, $sql);

while($row = mysqli_fetch_assoc($result)){
    $maanden[] = $row['maand'];
    $uren[] = $row['totaal_uren'];
}

        ?>
</div>
<div style="width: 900px; margin: 30px auto;">
    <canvas id="urenGrafiek"></canvas>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
const maanden = <?php echo json_encode($maanden); ?>;
const uren = <?php echo json_encode($uren); ?>;

const data = {
    labels: maanden,
    datasets: [{
        label: 'Gewerkte uren',
        data: uren,
        borderColor: 'rgb(75, 192, 192)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        fill: true,
        tension: 0.3
    }]
};

const config = {
    type: 'line',
    data: data,
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top'
            },
            title: {
                display: true,
                text: 'Gewerkte uren per maand'
            }
        }
    }
};

new Chart(
    document.getElementById('urenGrafiek'),
    config
);
</script>
</body>
</html>