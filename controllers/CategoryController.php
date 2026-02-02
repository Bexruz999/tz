<?php

require_once __DIR__ . '/../models/Category.php';

class CategoryController {
    public function show($smarty, $id): void
    {
        $categoryModel = new Category();

        $sort = $_GET['sort'] ?? 'date';
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perPage = 12;

        $data = $categoryModel->getCategoryData($id, $sort, $page, $perPage);

        if (empty($data)) {
            header("HTTP/1.0 404 Not Found");
            die("Категория не найдена");
        }

        $smarty->assign('category', $data);
        $smarty->assign('current_sort', $sort);
        $smarty->assign('current_page', $page);

        $smarty->display('category.tpl');
    }
}
