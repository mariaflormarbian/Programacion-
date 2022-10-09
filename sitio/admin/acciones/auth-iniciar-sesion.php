<?php

require_once __DIR__ . '/../../bootstrap/init.php';
require_once RUTA_RAIZ . '/classes/Conexion.php';
require_once RUTA_RAIZ . '/classes/Usuario.php';

require_once RUTA_RAIZ . '/classes/Autenticacion.php';


$email = $_POST['email'];
$password = $_POST['password'];


$autenticacion = new Autenticacion();

if ($autenticacion->iniciarSesion($email, $password)) {


    $_SESSION['mensaje_exito'] = "Sesión iniciada correctamente.";
    header("Location: ../index.php?v=productos");
    exit;
} else {
    $_SESSION['mensaje_error'] = "Las credenciales ingresadas no coinciden con ningún usuario registrado en el sistema.";
    $_SESSION['old_data'] = $_POST;
    header("Location: ../index.php?v=login");
    exit;
}
