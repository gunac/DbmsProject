package model;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

 
@XmlAccessorType(value = XmlAccessType.FIELD)
public class ListCarTypes {

	// Name of the xml element 
	@XmlElementWrapper(name = "CarTypes")
	@XmlElement(name="CarType")
	private List<CarType> carTypes;

	public List<CarType> getCarTypes() {
		return carTypes;
	}

	public void setCarTypes(List<CarType> carTypes) {
		this.carTypes = carTypes;
	}

	public ListCarTypes(List<CarType> carTypes) {
		super();
		this.carTypes = carTypes;
	}

	public ListCarTypes() {
		super();
	}
	
	
	
}
