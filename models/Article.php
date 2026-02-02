<?php
require_once __DIR__ . '/Model.php';

class Article extends Model {

    /**
     * Get articles by category ID
     */
    public function getByCategoryId($categoryId, $limit = 3) {
        $stmt = $this->db->prepare("
            SELECT a.* FROM articles a
            JOIN article_category ac ON a.id = ac.article_id
            WHERE ac.category_id = ?
            ORDER BY a.created_at DESC
            LIMIT ?
        ");

        $stmt->bindValue(1, $categoryId, PDO::PARAM_INT);
        $stmt->bindValue(2, $limit, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAllByCategories(array $categoryIds, $int)
    {

    }
}
