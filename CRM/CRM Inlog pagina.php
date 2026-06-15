<?php
session_start();

error_reporting(E_ALL);
ini_set('display_errors', 1);

$message = "";
$message_type = "";

/* DATABASE CONNECTIE */

$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "crm_systeem";

$conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

if(!$conn){
    die("Database connectie mislukt");
}

/* LOGIN CHECK */

if(isset($_POST['login'])){

    $email = $_POST['email'];
    $wachtwoord = $_POST['wachtwoord'];

    $sql = "SELECT * FROM medewerkers
            WHERE email='$email'";

    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) > 0){

        $user = mysqli_fetch_assoc($result);

        if($wachtwoord == $user['wachtwoord']){

            session_start();
            $_SESSION['medewerker_id'] = $user['medewerker_id'];
            $_SESSION['voornaam'] = $user['voornaam'];
            $_SESSION['rol'] = $user['rol'];

            header("Location: CRM home.php");
            exit();

        }
        else{

            $message = "Wachtwoord incorrect";
            $message_type = "error";
        }

    }
    else{

        $message = "Gebruiker bestaat niet";
        $message_type = "error";
    }
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Inloggen</title>
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
    <li><a class="active" href="#">Inloggen</a></li>    
</ul>

<!-- POPUP MELDING -->

<?php if(!empty($message)): ?>

<div class="popup <?php echo $message_type; ?>">
    <?php echo $message; ?>
</div>

<?php endif; ?>

<!-- LOGIN FORM -->

<div class="login-container">

    <form method="POST">

        <h2>Inloggen</h2>

        <input type="email"
               name="email"
               placeholder="E-mailadres"
               required>

        <input type="password"
               name="wachtwoord"
               placeholder="Wachtwoord"
               required>

        <button type="submit" name="login">
            Inloggen
        </button>

    </form>

</div>

</body>
</html>

<?php
$conn->close();
?>