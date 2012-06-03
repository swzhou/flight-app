package sample.roo.flightapp.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.jpa.identifier.RooIdentifier;
import org.springframework.roo.addon.tostring.RooToString;

@RooToString
@RooEquals
@RooIdentifier
public final class FlightKey implements Serializable {

    @NotNull
    private String flightId;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date departureDate;
}
