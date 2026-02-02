<?php
require_once __DIR__ . '/../models/Category.php';
require_once __DIR__ . '/../models/Article.php';

class HomeController {
    public function index($smarty): void
    {
        $categoryModel = new Category();

        $categories = $categoryModel->getCategoriesWithTopArticles();

        $smarty->assign('categories', $categories);
        $smarty->display('index.tpl');
    }
}
