package model;

import java.util.List;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="CarTypes")
 public class CarTypeInstances {

	// Name of the xml element 	
	
	private List<CarType> bcarTypes;
	
	@XmlElement(name="CarType")
	public List<CarType> getCarTypes() {
		return bcarTypes;
	}

	public void setCarTypes(List<CarType> carTypes) {
		this.bcarTypes = carTypes;
	}

	public CarTypeInstances(List<CarType> carTypes) {
		super();
		this.bcarTypes = carTypes;
	}

	public CarTypeInstances() {
		super();
	}
	
	
	
}
