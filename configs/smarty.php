<?php
require_once __DIR__ . '/../vendor/autoload.php';

use Smarty\Smarty;
$smarty = new Smarty();

$smarty->setTemplateDir(__DIR__ . '/../templates');
$smarty->setCompileDir(__DIR__ . '/../templates_c');
$smarty->setCacheDir(__DIR__ . '/../cache');

return $smarty;
