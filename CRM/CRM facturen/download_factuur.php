<?php
session_start();

if(!isset($_SESSION['voornaam'])){
    die("Je moet eerst inloggen");
}

require('fpdf/fpdf.php');

$conn = mysqli_connect("localhost", "root", "", "crm_systeem");

$id = $_GET['id'];

$sql = "SELECT * FROM facturen
        WHERE factuur_id = $id";

$result = mysqli_query($conn, $sql);

$factuur = mysqli_fetch_assoc($result);

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

/* PDF OPSLAAN */
$pdf->Output('F', 'pdf/factuur.pdf');

/* PDF TONEN */
$pdf->Output();
?>