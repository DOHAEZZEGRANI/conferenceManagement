package ma.xproce.backend.web;

import ma.xproce.backend.Dao.entities.Article;
import ma.xproce.backend.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/articles")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    // Soumettre un nouvel article
    @PostMapping
    public Article createArticle(@RequestBody Article article) {
        return articleService.createArticle(article);
    }

    // Obtenir les articles d'une conférence donnée
    @GetMapping("/conference/{conferenceId}")
    public List<Article> getArticlesByConference(@PathVariable Long conferenceId) {
        return articleService.getArticlesByConference(conferenceId);
    }

    // Obtenir les articles d'un chercheur donné
    @GetMapping("/researcher/{researcherId}")
    public List<Article> getArticlesByResearcher(@PathVariable Long researcherId) {
        return articleService.getArticlesByResearcher(researcherId);
    }

    // Obtenir un article par son ID
    @GetMapping("/{id}")
    public Article getArticleById(@PathVariable Long id) {
        return articleService.getArticleById(id).orElseThrow(() -> new RuntimeException("Article not found"));
    }

    // Mettre à jour un article
    @PutMapping("/{id}")
    public Article updateArticle(@PathVariable Long id, @RequestBody Article article) {
        article.setId(id);
        return articleService.updateArticle(article);
    }

    // Supprimer un article
    @DeleteMapping("/{id}")
    public void deleteArticle(@PathVariable Long id) {
        articleService.deleteArticle(id);
    }
}