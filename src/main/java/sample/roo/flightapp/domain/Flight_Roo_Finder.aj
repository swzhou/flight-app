// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import sample.roo.flightapp.domain.Flight;

privileged aspect Flight_Roo_Finder {
    
    public static TypedQuery<Flight> Flight.findFlightsByDestinationLikeAndOriginLike(String destination, String origin) {
        if (destination == null || destination.length() == 0) throw new IllegalArgumentException("The destination argument is required");
        destination = destination.replace('*', '%');
        if (destination.charAt(0) != '%') {
            destination = "%" + destination;
        }
        if (destination.charAt(destination.length() - 1) != '%') {
            destination = destination + "%";
        }
        if (origin == null || origin.length() == 0) throw new IllegalArgumentException("The origin argument is required");
        origin = origin.replace('*', '%');
        if (origin.charAt(0) != '%') {
            origin = "%" + origin;
        }
        if (origin.charAt(origin.length() - 1) != '%') {
            origin = origin + "%";
        }
        EntityManager em = Flight.entityManager();
        TypedQuery<Flight> q = em.createQuery("SELECT o FROM Flight AS o WHERE LOWER(o.destination) LIKE LOWER(:destination)  AND LOWER(o.origin) LIKE LOWER(:origin)", Flight.class);
        q.setParameter("destination", destination);
        q.setParameter("origin", origin);
        return q;
    }
    
}
