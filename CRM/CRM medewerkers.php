<?php
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
  <li><a href="CRM home.html">Home</a></li>
  <li><a href="CRM klanten.php">Klanten</a></li>
  <li><a class="active" href="#">medewerkers</a></li>
  <li><a href="CRM opdrachten.php">opdrachten</a></li>

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

$sql = "SELECT medewerker_id, voornaam, tussenvoegsel, achternaam, functie, email, wachtwoord, telefoonnummer, rol, created_at FROM medewerkers";

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
    echo "<th>wachtwoord</th>";
    echo "<th>telefoonnummer</th>";
    echo "<th>rol</th>";
    echo "<th>created_at</th>";
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
        echo "<td>" . htmlspecialchars($row['wachtwoord']) . "</td>";
        echo "<td>" . htmlspecialchars($row['telefoonnummer']) . "</td>";
        echo "<td>" . htmlspecialchars($row['rol']) . "</td>";
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