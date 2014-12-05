package model;

import java.util.Date;

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

@Entity 
public class Rental {
	 
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)	
	
	
	private int RentId;
	private CarType CarTypeCode;
	private String LocationDescription;	
	private double SubTotal;
	private double TaxesAndFees;
	private double TotalPrice;	
	private double DailyRate;
	@Temporal(TemporalType.DATE)
	private Date DropoffDay;
	@Temporal(TemporalType.DATE)	 
	private Date PickupDay;	 
	private int RentalDays;
	
	public int getRentId() {
		return RentId;
	}
	public void setRentId(int rentId) {
		RentId = rentId;
	}
	public double getSubTotal() {
		return SubTotal;
	}
	public void setSubTotal(double subTotal) {
		SubTotal = subTotal;
	}
	public double getTaxesAndFees() {
		return TaxesAndFees;
	}
	public void setTaxesAndFees(double taxesAndFees) {
		TaxesAndFees = taxesAndFees;
	}
	public double getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		TotalPrice = totalPrice;
	}
	
	// creates a foreign key in Tower Table
	@ManyToOne()
	@JoinColumn(name="CarTypeCode")
	public CarType getCarTypeCode() {
		return CarTypeCode;
	}
	public void setCarTypeCode(CarType carTypeCode) {
		CarTypeCode = carTypeCode;
	}
	public double getDailyRate() {
		return DailyRate;
	}
	public void setDailyRate(double dailyRate) {
		DailyRate = dailyRate;
	}
	public Date getDropoffDay() {
		return DropoffDay;
	}
	public void setDropoffDay(Date dropoffDay) {
		DropoffDay = dropoffDay;
	}
	 
	public Date getPickupDay() {
		return PickupDay;
	}
	public void setPickupDay(Date pickupDay) {
		PickupDay = pickupDay;
	}
	 
	public String getLocationDescription() {
		return LocationDescription;
	}
	public void setLocationDescription(String locationDescription) {
		LocationDescription = locationDescription;
	}
	 
	public int getRentalDays() {
		return RentalDays;
	}
	public void setRentalDays(int rentalDays) {
		RentalDays = rentalDays;
	}
	
}
