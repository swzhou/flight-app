// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import sample.roo.flightapp.domain.Flight;

privileged aspect Flight_Roo_JavaBean {
    
    public Integer Flight.getFlightId() {
        return this.flightId;
    }
    
    public void Flight.setFlightId(Integer flightId) {
        this.flightId = flightId;
    }
    
}