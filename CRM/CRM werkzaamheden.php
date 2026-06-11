<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

error_reporting(E_ALL);
ini_set('display_errors', 1);
?>

<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css"> 
</head>
<body>
<ul class="navbar">
  <li><a href="CRM home.php">Home</a></li>
  <li><a href="CRM klanten.php">Klanten</a></li>
  <li><a href="CRM medewerkers.php">Medewerkers</a></li>
  <li><a href="CRM opdrachten.php">Opdrachten</a></li>
  <li><a class="active" href="#">Werkzaamheden</a></li>
  <li><a href="CRM facturen.php">Facturen</a></li>
  <li><a href="CRM Inlog pagina.php">Inloggen</a></li>

  <li class="search-container">
      <form action="" method="get">
          <input type="text" name="search" placeholder="Search user by name">
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

$sql = "SELECT werkzaamheid_id, medewerker_id, opdracht_id, datum, aantal_uren, omschrijving, created_at FROM werkzaamheden";

if(isset($_GET["search"]) && !empty($_GET["search"])) {
    $search_term = $_GET["search"];

    $sql .= " WHERE werkzaamheid_id LIKE '$search_term'";
}

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {

    echo "<div class='table-wrapper'>";
    echo "<table>";

    // kolom namen
    echo "<tr>";
    echo "<th>werkzaamheid_id</th>";
    echo "<th>medewerker_id</th>";
    echo "<th>opdracht_id</th>";
    echo "<th>datum</th>";
    echo "<th>aantal_uren</th>";
    echo "<th>omschrijving</th>";
    echo "<th>created_at</th>";
    echo "</tr>";

    // data uit database
    while($row = $result->fetch_assoc()) {

        echo "<tr>";

        echo "<td>" . htmlspecialchars($row['werkzaamheid_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['medewerker_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['opdracht_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['datum']) . "</td>";
        echo "<td>" . htmlspecialchars($row['aantal_uren']) . "</td>";
        echo "<td>" . htmlspecialchars($row['omschrijving']) . "</td>";
        echo "<td>" . htmlspecialchars($row['created_at']) . "</td>";


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