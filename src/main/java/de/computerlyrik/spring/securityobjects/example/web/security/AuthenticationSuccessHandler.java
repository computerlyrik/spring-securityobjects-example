package de.computerlyrik.spring.securityobjects.example.web.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;

/**
 * 
 * This success-handler will be executed after successful login. 
 * Configuration for landing pages will be handled by configuration in applicationContext-security.xml
 * 
 */
@RooJavaBean
public class AuthenticationSuccessHandler implements org.springframework.security.web.authentication.AuthenticationSuccessHandler {
	
	protected static final Logger log = Logger.getLogger(AuthenticationSuccessHandler.class);


	private Map<String,String> landingPages = new HashMap<String,String>();

    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
    	log.info("auth succeeded");
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        if (roles != null && !roles.isEmpty()) {
			for (String role : roles)	 {
				String page = getLandingPages().get(role);
				log.info("Redirecting to "+page);
				if (page != null) response.sendRedirect(request.getContextPath()+page);
			}
		}
        response.sendRedirect(request.getContextPath());
    }
}
