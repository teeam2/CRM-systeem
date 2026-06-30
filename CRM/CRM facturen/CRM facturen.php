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
    <a href="../CRM home.php">← ga naar home</a>
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
    <title>CRM Facturen</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>

<ul class="navbar">
    <li class="nav-title">Mijn CRM</li>
    <li><a href="../CRM home.php">Home</a></li>
    <li><a href="../CRM klanten/CRM klanten.php">Klanten</a></li>
    <li><a href="../CRM medewerkers/CRM medewerkers.php">Medewerkers</a></li>
    <li><a href="../CRM opdrachten/CRM opdrachten.php">Opdrachten</a></li>
    <li><a href="../CRM werkzaamheden/CRM werkzaamheden.php">Werkzaamheden</a></li>
    <li><a class="active" href="#">Facturen</a></li>
    <li><a href="../CRM grafieken.php">Grafieken</a></li>
    <li><a href="../CRM AVG.php">AVG</a></li>

<li class="search-container">
    <form action="" method="get">
        <input type="text" name="search" placeholder="Search user by name">

        <div class="info-button">
            ?
            <div class="info-tooltip">
                Je kunt zoeken op:
                <ul>
                    <li>factuur_id</li>
                    <li>status</li>
                    <li>factuurdatum</li>
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

<a class="fancy-button" href="add_factuur.php">Nieuwe factuur toevoegen</a>

<?php

$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "crm_systeem";

$conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

if(!$conn){
    die("Database connectie mislukt");
}

$sql = "SELECT factuur_id,
               klant_id,
               opdracht_id,
               factuurdatum,
               totaalbedrag,
               status,
               created_at
        FROM facturen";

if(isset($_GET["search"]) && !empty($_GET["search"])) {

    $search_term = $_GET["search"];

    $sql .= " WHERE factuur_id LIKE '$search_term'
              OR status LIKE '%$search_term%'
              OR factuurdatum LIKE '$search_term'";
}

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {

    echo "<div class='table-wrapper'>";
    echo "<table>";

    echo "<tr>";
    echo "<th>factuur_id</th>";
    echo "<th>klant_id</th>";
    echo "<th>opdracht_id</th>";
    echo "<th>factuurdatum</th>";
    echo "<th>totaalbedrag</th>";
    echo "<th>status</th>";
    echo "<th>created_at</th>";
    echo "<th>Acties</th>";
    echo "</tr>";

    while($row = $result->fetch_assoc()) {

        echo "<tr>";

        echo "<td>" . htmlspecialchars($row['factuur_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['klant_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['opdracht_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['factuurdatum']) . "</td>";
        echo "<td>" . htmlspecialchars($row['totaalbedrag']) . "</td>";
        echo "<td>" . htmlspecialchars($row['status']) . "</td>";
        echo "<td>" . htmlspecialchars($row['created_at']) . "</td>";

        echo "<td>

        <a href='edit_factuur.php?id=" . $row['factuur_id'] . "'>
        Wijzigen
        </a>
  

        <a href='delete_factuur.php?id=" . $row['factuur_id'] . "'
        onclick='return confirm(\"Weet je het zeker?\")'>
        Verwijderen
        </a>

        
        <a href='download_factuur.php?id=" . $row['factuur_id'] . "'>
        PDF
        </a>


        <a href='verstuur_factuur.php?id=" . $row['factuur_id'] . "'>
        Versturen
        </a>

        </td>";

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
```
