<?php

class Database {
    private static ?self $instance = null;
    private PDO $pdo;

    private function __construct() {
        $dsn = "mysql:host=$_ENV[DB_HOST];dbname=$_ENV[DB_NAME];password=$_ENV[DB_PASS];port=$_ENV[DB_PORT];charset=utf8";
        try {
            $this->pdo = new PDO($dsn, $_ENV['DB_USER'], $_ENV['DB_PASS'], [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
            ]);
        } catch (PDOException $e) {
            die("DB Connection Error: " . $e->getMessage());
        }
    }

    public static function getInstance(): PDO
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance->pdo;
    }
}
