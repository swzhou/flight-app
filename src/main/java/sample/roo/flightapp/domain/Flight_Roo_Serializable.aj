// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import java.io.Serializable;
import sample.roo.flightapp.domain.Flight;

privileged aspect Flight_Roo_Serializable {
    
    declare parents: Flight implements Serializable;
    
    private static final long Flight.serialVersionUID = 1L;
    
}
