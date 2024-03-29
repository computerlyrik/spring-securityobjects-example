// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.computerlyrik.spring.securityobjects.example.domain;

import de.computerlyrik.spring.securityobjects.example.domain.Item;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Item_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Item.entityManager;
    
    public static final EntityManager Item.entityManager() {
        EntityManager em = new Item().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Item.countItems() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Item o", Long.class).getSingleResult();
    }
    
    public static List<Item> Item.findAllItems() {
        return entityManager().createQuery("SELECT o FROM Item o", Item.class).getResultList();
    }
    
    public static Item Item.findItem(Long id) {
        if (id == null) return null;
        return entityManager().find(Item.class, id);
    }
    
    public static List<Item> Item.findItemEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Item o", Item.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Item.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Item.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Item attached = Item.findItem(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Item.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Item.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Item Item.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Item merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
