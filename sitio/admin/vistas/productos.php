<?php
$productos = (new Producto())->todo();
?>
<section class="container container-product">
    <h2 class="mb-1">Administración de Productos</h2>

    <p class="mb-1">
        <a href="index.php?v=producto-nuevo" class="btn btn-primary">Publicar un nuevo producto</a>
    </p>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Texto</th>
            <th>Imagen</th>
            <th>Video</th>
            <th>Audio</th>
            <th>Edición</th>

        </tr>
        </thead>
        <tbody>

        <?php
        foreach ($productos as $producto):
            ?>
            <tr>
                <td><?= $producto->getListadoId(); ?></td>
                <td><?= e($producto->getTitulo()); ?></td>
                <td><?= e($producto->getTexto()); ?></td>
                <td><img src="<?= "../imgs/" . e($producto->getImagen()); ?>" width="50"
                         alt="<?= e($producto->getImagenDescripcion()); ?>"></td>
                <td><?= $producto->getVideo(); ?></td>
                <td><?= $producto->getAudio(); ?></td>


                <td>
                    <a href="index.php?v=producto-editar&id=<?= $producto->getListadoId(); ?>"
                       class="button button-small">Editar</a>

                    <!--<form action="acciones/noticia-eliminar.php" method="post">
                    <input type="hidden" name="id" value="<?= $producto->getListadoId(); ?>">
                    <button type="submit" class="button button-small button-danger">Eliminar</button>
                </form>-->
                    <a href="index.php?v=producto-eliminar&id=<?= $producto->getListadoId(); ?>"
                       class="button button-small button-danger">Eliminar</a>
                </td>
            </tr>
        <?php
        endforeach;
        ?>

        </tbody>
    </table>
</section>
