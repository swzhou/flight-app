package sample.roo.flightapp.domain;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.test.RooIntegrationTest;

@RooIntegrationTest(entity = Flight.class)
public class FlightIntegrationTest {

	@Autowired
	private MyFlightDod myDod;
	
    @Test
    public void testMarkerMethod() {
    }
    
    @Test
    public void testMyCustomDod() {
    	Flight flight = myDod.getRandomFlight();
    	System.out.println(flight.getOrigin());
    }
}
