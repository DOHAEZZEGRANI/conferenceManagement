package ma.xproce.backend.service;

import ma.xproce.backend.Dao.entities.Evaluation;
import ma.xproce.backend.Dao.repositories.EvaluationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EvaluationService {

    @Autowired
    private EvaluationRepository evaluationRepository;

    public Evaluation createEvaluation(Evaluation evaluation) {
        return evaluationRepository.save(evaluation);
    }

    public List<Evaluation> getEvaluationsByArticle(Long articleId) {
        return evaluationRepository.findByArticleId(articleId);
    }

    public List<Evaluation> getEvaluationsByReviewer(Long reviewerId) {
        return evaluationRepository.findByReviewerId(reviewerId);
    }

    public Evaluation updateEvaluation(Evaluation evaluation) {
        return evaluationRepository.save(evaluation);
    }

    public void deleteEvaluation(Long id) {
        evaluationRepository.deleteById(id);
    }
}