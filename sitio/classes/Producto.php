<?php


class Producto
{
    protected int $productos_id;
    protected int $usuarios_fk;
    protected string $titulo;
    protected int $precio;
    protected ?string $imagen;
    protected ?string $imagen_descripcion;
    protected ?string $video;
    protected ?string $audio;
    protected string $texto;


    /**
     * Obtiene todos los productos disponibles.
     * @return Producto[]  La lista de productos.
     */
    public function todo(): array
    {
        $db = (new Conexion())->getConexion();
        $query = "SELECT * FROM productos";

        $stmt = $db->prepare($query);
        $stmt->execute();

        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);

        return $stmt->fetchAll();
    }

    /**
     * Obtiene todos los productos correspondiente al $id.
     * @param int $id
     * @return  Self\null.
     */
    public function traerPorId(int $id): ?self
    {
        $db = (new Conexion())->getConexion();
        $query = "SELECT * FROM productos
                WHERE productos_id = ?";

        $stmt = $db->prepare($query);

        $stmt->execute([$id]);

        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);

        $productos = $stmt->fetch();

        if (!$productos) {
            return null;
        }

        return $productos;
    }

    public function crear(array $data)
    {
        $db = (new Conexion())->getConexion();
        $query = "INSERT INTO productos (usuarios_fk, precio, titulo, texto, imagen, imagen_descripcion, video) 
                VALUES (:usuarios_fk, :precio,  :titulo,  :texto, :imagen, :imagen_descripcion, :video)";

        $stmt = $db->prepare($query);

        $stmt->execute([
            'usuarios_fk' => $data['usuarios_fk'],
            'titulo' => $data['titulo'],
            'precio' => $data['precio'],
            'texto' => $data['texto'],
            'imagen' => $data['imagen'],
            'imagen_descripcion' => $data['imagen_descripcion'],
            'video' => $data['video'],


        ]);

    }

    /**
     * Elimina el producto.
     *
     * @return void
     * @throws PDOException
     */
    public function eliminar(): void
    {
        $db = (new Conexion())->getConexion();
        $query = "DELETE FROM productos
                WHERE productos_id = ?";
        $db->prepare($query)->execute([$this->getListadoId()]);

    }

    /**
     * Editar el producto.
     *
     * @return void
     * @throws PDOException
     */


    public function editar(int $pk, array $data): void
    {
        $db = (new Conexion())->getConexion();
        $query = "UPDATE productos
                SET usuario_fk          = :usuario_fk,
                    titulo              = :titulo,
                    precio            = :precio,
                    texto               = :texto,
                    imagen              = :imagen,
                    video              = :video,
                    audio              = :audio,
                    imagen_descripcion  = :imagen_descripcion
                WHERE productos_id = :productos_id";

        $db->prepare($query)->execute([
            'productos_id' => 14,
            'usuario_fk' => $data['usuario_fk'],
            'titulo' => $data['titulo'],
            'precio' => $data['precio'],
            'texto' => $data['texto'],
            'imagen' => $data['imagen'],
            'video' => $data['video'],
            'audio' => $data['audio'],
            'imagen_descripcion' => $data['imagen_descripcion'],
        ]);
    }


    /**
     * Setters y Getters.
     * @return  self.
     */


    public function setListadoId(int $productos_id): void
    {
        $this->id = $productos_id;

    }

    public function getListadoId(): int
    {
        return $this->productos_id;


    }

    /**
     * @param self $id .
     */


    public function setTitulo($titulo): void
    {
        $this->titulo = $titulo;
    }

    public function getTitulo()
    {
        return $this->titulo;
    }

    /**
     * @param self $titulo .
     */
    public function setPrecio($precio): void
    {
        $this->precio = $precio;
    }

    public function getPrecio()
    {
        return $this->precio;
    }

    /**
     * @param self $precio .
     */


    public function setImagen($imagen): void
    {
        $this->imagen = $imagen;
    }

    public function getImagen()
    {
        return $this->imagen;
    }

    /**
     * @param self $imagen .
     */

    public function setImagenDescripcion($imagen_descipcion): void
    {
        $this->imagen_descripcion = $imagen_descipcion;
    }

    public function getImagenDescripcion()
    {
        return $this->imagen_descripcion;
    }

    /**
     * @param self $imagen_descripcion .
     */
    public function setAudio($audio): void
    {
        $this->audio = $audio;
    }

    public function getAudio()
    {
        return $this->audio;
    }

    /**
     * @param self $audio .
     */
    public function setVideo($video): void
    {
        $this->video = $video;
    }

    public function getVideo()
    {
        return $this->video;
    }

    /**
     * @param self $video .
     */
    public function setTexto($texto): void
    {
        $this->texto = $texto;
    }

    public function getTexto()
    {
        return $this->texto;
    }

    /**
     * @param self $texto .
     */


    public function getUsuarioFk(): int
    {
        return $this->usuarios_fk;
    }

    /**
     * @param int $usuarios_fk
     */
    public function setUsuarioFk(int $usuarios_fk): void
    {
        $this->usuario_fk = $usuarios_fk;
    }
    /**
     * @param self $texto .
     */

}