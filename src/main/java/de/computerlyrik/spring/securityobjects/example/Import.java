package de.computerlyrik.spring.securityobjects.example;

import org.springframework.beans.factory.InitializingBean;

import de.computerlyrik.spring.securityobjects.example.domain.user.Admin;
import de.computerlyrik.spring.securityobjects.example.domain.user.DefaultUser;

public class Import implements InitializingBean  {
	
	  public void afterPropertiesSet() {
		  
		  Admin a = new Admin();
		  a.setUsername("admin");
		  a.setPassword("admin");
		  a.setEnabled(true);
		  a.persist();
		  
		  DefaultUser u = new DefaultUser();
		  u.setUsername("user");
		  u.setPassword("user");
		  u.setEnabled(true);
		  u.persist();
		  
		  System.out.println("Createt User user and Admin admin");
	  }
}
