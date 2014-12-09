package model;
 

import java.io.Serializable;

import javax.persistence.Entity;
 
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
 
@XmlRootElement(name="CarType")
@Entity
public class CarType implements Serializable {
	
	@Id	
	private String CarTypeCode;
	private String CarTypeName;	
	private String SeatingInfo;
	private String Features;
	
	@XmlElement(name = "CarTypeCode")
	public String getCarTypeCode() {
		return CarTypeCode;
	}
	public void setCarTypeCode(String carTypeCode) {
		CarTypeCode = carTypeCode;
	}
	@XmlElement(name = "CarTypeName")
	public String getCarTypeName() {
		return CarTypeName;
	}
	
	public void setCarTypeName(String carTypeName) {
		CarTypeName = carTypeName;
	}
	@XmlElement(name = "TypicalSeating")
	public String getSeatingInfo() {
		return SeatingInfo;
	}
	public void setSeatingInfo(String seatingInfo) {
		SeatingInfo = seatingInfo;
	}	
	@XmlElement(name = "PossibleFeatures")		
	public String getFeatures() {
		return Features;
	}
	public void setFeatures(String features) {
		Features = features;
	}
	public CarType() {
		super();
	}
	
	public CarType(String carTypeCode, String carTypeName, String seatingInfo, String features) {
		super();
		CarTypeCode = carTypeCode;
		CarTypeName = carTypeName;
		SeatingInfo = seatingInfo;
		Features = features;
	}
		 
}
