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



        ?>
</div>
</body>
</html>