<?php

class Usuario
{
    /**
     * @var int
     */
    protected $usuarios_id;
    /**
     * @var int
     */
    protected $roles_fk;
    /**
     * @var string
     */
    protected $email;
    /**
     * @var string
     */
    protected $password;

    /**
     * @return int
     */
    public function getUsuariosId(): int
    {
        return $this->usuarios_id;
    }

    /**
     * @param int $usuarios_id
     */
    public function setUsuariosId(int $usuarios_id): void
    {
        $this->usuarios_id = $usuarios_id;
    }

    /**
     * @return int
     */
    public function getRolesFk(): int
    {
        return $this->roles_fk;
    }

    /**
     * @param int $roles_fk
     */
    public function setRolFk(int $roles_fk): void
    {
        $this->rol_fk = $roles_fk;
    }

    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    /**
     * @param string $password
     */
    public function setPassword(string $password): void
    {
        $this->password = $password;
    }


    /**
     *
     * @param string $email
     * @return Usuario|null
     */
    public function traerPorEmail(string $email): ?Usuario
    {
        $db = (new Conexion())->getConexion();
        $query = "SELECT * FROM usuarios
                WHERE email = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$email]);

        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        $usuario = $stmt->fetch();


        if (!$usuario) {
            return null;
        }
        return $usuario;
    }
}