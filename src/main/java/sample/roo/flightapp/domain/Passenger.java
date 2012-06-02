package sample.roo.flightapp.domain;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean(settersByDefault = true, gettersByDefault = true)
@RooToString
@RooEquals
@RooSerializable
public class Passenger {

	private String firstName;

	private String lastName;

	private Integer age;

	private Address address;
}
