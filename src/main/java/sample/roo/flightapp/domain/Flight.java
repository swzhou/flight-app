package sample.roo.flightapp.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = FlightKey.class, table = "flights")
public class Flight {

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "M-")
	private Date modifiedDate;

	private String modifiedBy;

	@NotNull
	@DecimalMin("100")
	@DecimalMax("200")
	private Integer numOfSeats;

	@NotNull
	@Size(min = 3, max = 20)
	private String origin;

	@NotNull
	@Size(min = 3, max = 20)
	private String destination;

	@NotNull
	@Column(name = "created_date")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(style = "M-")
	private Date createdDate;

	@NotNull
	private String createdBy;
	
	public static long countFlights() {
        return entityManager().createQuery("SELECT COUNT(*) FROM Flight o", Long.class).getSingleResult();
    }
}
