package de.computerlyrik.spring.securityobjects.example.web;

import de.computerlyrik.spring.securityobjects.example.domain.Item;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Item.class, beanName = "itemBean")
public class ItemBean {
}
