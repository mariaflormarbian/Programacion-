<?php

//session_start();


spl_autoload_register(function ($class) {
    $filename = __DIR__ . '/../classes/' . $class . '.php';

    if (file_exists($filename)) {
        require_once $filename;
    }
});