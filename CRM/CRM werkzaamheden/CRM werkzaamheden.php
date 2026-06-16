<?php
session_start();

if(!isset($_SESSION['voornaam'])){
?>
    <p>Je moet eerst inloggen</p>
    <a href="../CRM inlog pagina.php">← Ga naar login</a>
<?php
    exit;
}

error_reporting(E_ALL);
ini_set('display_errors', 1);

// rol + medewerker_id ophalen
$rol = $_SESSION['rol'];
$medewerker_id = $_SESSION['medewerker_id'];
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Werkzaamheden</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>

<ul class="navbar">
  <li><a href="../CRM home.php">Home</a></li>
  <li><a href="../CRM klanten/CRM klanten.php">Klanten</a></li>
  <li><a href="../CRM medewerkers/CRM medewerkers.php">Medewerkers</a></li>
  <li><a href="../CRM opdrachten/CRM opdrachten.php">Opdrachten</a></li>
  <li><a class="active" href="#">Werkzaamheden</a></li>
  <li><a href="../CRM facturen/CRM facturen.php">Facturen</a></li>

  <li class="search-container">
    <form action="" method="get">
        <input type="text" name="search" placeholder="Search user by name">

        <div class="info-button">
            ?
            <div class="info-tooltip">
                Je kunt zoeken op:
                <ul>
                    <li>werkzaamheid_id</li>
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

<a href="add_werkzaamheid.php">Nieuwe werkzaamheid toevoegen</a>

<?php 
$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "crm_systeem";

$conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

if(!$conn){
    die("Database connectie mislukt");
}

// ✅ BELANGRIJK: basis query
$sql = "SELECT werkzaamheid_id, medewerker_id, opdracht_id, datum, aantal_uren, omschrijving, created_at 
        FROM werkzaamheden 
        WHERE 1=1";

// 🔒 ROLE FILTER
if ($rol == 'medewerker') {
    $sql .= " AND medewerker_id = $medewerker_id";
}

// 🔎 SEARCH (gecombineerd met rol-filter)
if(isset($_GET["search"]) && !empty($_GET["search"])) {
    $search_term = $_GET["search"];
    $sql .= " AND werkzaamheid_id LIKE '$search_term'";
}

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {

    echo "<div class='table-wrapper'>";
    echo "<table>";

    echo "<tr>";
    echo "<th>werkzaamheid_id</th>";
    echo "<th>medewerker_id</th>";
    echo "<th>opdracht_id</th>";
    echo "<th>datum</th>";
    echo "<th>aantal_uren</th>";
    echo "<th>omschrijving</th>";
    echo "<th>created_at</th>";
    echo "<th>Acties</th>";
    echo "</tr>";

    while($row = $result->fetch_assoc()) {

        echo "<tr>";

        echo "<td>" . htmlspecialchars($row['werkzaamheid_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['medewerker_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['opdracht_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['datum']) . "</td>";
        echo "<td>" . htmlspecialchars($row['aantal_uren']) . "</td>";
        echo "<td>" . htmlspecialchars($row['omschrijving']) . "</td>";
        echo "<td>" . htmlspecialchars($row['created_at']) . "</td>";

        echo "<td>";

        echo "<a href='edit_werkzaamheid.php?id=" . $row['werkzaamheid_id'] . "'>Wijzigen</a> ";

        if ($_SESSION['rol'] == 'admin') {
            echo "<a href='delete_werkzaamheid.php?id=" . $row['werkzaamheid_id'] . "' 
                onclick='return confirm(\"Weet je het zeker?\")'>
                Verwijderen
                </a>";
        }

        echo "</td>";

        echo "</tr>";
    }

    echo "</table>";
    echo "</div>";

} else {
    echo "0 resultaten";
}

$conn->close();
?>

</body>
</html>