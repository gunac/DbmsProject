package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="Rental")
@Entity
public class Rental implements Serializable {
	 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)		
	private int RentId;	
	private String CarTypeCode;
	private String Location;	
	private double SubTotal;
	private double TaxesAndFees;
	private double TotalPrice;	
	private double DailyRate;
	 
	private int RentalDays;
	
	public int getRentId() {
		return RentId;
	}
	public void setRentId(int rentId) {
		RentId = rentId;
	}
	@XmlElement(name = "SubTotal")
	public double getSubTotal() {
		return SubTotal;
	}
	public void setSubTotal(double subTotal) {
		SubTotal = subTotal;
	}
	@XmlElement(name = "TaxesAndFees")
	public double getTaxesAndFees() {
		return TaxesAndFees;
	}
	public void setTaxesAndFees(double taxesAndFees) {
		TaxesAndFees = taxesAndFees;
	}
	@XmlElement(name = "TotalPrice")
	public double getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		TotalPrice = totalPrice;
	}
	
	// creates a foreign key in rental table	 
	@XmlElement(name = "CarTypeCode")
	public String getCarTypeCode() {
		return CarTypeCode;
	}
	public void setCarTypeCode(String carTypeCode) {
		CarTypeCode = carTypeCode;
	}
	
	@XmlElement(name = "DailyRate")
	public double getDailyRate() {
		return DailyRate;
	}
	public void setDailyRate(double dailyRate) {
		DailyRate = dailyRate;
	}
	
	  
		
	@XmlElement(name = "PickupAirport") 
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	
	@XmlElement(name = "RentalDays") 
	public int getRentalDays() {
		return RentalDays;
	}
	public void setRentalDays(int rentalDays) {
		RentalDays = rentalDays;
	}
	public Rental(int rentId, String carTypeCode, String location,
			double subTotal, double taxesAndFees, double totalPrice,
			double dailyRate,  int rentalDays) {
		super();
		RentId = rentId;
		CarTypeCode = carTypeCode;
		Location = location;
		SubTotal = subTotal;
		TaxesAndFees = taxesAndFees;
		TotalPrice = totalPrice;
		DailyRate = dailyRate;
		 
		RentalDays = rentalDays;
	}
	public Rental() {
		super();
	}
	public Rental(String carTypeCode, String location,
			double subTotal, double taxesAndFees, double totalPrice,
			double dailyRate, int rentalDays) {
		super();
		CarTypeCode = carTypeCode;
		Location = location;
		SubTotal = subTotal;
		TaxesAndFees = taxesAndFees;
		TotalPrice = totalPrice;
		DailyRate = dailyRate;
		 
		RentalDays = rentalDays;
	}
	
	
	
}
