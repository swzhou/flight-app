// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import sample.roo.flightapp.domain.FlightDescription;

privileged aspect FlightDescription_Roo_JavaBean {
    
    public String FlightDescription.getFromCity() {
        return this.fromCity;
    }
    
    public void FlightDescription.setFromCity(String fromCity) {
        this.fromCity = fromCity;
    }
    
    public String FlightDescription.getToCity() {
        return this.toCity;
    }
    
    public void FlightDescription.setToCity(String toCity) {
        this.toCity = toCity;
    }
    
}