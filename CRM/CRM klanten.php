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
  <li><a class="active" href="#">Klanten</a></li>
  <li><a href="CRM medewerkers.php">medewerkers</a></li>
  <li><a href="CRM opdrachten.php">opdrachten</a></li>
  <li><a href="CRM facturen.php">facturen</a></li>

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

$sql = "SELECT klanten_ID, Voornaam, Tussenvoegsel, Achternaam, bedrijfsnaam, functie, email, PhoneNumber FROM klanten";

if(isset($_GET["search"]) && !empty($_GET["search"])) {
    $search_term = $_GET["search"];

    $sql .= " WHERE klanten_ID LIKE '$search_term'
              OR Voornaam LIKE '%$search_term%'
              OR Achternaam LIKE '%$search_term%'
              OR bedrijfsnaam LIKE '%$search_term%'";
}

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {

    echo "<div class='table-wrapper'>";
    echo "<table>";

    // kolom namen
    echo "<tr>";
    echo "<th>klanten_ID</th>";
    echo "<th>Voornaam</th>";
    echo "<th>Tussenvoegsel</th>";
    echo "<th>Achternaam</th>";
    echo "<th>bedrijfsnaam</th>";
    echo "<th>functie</th>";
    echo "<th>email</th>";
    echo "<th>PhoneNumber</th>";
    echo "</tr>";

    // data uit database
    while($row = $result->fetch_assoc()) {

        echo "<tr>";

        echo "<td>" . htmlspecialchars($row['klanten_ID']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Voornaam']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Tussenvoegsel']) . "</td>";
        echo "<td>" . htmlspecialchars($row['Achternaam']) . "</td>";
        echo "<td>" . htmlspecialchars($row['bedrijfsnaam']) . "</td>";
        echo "<td>" . htmlspecialchars($row['functie']) . "</td>";
        echo "<td>" . htmlspecialchars($row['email']) . "</td>";
        echo "<td>" . htmlspecialchars($row['PhoneNumber']) . "</td>";

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