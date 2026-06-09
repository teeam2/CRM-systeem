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
  <li><a href="CRM medewerkers.php">medewerkers</a></li>
  <li><a class="active" href="#">opdrachten</a></li>

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
     $db_name = "crm";
     $conn = "";

     $conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

    if($conn){
      echo "";
    }
    else{
      echo "you did not do it";
    }

$sql = "SELECT opdracht_id, klant_id, titel, beschrijving, status, uurprijs, startdatum, einddatum FROM opdrachten";

if(isset($_GET["search"]) && !empty($_GET["search"])) {
    $search_term = $_GET["search"];

    $sql .= " WHERE opdracht_id LIKE '$search_term'
              OR titel LIKE '%$search_term%'
              OR status LIKE '%$search_term%'";
}

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {

    echo "<div class='table-wrapper'>";
    echo "<table>";

    // kolom namen
    echo "<tr>";
    echo "<th>opdracht_id</th>";
    echo "<th>klant_id</th>";
    echo "<th>titel</th>";
    echo "<th>beschrijving</th>";
    echo "<th>status</th>";
    echo "<th>uurprijs</th>";
    echo "<th>startdatum</th>";
    echo "<th>einddatum</th>";
    echo "</tr>";

    // data uit database
    while($row = $result->fetch_assoc()) {

        echo "<tr>";

        echo "<td>" . htmlspecialchars($row['opdracht_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['klant_id']) . "</td>";
        echo "<td>" . htmlspecialchars($row['titel']) . "</td>";
        echo "<td>" . htmlspecialchars($row['beschrijving']) . "</td>";
        echo "<td>" . htmlspecialchars($row['status']) . "</td>";
        echo "<td>" . htmlspecialchars($row['uurprijs']) . "</td>";
        echo "<td>" . htmlspecialchars($row['startdatum']) . "</td>";
        echo "<td>" . htmlspecialchars($row['einddatum']) . "</td>";

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