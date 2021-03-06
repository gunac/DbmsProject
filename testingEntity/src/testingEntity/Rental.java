package testingEntity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

 @Entity

public class Rental {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	 
	 @Column(name = "id") 
	private int RentId;
	private double SubTotal;
	private double TaxesAndFees;
	private double TotalPrice;
	private CarType CarTypeCode;
	private double DailyRate;
	private Date DropoffDay;
	private Date DropoffTime;
	private Date PickupDay;
	private Date PickupTime;
	private String LocationDescription;
	private String PickupAirport;
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
	public Date getDropoffTime() {
		return DropoffTime;
	}
	public void setDropoffTime(Date dropoffTime) {
		DropoffTime = dropoffTime;
	}
	public Date getPickupDay() {
		return PickupDay;
	}
	public void setPickupDay(Date pickupDay) {
		PickupDay = pickupDay;
	}
	public Date getPickupTime() {
		return PickupTime;
	}
	public void setPickupTime(Date pickupTime) {
		PickupTime = pickupTime;
	}
	public String getLocationDescription() {
		return LocationDescription;
	}
	public void setLocationDescription(String locationDescription) {
		LocationDescription = locationDescription;
	}
	public String getPickupAirport() {
		return PickupAirport;
	}
	public void setPickupAirport(String pickupAirport) {
		PickupAirport = pickupAirport;
	}
	public int getRentalDays() {
		return RentalDays;
	}
	public void setRentalDays(int rentalDays) {
		RentalDays = rentalDays;
	}
	
}
