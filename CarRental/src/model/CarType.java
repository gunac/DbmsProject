package model;
 

import javax.persistence.Entity;
 
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
 
@XmlRootElement(name="CarType") 
@Entity
public class CarType {
	
	@Id
	@XmlElement(name="CarTypeCode")
	private String CarTypeCode;
	@XmlElement(name="CarTypeName")
	private String CarTypeName;
	@XmlElement(name="TypicalSeating")
	private String SeatingInfo;
	
	public String getCarTypeCode() {
		return CarTypeCode;
	}
	public void setCarTypeCode(String carTypeCode) {
		CarTypeCode = carTypeCode;
	}
	public String getCarTypeName() {
		return CarTypeName;
	}
	public void setCarTypeName(String carTypeName) {
		CarTypeName = carTypeName;
	}
	public String getSeatingInfo() {
		return SeatingInfo;
	}
	public void setSeatingInfo(String seatingInfo) {
		SeatingInfo = seatingInfo;
	}
	
	
	public CarType() {
		super();
	}
	
	public CarType(String carTypeCode, String carTypeName, String seatingInfo) {
		super();
		CarTypeCode = carTypeCode;
		CarTypeName = carTypeName;
		SeatingInfo = seatingInfo;
	}
	
	 
	 
	
	
	 
}
