<?php
/**
 * Seeder script for Categories and Articles
 */

require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../models/Model.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

class Seeder extends Model {
    public function run(): void
    {
        echo "Seeding started...\n";

        $categories = ['Технология', 'Путешествие', 'Спорт', 'Здоровье', 'Кухня'];
        foreach ($categories as $name) {
            $stmt = $this->db->prepare("INSERT INTO categories (name, description) VALUES (?, ?)");
            $stmt->execute([$name, "подробная информация о $name"]);
        }
        $categoryIds = $this->db->query("SELECT id FROM categories")->fetchAll(PDO::FETCH_COLUMN);

        $batchSize = 2000;
        $totalArticles = 100000;

        for ($i = 0; $i < $totalArticles / $batchSize; $i++) {
            $this->db->beginTransaction();
            try {
                $values = [];
                $placeholders = [];

                for ($j = 0; $j < $batchSize; $j++) {
                    $placeholders[] = "(?, ?, ?, ?, ?, ?)";
                    $values[] = "Название статьи " . ($i * $batchSize + $j);
                    $values[] = "https://picsum.photos/400/300?random=" . random_int(1, 1000);
                    $values[] = "Краткое описание будет здесь...";
                    $values[] = "Полный текст статьи здесь выглядит слишком длинным...";
                    $values[] = random_int(0, 50000);
                    $values[] = date('Y-m-d H:i:s', strtotime('-' . random_int(0, 365) . ' days'));
                }

                $sql = "INSERT INTO articles (title, image, description, content, views, created_at) VALUES " . implode(', ', $placeholders);

                $stmt = $this->db->prepare($sql);
                $stmt->execute($values);

                $firstInsertId = $this->db->lastInsertId();

                $relValues = [];
                $relPlaceholders = [];
                for ($j = 0; $j < $batchSize; $j++) {
                    $relPlaceholders[] = "(?, ?)";
                    $relValues[] = $firstInsertId + $j;
                    $relValues[] = $categoryIds[array_rand($categoryIds)];
                }

                $relSql = "INSERT INTO article_category (article_id, category_id) VALUES " . implode(', ', $relPlaceholders);
                $this->db->prepare($relSql)->execute($relValues);

                $this->db->commit();
                echo "Inserted " . (($i + 1) * $batchSize) . " articles...\n";
            } catch (Exception $e) {
                $this->db->rollBack();
                echo "Error: " . $e->getMessage() . "\n";
                break;
            }
        }
        echo "Seeding completed!\n";
    }
}

try {
    $seeder = new Seeder();
    $seeder->run();
} catch (Exception $e) {
    echo "❌ Seeding failed: " . $e->getMessage() . "\n";
}
