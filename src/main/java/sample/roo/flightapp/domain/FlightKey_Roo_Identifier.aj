// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import java.util.Date;
import javax.persistence.Embeddable;
import sample.roo.flightapp.domain.FlightKey;

privileged aspect FlightKey_Roo_Identifier {
    
    declare @type: FlightKey: @Embeddable;
    
    public FlightKey.new(String flightId, Date departureDate) {
        super();
        this.flightId = flightId;
        this.departureDate = departureDate;
    }

    private FlightKey.new() {
        super();
    }

    public String FlightKey.getFlightId() {
        return flightId;
    }
    
    public Date FlightKey.getDepartureDate() {
        return departureDate;
    }
    
}
