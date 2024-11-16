package ma.xproce.backend.service;

import ma.xproce.backend.Dao.entities.Notification;
import ma.xproce.backend.Dao.entities.NotificationStatus;
import ma.xproce.backend.Dao.repositories.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    public Notification createNotification(Notification notification) {
        return notificationRepository.save(notification);
    }

    public List<Notification> getNotificationsByRecipient(Long recipientId) {
        return notificationRepository.findByRecipientId(recipientId);
    }

    public List<Notification> getNotificationsByStatus(NotificationStatus status) {
        return notificationRepository.findByStatus(status);
    }

    public Notification updateNotification(Notification notification) {
        return notificationRepository.save(notification);
    }

    public void deleteNotification(Long id) {
        notificationRepository.deleteById(id);
    }
}
