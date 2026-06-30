<?php
session_start();

error_reporting(E_ALL);
ini_set('display_errors', 1);
?>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- Navigatie -->
<ul class="navbar">

    <!-- Titel links -->
    <li class="nav-title">Mijn CRM</li>

    <li><a href="CRM home.php">Home</a></li>
<?php
  if(isset($_SESSION['rol']) && $_SESSION['rol'] == 'admin'){
?>
    <li><a href="CRM klanten/CRM klanten.php">Klanten</a></li>
    <li><a href="CRM medewerkers/CRM medewerkers.php">Medewerkers</a></li>
    <li><a href="CRM opdrachten/CRM opdrachten.php">Opdrachten</a></li>
<?php
}?>
<?php
  if(isset($_SESSION['rol'])){
?>
    <li><a href="CRM werkzaamheden/CRM werkzaamheden.php">Werkzaamheden</a></li>
<?php
}?>
<?php
  if(isset($_SESSION['rol']) && $_SESSION['rol'] == 'admin'){
?>
    <li><a href="CRM facturen/CRM facturen.php">Facturen</a></li>
<?php
}?>
<?php
  if(isset($_SESSION['rol'])){
?>
    <li><a href="CRM grafieken.php">Grafieken</a></li>
<?php
}?>
    <li><a class="active" href="#">AVG</a></li>

    <!-- knop rechts -->
    <li class="nav-right">

        <?php if(isset($_SESSION['voornaam'])): ?>
            <a href="logout.php" class="logout-btn">
                Uitloggen
            </a>

        <?php else: ?>
            <a href="CRM Inlog pagina.php" class="logout-btn">
                Inloggen
            </a>
        <?php endif; ?>

    </li>
</ul>
 
<div class="avg-container">

<h1>AVG privacywetten</h1>
<h3>De AVG is gebaseerd op zes kernbeginselen:</h3>

<div class="avg-rule">
  <h4>1. Rechtmatigheid, behoorlijkheid en transparantie</h4>
  <p>Je moet duidelijk en eerlijk uitleggen welke gegevens je verzamelt en waarom.</p>
</div>

<div class="avg-rule">
  <h4>2. Doelbinding</h4>
  <p>Gegevens mogen alleen voor een specifiek, vooraf bepaald doel worden verzameld en niet voor iets anders.</p>
</div>

<div class="avg-rule">
  <h4>3. Minimale gegevensverwerking</h4>
  <p>Verzamel niet méér gegevens dan noodzakelijk.</p>
</div>

<div class="avg-rule">
  <h4>4. Juistheid</h4>
  <p>Persoonsgegevens moeten correct en actueel zijn.</p>
</div>

<div class="avg-rule">
  <h4>5. Opslagbeperking</h4>
  <p>Bewaar gegevens niet langer dan nodig.</p>
</div>

<div class="avg-rule">
  <h4>6. Integriteit en vertrouwelijkheid</h4>
  <p>Je moet persoonsgegevens goed beveiligen tegen misbruik, verlies of diefstal.</p>
</div>

</div>


</body>
</html>