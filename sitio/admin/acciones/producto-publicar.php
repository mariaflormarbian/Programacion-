<?php

require_once __DIR__ . '/../../bootstrap/autoload.php';
require_once __DIR__ . '/../../bootstrap/init.php';
require_once RUTA_RAIZ . '/bibliotecas/helpers.php';
require_once RUTA_RAIZ . '/classes/ProductoValidar.php';

// Capturamos los datos.
$titulo = $_POST['titulo'];
$precio = $_POST['precio'];
$texto = $_POST['texto'];
$imagen_descripcion = $_POST['imagen_descripcion'];
$video = $_POST['video'];
$imagen = $_FILES['imagen'];


$validador = new ProductoValidar([
    'titulo' => $titulo,
    'precio' => $precio,
    'texto' => $texto,
    'imagen' => $imagen,
    'video' => $video,
    'audio' => $audio,
    'imagen_descripcion' => $imagen_descripcion,
]);

if ($validador->hayErrores()) {

    $_SESSION['errores'] = $validador->getErrores();

    $_SESSION['data_form'] = $_POST;


    header("Location: ./../index.php?v=producto-nuevo");

    exit;
}

if (!empty($imagen['tmp_name'])) {
    $nombreImagen = date('YmdHis_') . slugify($imagen['name']);

    move_uploaded_file($imagen['tmp_name'], __DIR__ . '/../../imgs/' . $nombreImagen);
}


try {
    (new Producto())->crear([
        'usuarios_fk' => 1,
        'titulo' => $titulo,
        'precio' => $precio,
        'texto' => $texto,
        'video' => $video,
        'audio' => $audio,
        'imagen' => $nombreImagen,
        'imagen_descripcion' => $imagen_descripcion
    ]);


    $_SESSION['mensaje_exito'] = "El producto '<b>" . $titulo . "</b>' fue o con éxito.";

    header("Location: ./../index.php?v=productos");
    exit;

    echo "<pre>";
    var_dump($producto);
    echo "</pre>";
} catch (\Exception $e) {
    $_SESSION['mensaje_error'] = "Ocurrió un error inesperado al tratar de grabar la información, el producto no pudo ser publicada. Por favor, probá de nuevo más tarde.";
    $_SESSION['data_form'] = $_POST;

    header("Location: ./../index.php?v=producto-nuevo");
    exit;
}
