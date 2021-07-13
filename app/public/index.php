<?php
use Phalcon\Db\Adapter\Pdo\Mysql;
use Phalcon\Loader;
use Phalcon\Url;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Application;
use Phalcon\Di\FactoryDefault;

use Phalcon\Mvc\Router;

define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/app');

$loader = new Loader();
$loader->registerDirs([
    APP_PATH . '/controllers/',
    APP_PATH . '/models/',
]);
$loader->register();

$di = new FactoryDefault();

$di->set( 'view', function () {
    $view = new View();
    $view->setViewsDir(APP_PATH . '/views/');
    return $view;
});

$di->set( 'url', function () {
    $url = new Url();
    $url->setBaseUri('/');
    return $url;
});

$di->set( 'db', function () {
    return new Mysql([
        'host'     => 'mysql',
        'username' => 'root',
        'password' => 'root',
        'dbname'   => 'schema'
    ] );
});



$app = new Application($di);
try {
    $_ru = $_SERVER["REQUEST_URI"];
    $app->handle($_ru)->send();
} catch (\Exception $e) {
    echo 'Exception: ', $e->getMessage();
}