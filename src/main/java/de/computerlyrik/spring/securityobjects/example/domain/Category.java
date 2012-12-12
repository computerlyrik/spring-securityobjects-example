package de.computerlyrik.spring.securityobjects.example.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Category {

    private String content;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "category")
    private Set<Item> items = new HashSet<Item>();
}
