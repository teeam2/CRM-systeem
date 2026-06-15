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
    <title>CRM Medewerkers</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<ul class="navbar">
  <li><a href="CRM home.php">Home</a></li>
  <li><a href="CRM klanten.php">Klanten</a></li>
  <li><a class="active" href="#">Medewerkers</a></li>
  <li><a href="CRM opdrachten.php">Opdrachten</a></li>
  <li><a href="CRM werkzaamheden.php">Werkzaamheden</a></li>
  <li><a href="CRM facturen.php">Facturen</a></li>
  <li><a href="CRM Inlog pagina.php">Inloggen</a></li>

<li class="search-container">
    <form action="" method="get">
        <input type="text" name="search" placeholder="Search user by name">

        <div class="info-button">
            ?
            <div class="info-tooltip">
                Je kunt zoeken op:
                <ul>
                    <li>medewerker_id</li>
                    <li>voornaam</li>
                    <li>achternaam</li>
                    <li>functie</li>
                    <li>rol</li>
                </ul>
            </div>
        </div>
    </form>
</li>
</ul>

<a href="add_medewerker.php">Nieuwe medewerker toevoegen</a>


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

$sql = "SELECT medewerker_id, voornaam, tussenvoegsel, achternaam, functie, email, telefoonnummer, rol, created_at FROM medewerkers";

if(isset($_GET["search"]) && !empty($_GET["search"])) {
    $search_term = $_GET["search"];

    $sql .= " WHERE medewerker_id LIKE '$search_term'
              OR voornaam LIKE '%$search_term%'
              OR achternaam LIKE '%$search_term%'
              OR functie LIKE '%$search_term%'
              OR rol LIKE '%$search_term%'";
}

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {

    echo "<div class='table-wrapper'>";
    echo "<table>";

    // kolom namen
    echo "<tr>";
    echo "<th>medewerker_id</th>";
    echo "<th>voornaam</th>";
    echo "<th>tussenvoegsel</th>";
    echo "<th>achternaam</th>";
    echo "<th>functie</th>";
    echo "<th>email</th>";
    echo "<th>telefoonnummer</th>";
    echo "<th>rol</th>";
    echo "<th>created_at</th>";
    echo "<th>Acties</th>";
    echo "</tr>";

    // data uit database
    while($row = $result->fetch_assoc()) {

        echo "<tr>";

        echo "<td>" . htmlspecialchars($row['medewerker_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['voornaam']) . "</td>";
        echo "<td>" . htmlspecialchars($row['tussenvoegsel'] ?? '') . "</td>";
        echo "<td>" . htmlspecialchars($row['achternaam']) . "</td>";
        echo "<td>" . htmlspecialchars($row['functie']) . "</td>";
        echo "<td>" . htmlspecialchars($row['email']) . "</td>";
        echo "<td>" . htmlspecialchars($row['telefoonnummer']) . "</td>";
        echo "<td>" . htmlspecialchars($row['rol']) . "</td>";
        echo "<td>" . htmlspecialchars($row['created_at']) . "</td>";

        echo "<td>
<a href='edit_medewerker.php?id=" . $row['medewerker_id'] . "'>Wijzigen</a>
<a href='delete_medewerker.php?id=" . $row['medewerker_id'] . "' onclick='return confirm(\"Weet je het zeker?\")'>Verwijderen</a>";

        echo "</tr>";
    }

    echo "</table>";
    echo "</div>";

} else {
    echo "0 resultaten";
}

$conn->close();

        ?>
</div>
</body>
</html>