package ma.xproce.backend.Dao.repositories;

import ma.xproce.backend.Dao.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name); // Recherche un rôle par son nom
}

