// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import sample.roo.flightapp.domain.Flight;
import sample.roo.flightapp.domain.FlightKey;

privileged aspect Flight_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Flight.entityManager;
    
    public static final EntityManager Flight.entityManager() {
        EntityManager em = new Flight().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static List<Flight> Flight.findAllFlights() {
        return entityManager().createQuery("SELECT o FROM Flight o", Flight.class).getResultList();
    }
    
    public static Flight Flight.findFlight(FlightKey id) {
        if (id == null) return null;
        return entityManager().find(Flight.class, id);
    }
    
    public static List<Flight> Flight.findFlightEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Flight o", Flight.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Flight.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Flight.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Flight attached = Flight.findFlight(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Flight.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Flight.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Flight Flight.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Flight merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
