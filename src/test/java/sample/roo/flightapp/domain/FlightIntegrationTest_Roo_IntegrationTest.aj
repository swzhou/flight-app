// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import sample.roo.flightapp.domain.Flight;
import sample.roo.flightapp.domain.FlightDataOnDemand;
import sample.roo.flightapp.domain.FlightIntegrationTest;
import sample.roo.flightapp.domain.FlightKey;

privileged aspect FlightIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FlightIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FlightIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FlightIntegrationTest: @Transactional;
    
    @Autowired
    private FlightDataOnDemand FlightIntegrationTest.dod;
    
    @Test
    public void FlightIntegrationTest.testCountFlights() {
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", dod.getRandomFlight());
        long count = Flight.countFlights();
        Assert.assertTrue("Counter for 'Flight' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FlightIntegrationTest.testFindFlight() {
        Flight obj = dod.getRandomFlight();
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", obj);
        FlightKey id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Flight' failed to provide an identifier", id);
        obj = Flight.findFlight(id);
        Assert.assertNotNull("Find method for 'Flight' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Flight' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void FlightIntegrationTest.testFindAllFlights() {
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", dod.getRandomFlight());
        long count = Flight.countFlights();
        Assert.assertTrue("Too expensive to perform a find all test for 'Flight', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Flight> result = Flight.findAllFlights();
        Assert.assertNotNull("Find all method for 'Flight' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Flight' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FlightIntegrationTest.testFindFlightEntries() {
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", dod.getRandomFlight());
        long count = Flight.countFlights();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Flight> result = Flight.findFlightEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Flight' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Flight' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FlightIntegrationTest.testFlush() {
        Flight obj = dod.getRandomFlight();
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", obj);
        FlightKey id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Flight' failed to provide an identifier", id);
        obj = Flight.findFlight(id);
        Assert.assertNotNull("Find method for 'Flight' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyFlight(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Flight' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FlightIntegrationTest.testMergeUpdate() {
        Flight obj = dod.getRandomFlight();
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", obj);
        FlightKey id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Flight' failed to provide an identifier", id);
        obj = Flight.findFlight(id);
        boolean modified =  dod.modifyFlight(obj);
        Integer currentVersion = obj.getVersion();
        Flight merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Flight' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void FlightIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", dod.getRandomFlight());
        Flight obj = dod.getNewTransientFlight(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Flight' failed to provide a new transient entity", obj);
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Flight' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void FlightIntegrationTest.testRemove() {
        Flight obj = dod.getRandomFlight();
        Assert.assertNotNull("Data on demand for 'Flight' failed to initialize correctly", obj);
        FlightKey id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Flight' failed to provide an identifier", id);
        obj = Flight.findFlight(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Flight' with identifier '" + id + "'", Flight.findFlight(id));
    }
    
}