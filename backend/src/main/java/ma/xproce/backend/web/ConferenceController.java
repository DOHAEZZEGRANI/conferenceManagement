package ma.xproce.backend.web;

import ma.xproce.backend.Dao.entities.Conference;
import ma.xproce.backend.Dao.entities.ConferenceStatus;
import ma.xproce.backend.service.ConferenceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/conferences")
public class ConferenceController {

    @Autowired
    private ConferenceService conferenceService;

    // Créer une nouvelle conférence
    @PostMapping
    public Conference createConference(@RequestBody Conference conference) {
        return conferenceService.createConference(conference);
    }

    // Obtenir une conférence par son ID
    @GetMapping("/{id}")
    public Conference getConferenceById(@PathVariable Long id) {
        return conferenceService.getConferenceById(id).orElseThrow(() -> new RuntimeException("Conference not found"));
    }

    // Obtenir toutes les conférences par statut
    @GetMapping("/status/{status}")
    public List<Conference> getConferencesByStatus(@PathVariable ConferenceStatus status) {
        return conferenceService.getConferencesByStatus(status);
    }

    // Obtenir toutes les conférences après une certaine date
    @GetMapping("/after/{date}")
    public List<Conference> getConferencesAfterDate(@PathVariable String date) {
        // Convertir la date en LocalDateTime et appeler le service
        return conferenceService.getConferencesAfterDate(LocalDateTime.parse(date));
    }
}
