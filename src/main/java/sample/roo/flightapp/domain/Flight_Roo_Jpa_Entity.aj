// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Version;
import sample.roo.flightapp.domain.Flight;
import sample.roo.flightapp.domain.FlightKey;

privileged aspect Flight_Roo_Jpa_Entity {
    
    declare @type: Flight: @Entity;
    
    declare @type: Flight: @Table(name = "flights");
    
    @EmbeddedId
    private FlightKey Flight.id;
    
    @Version
    @Column(name = "version")
    private Integer Flight.version;
    
    public FlightKey Flight.getId() {
        return this.id;
    }
    
    public void Flight.setId(FlightKey id) {
        this.id = id;
    }
    
    public Integer Flight.getVersion() {
        return this.version;
    }
    
    public void Flight.setVersion(Integer version) {
        this.version = version;
    }
    
}
