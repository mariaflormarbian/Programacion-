<?php

require_once __DIR__ . '/../../bootstrap/init.php';
require_once RUTA_RAIZ . '/classes/Conexion.php';
require_once RUTA_RAIZ . '/classes/Usuario.php';

require_once RUTA_RAIZ . '/classes/Autenticacion.php';

$autenticacion = new Autenticacion();
$autenticacion->cerrarSesion();

$_SESSION['mensaje_exito'] = "Sesión cerrada correctamente.";
header("Location: ../index.php?v=login");
exit;