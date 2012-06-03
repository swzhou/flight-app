package sample.roo.flightapp.domain;

public class SearchCriteria {

	private String destination;
	private String origin;

	public SearchCriteria(String destination, String origin) {
		this.destination = destination;
		this.origin = origin;
	}
	
	public String getDestination() {
		return destination;
	}

	public String getOrigin() {
		return origin;
	}

}
