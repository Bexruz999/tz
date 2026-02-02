<?php

require_once __DIR__ . '/../models/Article.php';

class ArticleController {

    public function show($smarty, $id) :void {
        $articleModel = new Article();

        $article = $articleModel->getArticleById((int)$id);

        if (!$article) {
            header("HTTP/1.0 404 Not Found");
            echo "<h1>404 - Статья не найдена</h1>";
            return;
        }

        $articleModel->incrementViews((int)$id);

        $relatedArticles = $articleModel->getRelatedArticles((int)$article['category_id'], (int)$id, 3);

        $smarty->assign('article', $article);
        $smarty->assign('related_articles', $relatedArticles);
        $smarty->display('article.tpl');
    }
}
