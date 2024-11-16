package ma.xproce.backend.service;

import ma.xproce.backend.Dao.entities.Role;
import ma.xproce.backend.Dao.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service
public class RoleService {

    @Autowired
    private RoleRepository roleRepository;

    public Role getRoleByName(String name) {
        return roleRepository.findByName(name);
    }

    public Role createRole(Role role) {
        return roleRepository.save(role);
    }
}
