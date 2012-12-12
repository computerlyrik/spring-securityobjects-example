package de.computerlyrik.test.scs.jsf.web.security;

import java.io.IOException;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;
import org.springframework.security.web.WebAttributes;

@ManagedBean(name = "securityBean")
@RequestScoped
public class SecurityBean {
	protected static final Logger log = Logger.getLogger(SecurityBean.class);

    
	public String doLogin() throws IOException, ServletException
    {


        ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
        RequestDispatcher dispatcher = ((ServletRequest) context.getRequest())
                 .getRequestDispatcher("/resources/j_spring_security_check");
        dispatcher.forward((ServletRequest) context.getRequest(),
                (ServletResponse) context.getResponse());
        FacesContext.getCurrentInstance().responseComplete();
        return null;
    }

	public void updateMessages(boolean update) {
	 	
			Exception ex = (Exception)FacesContext.getCurrentInstance().getExternalContext().getSessionMap()
	        .get(WebAttributes.AUTHENTICATION_EXCEPTION);
			if(ex != null){
				    FacesContext.getCurrentInstance().addMessage(null,
				            new FacesMessage(FacesMessage.SEVERITY_ERROR, "Authentication Failed!", ""));
			}
	}

    
    public String doLogout() throws IOException, ServletException
    {
        ExternalContext context = FacesContext.getCurrentInstance().getExternalContext();
         RequestDispatcher dispatcher = ((ServletRequest) context.getRequest())
                 .getRequestDispatcher("/resources/j_spring_security_logout");
 
        dispatcher.forward((ServletRequest) context.getRequest(),
                (ServletResponse) context.getResponse());
 
        FacesContext.getCurrentInstance().responseComplete();
        return null;
    }
    
}
