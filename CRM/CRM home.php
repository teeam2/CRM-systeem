<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

error_reporting(E_ALL);
ini_set('display_errors', 1);
?>


<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Home</title>

    <style>
        /* Algemene stijl */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        /* Navigatie */
        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: rgb(0, 0, 0);
            padding: 15px 30px;
            border-bottom: 1px solid #ddd;
        }

        /* NAVBAR BALK */
        .navbar {
            display: flex;
            align-items: center;
            width: 100%;
            background-color: #000;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .navbar li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            transition: 0.3s;
        }

        /* hover effect */
        .navbar li a:hover {
            background-color: #4a90e2;
        }

        /* active page */
        .navbar li a.active {
            background-color: #4a90e2;
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
            color: rgb(255, 255, 255);
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 0px;
            padding: 0;
            margin: 0;
            color: rgb(255, 255, 255);
        }

        .nav-links a {
            text-decoration: none;
            color: #ffffff;
            font-weight: 500;
        }


        /* Hero sectie */
        .hero {
            padding: 60px 40px;
            background-color: white;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .hero h1 {
            margin: 0;
            font-size: 36px;
        }

        .hero p {
            margin-top: 10px;
            color: #555;
        }

        /* Dashboard kaarten */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            padding: 40px;
        }

        .card {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-top: 0;
        }

        .card-button {
           display: inline-block;
           margin-top: 15px;
           padding: 10px 15px;
           background-color: #0078ff;
           color: white;
           text-decoration: none; /* underline weg */
           border-radius: 6px;
           font-weight: 500;
        }

.card-button:hover {
    background-color: #005fcc;
}

    </style>
</head>
<body>

    <!-- Navigatie -->
    <nav class="navbar">
        <div class="logo">Mijn CRM</div>
        <ul class="nav-links">
            <li><a class="active" href="#">Home</a></li>
            <li><a href="CRM klanten.php">Klanten</a></li>
            <li><a href="CRM medewerkers.php">Medewerkers</a></li>
            <li><a href="CRM opdrachten.php">Opdrachten</a></li>
            <li><a href="CRM werkzaamheden.php">Werkzaamheden</a></li>
            <li><a href="CRM facturen.php">Facturen</a></li>
            <li><a href="CRM Inlog pagina.php">Inloggen</a></li>
        </ul>
    </nav>

    <!-- Hero sectie -->
    <header class="hero">
        <h1>Welkom <?php echo htmlspecialchars($_SESSION['voornaam'], ENT_QUOTES, 'UTF-8'); ?>!</h1>
        <p>Beheer je klanten, projecten en communicatie op een plek.</p>
        <p>Rol: <?php echo htmlspecialchars($_SESSION['rol'], ENT_QUOTES, 'UTF-8'); ?></p>
    </header>

    <!-- Dashboard kaarten -->
    <section class="cards">
        <div class="card">
            <h3>Klanten</h3>
            <p>Bekijk en beheer al je klantgegevens.</p>
            <a href="CRM klanten.php" class="card-button">Klanten</a>
        </div>

        <div class="card">
            <h3>Projecten</h3>
            <p>Bekijk allen klanten.</p>
            <a href="CRM medewerkers.php" class="card-button">Medewerkers</a>

        </div>

        <div class="card">
            <h3>Offertes</h3>
            <p>Bekijk allen opdrachten.</p>
            <a href="CRM opdrachten.php" class="card-button">Opdrachten</a>
        </div>

        <div class="card">
            <h3>Facturen</h3>
            <p>Bekijk allen facturen.</p>
            <a href="CRM facturen.php" class="card-button">Facturen</a>
        </div>

                <div class="card">
            <h3>Inloggen</h3>
            <p>Login.</p>
            <a href="CRM Inlog pagina.php" class="card-button">Inloggen</a>
        </div>
    </section>

</body>
</html>
