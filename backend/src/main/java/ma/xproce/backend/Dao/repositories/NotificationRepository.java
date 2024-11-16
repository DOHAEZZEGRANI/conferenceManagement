package ma.xproce.backend.Dao.repositories;

import ma.xproce.backend.Dao.entities.Notification;
import ma.xproce.backend.Dao.entities.NotificationStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findByRecipientId(Long recipientId); // Trouver toutes les notifications pour un utilisateur
    List<Notification> findByStatus(NotificationStatus status); // Trouver les notifications par statut
}