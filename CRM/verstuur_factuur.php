<?php

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "SELECT facturen.*, klanten.email
        FROM facturen
        INNER JOIN klanten
        ON facturen.klant_id = klanten.klanten_ID
        WHERE factuur_id = $id";

$result = mysqli_query($conn, $sql);

$data = mysqli_fetch_assoc($result);

?>

<h2>Factuur versturen</h2>

<p>Email klant:</p>

<input type="text"
value="<?php echo $data['email']; ?>">

<br><br>

<a href="download_factuur.php?id=<?php echo $id; ?>">
Bekijk PDF
</a>

<br><br>

<button>
Verstuur Email
</button>
