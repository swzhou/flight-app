// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import java.util.Date;
import sample.roo.flightapp.domain.Flight;

privileged aspect Flight_Roo_JavaBean {
    
    public Date Flight.getModifiedDate() {
        return this.modifiedDate;
    }
    
    public void Flight.setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
    
    public String Flight.getModifiedBy() {
        return this.modifiedBy;
    }
    
    public void Flight.setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
    
    public Integer Flight.getNumOfSeats() {
        return this.numOfSeats;
    }
    
    public void Flight.setNumOfSeats(Integer numOfSeats) {
        this.numOfSeats = numOfSeats;
    }
    
    public String Flight.getOrigin() {
        return this.origin;
    }
    
    public void Flight.setOrigin(String origin) {
        this.origin = origin;
    }
    
    public String Flight.getDestination() {
        return this.destination;
    }
    
    public void Flight.setDestination(String destination) {
        this.destination = destination;
    }
    
    public Date Flight.getCreatedDate() {
        return this.createdDate;
    }
    
    public void Flight.setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    public String Flight.getCreatedBy() {
        return this.createdBy;
    }
    
    public void Flight.setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    
}
