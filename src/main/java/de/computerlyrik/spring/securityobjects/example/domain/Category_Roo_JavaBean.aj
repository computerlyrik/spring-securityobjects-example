// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.computerlyrik.spring.securityobjects.example.domain;

import de.computerlyrik.spring.securityobjects.example.domain.Category;
import de.computerlyrik.spring.securityobjects.example.domain.Item;
import java.util.Set;

privileged aspect Category_Roo_JavaBean {
    
    public String Category.getContent() {
        return this.content;
    }
    
    public void Category.setContent(String content) {
        this.content = content;
    }
    
    public Set<Item> Category.getItems() {
        return this.items;
    }
    
    public void Category.setItems(Set<Item> items) {
        this.items = items;
    }
    
}