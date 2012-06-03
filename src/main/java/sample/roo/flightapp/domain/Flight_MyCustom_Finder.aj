package sample.roo.flightapp.domain;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public privileged aspect Flight_MyCustom_Finder {

	public static TypedQuery<Flight> Flight.searchFlight(SearchCriteria criteria) {
		EntityManager em = Flight.entityManager();
		TypedQuery<Flight> q = em.createQuery("SELECT o FROM Flight AS o WHERE LOWER(o.destination) LIKE LOWER(:destination)  AND LOWER(o.origin) LIKE LOWER(:origin)", Flight.class);
		q.setParameter("destination", criteria.getDestination());
		q.setParameter("origin", criteria.getOrigin());
		return q;		
	}
}
