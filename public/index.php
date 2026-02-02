<?php

require_once __DIR__ . '/../vendor/autoload.php';

use Symfony\Component\Routing\Matcher\UrlMatcher;
use Symfony\Component\Routing\RequestContext;
use Symfony\Component\Routing\RouteCollection;
use Symfony\Component\Routing\Route;
use Symfony\Component\Routing\Exception\ResourceNotFoundException;
use Symfony\Component\HttpFoundation\Request;

try {
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
    $dotenv->load();
} catch (Exception $e) {
    die("❌ .env file not loaded: " . $e->getMessage());
}

$smarty = require __DIR__ . '/../configs/smarty.php';

$routes = new RouteCollection();

/* Routes */

$routes->add('home', new Route('/', ['_controller' => 'HomeController@index'])->setMethods(['GET']));

$routes->add('category.show', new Route('/category/{id}', ['_controller' => 'CategoryController@show'])->setMethods(['GET']));

/* Routes end */

$request = Request::createFromGlobals();
$context = new RequestContext();
$context->fromRequest($request);

$matcher = new UrlMatcher($routes, $context);

try {
    $attributes = $matcher->match($request->getPathInfo());

    [$controllerName, $methodName] = explode('@', $attributes['_controller']);

    $controllerFile = __DIR__ . "/../controllers/$controllerName.php";
    if (!file_exists($controllerFile)) {
        throw new RuntimeException("Controller file not found: $controllerName");
    }

    require_once $controllerFile;
    $controller = new $controllerName();

    $params = array_filter($attributes, static function($key) {
        return !str_starts_with($key, '_');
    }, ARRAY_FILTER_USE_KEY);

    call_user_func_array([$controller, $methodName], [$smarty, ...array_values($params)]);

} catch (ResourceNotFoundException $e) {
    header("HTTP/1.0 404 Not Found");
    echo "<h1>404 - Страница не найдена</h1><p>Извините, страница, которую вы ищете, не существует.</p>";
} catch (Exception $e) {
    header("HTTP/1.1 500 Internal Server Error");
    echo "<h1>Произошла системная ошибка</h1><p>" . $e->getMessage() . "</p>";
}
