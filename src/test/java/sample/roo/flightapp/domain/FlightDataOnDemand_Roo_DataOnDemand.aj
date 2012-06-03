// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;
import sample.roo.flightapp.domain.Flight;
import sample.roo.flightapp.domain.FlightDataOnDemand;
import sample.roo.flightapp.domain.FlightKey;

privileged aspect FlightDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FlightDataOnDemand: @Component;
    
    private Random FlightDataOnDemand.rnd = new SecureRandom();
    
    private List<Flight> FlightDataOnDemand.data;
    
    public Flight FlightDataOnDemand.getNewTransientFlight(int index) {
        Flight obj = new Flight();
        setEmbeddedIdClass(obj, index);
        setCreatedBy(obj, index);
        setCreatedDate(obj, index);
        setDestination(obj, index);
        setModifiedBy(obj, index);
        setModifiedDate(obj, index);
        setNumOfSeats(obj, index);
        setOrigin(obj, index);
        return obj;
    }
    
    public void FlightDataOnDemand.setEmbeddedIdClass(Flight obj, int index) {
        String flightId = "flightId_" + index;
        Date departureDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        
        FlightKey embeddedIdClass = new FlightKey(flightId, departureDate);
        obj.setId(embeddedIdClass);
    }
    
    public void FlightDataOnDemand.setCreatedBy(Flight obj, int index) {
        String createdBy = "createdBy_" + index;
        obj.setCreatedBy(createdBy);
    }
    
    public void FlightDataOnDemand.setCreatedDate(Flight obj, int index) {
        Date createdDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreatedDate(createdDate);
    }
    
    public void FlightDataOnDemand.setDestination(Flight obj, int index) {
        String destination = "destination_" + index;
        if (destination.length() > 20) {
            destination = destination.substring(0, 20);
        }
        obj.setDestination(destination);
    }
    
    public void FlightDataOnDemand.setModifiedBy(Flight obj, int index) {
        String modifiedBy = "modifiedBy_" + index;
        obj.setModifiedBy(modifiedBy);
    }
    
    public void FlightDataOnDemand.setModifiedDate(Flight obj, int index) {
        Date modifiedDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setModifiedDate(modifiedDate);
    }
    
    public void FlightDataOnDemand.setOrigin(Flight obj, int index) {
        String origin = "origin_" + index;
        if (origin.length() > 20) {
            origin = origin.substring(0, 20);
        }
        obj.setOrigin(origin);
    }
    
    public Flight FlightDataOnDemand.getSpecificFlight(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Flight obj = data.get(index);
        FlightKey id = obj.getId();
        return Flight.findFlight(id);
    }
    
    public Flight FlightDataOnDemand.getRandomFlight() {
        init();
        Flight obj = data.get(rnd.nextInt(data.size()));
        FlightKey id = obj.getId();
        return Flight.findFlight(id);
    }
    
    public boolean FlightDataOnDemand.modifyFlight(Flight obj) {
        return false;
    }
    
    public void FlightDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Flight.findFlightEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Flight' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Flight>();
        for (int i = 0; i < 10; i++) {
            Flight obj = getNewTransientFlight(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}