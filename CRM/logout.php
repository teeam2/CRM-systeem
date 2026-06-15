<?php
session_start();

// alles wissen
session_unset();
session_destroy();

// terug naar login
header("Location: CRM inlog pagina.php");
exit;
?>