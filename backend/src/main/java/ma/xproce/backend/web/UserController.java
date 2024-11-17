package ma.xproce.backend.web;

import ma.xproce.backend.Dao.entities.User;
import ma.xproce.backend.Dao.repositories.UserRepository;
import ma.xproce.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;

    // Créer un nouvel utilisateur
    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@RequestBody User user) {
        System.out.println("Received registration request: " + user);
        if (userRepository.existsByEmail(user.getEmail())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Cet email est déjà utilisé");
        }
        userRepository.save(user);
        return ResponseEntity.status(HttpStatus.OK).body("Inscription réussie");
    }



    // Obtenir un utilisateur par son ID
    @GetMapping("/{id}")
    public User getUserById(@PathVariable Long id) {
        return userService.getUserById(id).orElseThrow(() -> new RuntimeException("User not found"));
    }

    // Mettre à jour un utilisateur
    @PutMapping("/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) {
        user.setId(id);
        return userService.updateUser(user);
    }

    // Supprimer un utilisateur
    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
    }
}