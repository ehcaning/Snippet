<?php
session_start();
# v2.3
class db {
    private static $pdo;
    private static $instance;

    private function __construct() {
    }

    public static function init() {
        if (!isset(self::$instance)) {
            $c = __CLASS__;
            self::$instance = new $c;

            try {
                self::$pdo = new PDO(
                    "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=UTF8",
                    DB_USER,
                    DB_PASS,
                    [
                        PDO::ATTR_EMULATE_PREPARES => false,
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    ]
                );
            } catch (\Throwable $th) {
                //throw $th;
            }
        }

        return self::$instance;
    }

    public static function fetch($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetch();
    }

    public static function fetchColumn($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchColumn();
    }

    public static function fetchAll($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll();
    }

    public static function fetchAllColumn($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    }

    public static function fetchKeyPair($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_KEY_PAIR);
    }
    public static function fetchGroup($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_GROUP);
    }
    public static function fetchOneGroup($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_GROUP | PDO::FETCH_COLUMN);
    }
    public static function fetchUnique($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->fetchAll(PDO::FETCH_UNIQUE);
    }

    public static function exist($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->rowCount() ? true:false;
    }

    public static function rowCount($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->rowCount();
    }

    public static function query($sql, $params = null) {
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($params);

        return $stmt->rowCount();
    }

    private static function queryBuilder($tblName, $insertItems, $ignore) {
        $ignore = $ignore? 'IGNORE':'';
        $c = '';
        $v = '';
        foreach ($insertItems as $key => $value) {
            $c .= '`' . $key . '`,';
            $v .= ':' . $key . ',';
        }
        $c = rtrim($c, ',');
        $v = rtrim($v, ',');
        $finalQuery = "INSERT {$ignore} INTO `{$tblName}` ({$c}) VALUES ({$v})";

        return $finalQuery;
    }

    public static function insert($tblName, $insertItems, $ignore = false) {
        $sql = self::queryBuilder($tblName, $insertItems, $ignore);
        $stmt = self::$pdo->prepare($sql);
        $stmt->execute($insertItems);

        return self::$pdo->lastInsertId();
    }
}
