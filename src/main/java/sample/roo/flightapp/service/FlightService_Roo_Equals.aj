// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.service;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import sample.roo.flightapp.service.FlightService;

privileged aspect FlightService_Roo_Equals {
    
    public boolean FlightService.equals(Object obj) {
        if (!(obj instanceof FlightService)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        FlightService rhs = (FlightService) obj;
        return new EqualsBuilder().append(origin, rhs.origin).append(target, rhs.target).isEquals();
    }
    
    public int FlightService.hashCode() {
        return new HashCodeBuilder().append(origin).append(target).toHashCode();
    }
    
}
