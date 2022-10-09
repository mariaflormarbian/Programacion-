<?php
require_once __DIR__ . '/../../bootstrap/autoload.php';
require_once __DIR__ . '/../../bibliotecas/helpers.php';
require_once __DIR__ . '/../../classes/Autenticacion.php';
require_once __DIR__ . '/../../classes/Producto.php';


$id = $_POST['id'];
$titulo = $_POST['titulo'];
$precio = $_POST['precio'];
$texto = $_POST['texto'];
$imagen_descripcion = $_POST['imagen_descripcion'];
$imagen = $_FILES['imagen'];

$productos = (new Producto())->traerPorId($id);
$autenticacion = new Autenticacion();

if (!$productos) {
    $_SESSION['mensaje_error'] = "El producto que estás tratando de editar no existe.";
    header("Location: ../index.php?v=productos");
    exit;
}

$validador = new ProductoValidar([
    'titulo' => $titulo,
    'precio' => $precio,
    'texto' => $texto,
    'imagen' => $imagen,
    'imagen_descripcion' => $imagen_descripcion,
]);

if ($validador->hayErrores()) {
    $_SESSION['errores'] = $validador->getErrores();
    $_SESSION['data_form'] = $_POST;

    header("Location: ./../index.php?v=producto-editar&id=" . $id);
    exit;
}

if (!empty($imagen['tmp_name'])) {
    $nombreImagen = date('YmdHis_') . slugify($imagen['name']);

    move_uploaded_file($imagen['tmp_name'], __DIR__ . '/../../imgs/' . $nombreImagen);
}

try {
    $productos = new Producto();
    $productos->editar($id, [
        'usuarios_fk' => $autenticacion->getId(),
        'titulo' => $titulo,
        'precio' => $precio,
        'texto' => $texto,
        'imagen' => $nombreImagen,
        'imagen_descripcion' => $imagen_descripcion,
    ]);

    if (
        isset($nombreImagen) &&
        !empty($productos->getImagen()) &&
        file_exists(__DIR__ . '/../../imgs/' . $productos->getImagen())
    ) {
        unlink(__DIR__ . '/../../imgs/' . $productos->getImagen());
    }

    $_SESSION['mensaje_exito'] = "El producto '<b>" . $titulo . "</b>' fue publicado con éxito.";

    header("Location: ./../index.php?v=productos");
    exit;
} catch (Exception $e) {
    $_SESSION['mensaje_error'] = "Ocurrió un error inesperado al tratar de grabar la información, el producto no pudo ser publicado. Por favor, probá de nuevo más tarde.";
    $_SESSION['data_form'] = $_POST;

    header("Location: ./../index.php?v=producto-editar&id=" . $id);
    exit;
}
