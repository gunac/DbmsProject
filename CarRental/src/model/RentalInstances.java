package model;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="RentalInstances")
public class RentalInstances {


	@XmlElement(name="Rental")
	private List<Rental> rentalType;

	public List<Rental> getRentalTypes() {
		return rentalType;
	}

	public void setRentalTypes(List<Rental> rentalTypes) {
		this.rentalType = rentalTypes;
	}

	public RentalInstances() {
		super();
	}

	public RentalInstances(List<Rental> rentalTypes) {
		super();
		this.rentalType = rentalTypes;
	}
}
