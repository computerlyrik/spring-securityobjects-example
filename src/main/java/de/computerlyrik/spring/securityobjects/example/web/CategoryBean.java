package de.computerlyrik.spring.securityobjects.example.web;

import de.computerlyrik.spring.securityobjects.example.domain.Category;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Category.class, beanName = "categoryBean")
public class CategoryBean {
}
