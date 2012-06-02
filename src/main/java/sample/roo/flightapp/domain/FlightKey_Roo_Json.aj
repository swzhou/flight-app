// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package sample.roo.flightapp.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import sample.roo.flightapp.domain.FlightKey;

privileged aspect FlightKey_Roo_Json {
    
    public String FlightKey.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static FlightKey FlightKey.fromJsonToFlightKey(String json) {
        return new JSONDeserializer<FlightKey>().use(null, FlightKey.class).deserialize(json);
    }
    
    public static String FlightKey.toJsonArray(Collection<FlightKey> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<FlightKey> FlightKey.fromJsonArrayToFlightKeys(String json) {
        return new JSONDeserializer<List<FlightKey>>().use(null, ArrayList.class).use("values", FlightKey.class).deserialize(json);
    }
    
}
