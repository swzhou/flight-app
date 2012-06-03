package sample.roo.flightapp.domain;

import org.springframework.roo.addon.dod.RooDataOnDemand;

@RooDataOnDemand(entity = Flight.class)
public class FlightDataOnDemand {
	
	public void setNumOfSeats(Flight obj, int index) {
        Integer numOfSeats = new Integer(150);
        obj.setNumOfSeats(numOfSeats);
    }
}
