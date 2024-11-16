package ma.xproce.backend.service;

import ma.xproce.backend.Dao.entities.Conference;
import ma.xproce.backend.Dao.entities.ConferenceStatus;
import ma.xproce.backend.Dao.repositories.ConferenceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class ConferenceService {

    @Autowired
    private ConferenceRepository conferenceRepository;

    public Conference createConference(Conference conference) {
        return conferenceRepository.save(conference);
    }

    public List<Conference> getConferencesByStatus(ConferenceStatus status) {
        return conferenceRepository.findByStatus(status);
    }

    public List<Conference> getConferencesAfterDate(LocalDateTime date) {
        return conferenceRepository.findByConferenceDateAfter(date);
    }

    public Optional<Conference> getConferenceById(Long id) {
        return conferenceRepository.findById(id);
    }

    public Conference updateConference(Conference conference) {
        return conferenceRepository.save(conference);
    }

    public void deleteConference(Long id) {
        conferenceRepository.deleteById(id);
    }
}
