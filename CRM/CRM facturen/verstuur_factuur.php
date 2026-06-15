<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

require 'PHPMailer-master/src/Exception.php';
require 'PHPMailer-master/src/PHPMailer.php';
require 'PHPMailer-master/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "SELECT facturen.*, klanten.email
        FROM facturen
        INNER JOIN klanten
        ON facturen.klant_id = klanten.klanten_ID
        WHERE factuur_id = $id";

$result = mysqli_query($conn, $sql);

$factuur = mysqli_fetch_assoc($result);

$email = $factuur['email'];

if(isset($_POST['versturen'])){

    $email = $_POST['email'];

    require('fpdf/fpdf.php');

    $pdf = new FPDF();
    $pdf->AddPage();
    $pdf->SetFont('Arial', 'B', 20);

    $pdf->Cell(190, 20, 'FACTUUR', 0, 1, 'C');

    $pdf->SetFont('Arial', '', 12);

    $pdf->Cell(50, 10, 'Factuur ID:');
    $pdf->Cell(100, 10, $factuur['factuur_id'], 0, 1);

    $pdf->Cell(50, 10, 'Klant ID:');
    $pdf->Cell(100, 10, $factuur['klant_id'], 0, 1);

    $pdf->Cell(50, 10, 'Opdracht ID:');
    $pdf->Cell(100, 10, $factuur['opdracht_id'], 0, 1);

    $pdf->Cell(50, 10, 'Factuurdatum:');
    $pdf->Cell(100, 10, $factuur['factuurdatum'], 0, 1);

    $pdf->Cell(50, 10, 'Totaalbedrag:');
    $pdf->Cell(100, 10, chr(128) . ' ' . $factuur['totaalbedrag'], 0, 1);

    $pdf->Cell(50, 10, 'Status:');
    $pdf->Cell(100, 10, $factuur['status'], 0, 1);

    $mail = new PHPMailer(true);

    try {

        $mail->isSMTP();

        $mail->Host = 'smtp-relay.brevo.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'aec6c7001@smtp-brevo.com';
        $mail->Password = 'xsmtpsib-78c4d7692b8ed987ad9c4657544008023d47f5f8a553486ba240eb89544fe771-MNpbFwfP4ESgxcyl';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom(
            'crmteam2@outlook.com',
            'CRM Systeem'
        );

        $mail->addAddress($email);

        $mail->Subject = 'Uw factuur';

        $mail->Body = 'Beste klant, in de bijlage vindt u uw factuur.';

        // ✅ BELANGRIJKE FIX: PDF in memory i.p.v. bestand opslaan
        $pdfContent = $pdf->Output('S'); // S = string

        $mail->addStringAttachment(
            $pdfContent,
            'factuur_' . $factuur['factuur_id'] . '.pdf',
            'base64',
            'application/pdf'
        );

        $mail->send();

        echo "Factuur succesvol verzonden!";

    } catch (Exception $e) {

        echo "Email verzenden mislukt.<br>";
        echo $mail->ErrorInfo;
    }
}
?>

<h2>Factuur versturen</h2>

<link rel="stylesheet" href="../toevoegen en wijzigen.css">

<form method="POST">

Email klant:<br>

<input type="email"
       name="email"
       value="<?php echo $email; ?>">

<br><br>

<input type="submit"
       name="versturen"
       value="Verstuur factuur">

</form>