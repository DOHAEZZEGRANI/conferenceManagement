package ma.xproce.backend.Dao.repositories;

import ma.xproce.backend.Dao.entities.Evaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface EvaluationRepository extends JpaRepository<Evaluation, Long> {
    List<Evaluation> findByArticleId(Long articleId); // Trouver toutes les évaluations pour un article donné
    List<Evaluation> findByReviewerId(Long reviewerId); // Trouver toutes les évaluations faites par un reviewer
}