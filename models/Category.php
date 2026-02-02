<?php
require_once __DIR__ . '/Model.php';

class Category extends Model {
    public function getCategoriesWithTopArticles(int $limit = 3): array {
        $sql = "
            SELECT
                c.id as cat_id, c.name as cat_name, c.description as cat_desc,
                latest_articles.*
            FROM categories c
            INNER JOIN LATERAL (
                SELECT a.id, a.title, a.image, a.description, a.views, a.created_at
                FROM articles a
                JOIN article_category ac ON a.id = ac.article_id
                WHERE ac.category_id = c.id
                ORDER BY a.created_at DESC
                LIMIT :limit
            ) AS latest_articles ON TRUE
            ORDER BY c.name";

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->execute();

        $rawRows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $result = [];
        foreach ($rawRows as $r) {
            $catId = $r['cat_id'];
            if (!isset($result[$catId])) {
                $result[$catId] = [
                    'id' => $catId,
                    'name' => $r['cat_name'],
                    'description' => $r['cat_desc'],
                    'articles' => []
                ];
            }

            $result[$catId]['articles'][] = [
                'id' => $r['id'],
                'title' => $r['title'],
                'image' => $r['image'],
                'description' => $r['description'],
                'views' => $r['views'],
                'created_at' => $r['created_at']
            ];
        }

        return array_values($result);
    }

    public function getCategoryData(int $id, string $sort = 'date', int $page = 1, int $perPage = 10): array {

        $stmt = $this->db->prepare("SELECT * FROM categories WHERE id = ?");
        $stmt->execute([$id]);
        $category = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$category) {
            return [];
        }

        $orderBy = ($sort === 'views') ? 'a.views DESC' : 'a.created_at DESC';
        $offset = ($page - 1) * $perPage;

        $sql = "
            SELECT a.* FROM articles a
            JOIN article_category ac ON a.id = ac.article_id
            WHERE ac.category_id = :id
            ORDER BY $orderBy
            LIMIT :limit OFFSET :offset
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':id', $id, PDO::PARAM_INT);
        $stmt->bindValue(':limit', $perPage, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        $category['articles'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $countStmt = $this->db->prepare("SELECT COUNT(*) FROM article_category WHERE category_id = ?");
        $countStmt->execute([$id]);
        $category['total_articles'] = $countStmt->fetchColumn();
        $category['total_pages'] = ceil($category['total_articles'] / $perPage);

        return $category;
    }
}
