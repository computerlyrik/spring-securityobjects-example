package de.computerlyrik.spring.securityobjects.example.domain.user;

import javax.persistence.Entity;
import org.springframework.beans.factory.annotation.Configurable;
import de.computerlyrik.spring.securityobjects.UserDetailsSO;



@Entity
@Configurable
public class Admin extends UserDetailsSO {
}
