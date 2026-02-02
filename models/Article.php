<?php
require_once __DIR__ . '/Model.php';

class Article extends Model
{

    /**
     * Get articles by category ID
     */
    public function getArticleById(int $id)
    {
        $stmt = $this->db->prepare("
            SELECT a.*, c.name as category_name, c.id as category_id
            FROM articles a
            LEFT JOIN article_category ac ON a.id = ac.article_id
            LEFT JOIN categories c ON ac.category_id = c.id
            WHERE a.id = ?
        ");
        $stmt->execute([$id]);
        return $stmt->fetch();
    }

    /**
     * Increasing the number of views
     */
    public function incrementViews(int $id): void
    {
        $stmt = $this->db->prepare("UPDATE articles SET views = views + 1 WHERE id = ?");
        $stmt->execute([$id]);
    }

    /**
     * Get related Articles
     */
    public function getRelatedArticles(int $categoryId, int $currentArticleId, int $limit = 4): array
    {
        $stmt = $this->db->prepare("
            SELECT a.id, a.title, a.image, a.created_at, a.views
            FROM articles a
            JOIN article_category ac ON a.id = ac.article_id
            WHERE ac.category_id = ? AND a.id != ?
            ORDER BY a.created_at DESC
            LIMIT ?
        ");
        $stmt->bindValue(1, $categoryId, PDO::PARAM_INT);
        $stmt->bindValue(2, $currentArticleId, PDO::PARAM_INT);
        $stmt->bindValue(3, $limit, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
