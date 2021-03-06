package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Orders {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)		
	private int OrderId;
	private int CustomerId;
	private int ModelId;
	private String Location;	
	private double SubTotal;
	private double TaxesAndFees;
	private double TotalPrice;	
	private double DailyRate;
	@Temporal(TemporalType.DATE)
	private Date DropoffDay;
	@Temporal(TemporalType.DATE)	 
	private Date PickupDay;	 
	private int RentalDays;
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	
	// creates a foreign key in Tower Table
		 
	public int getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}
	
	// creates a foreign key 		 
	public int getModelId() {
		return ModelId;
	}
	public void setModelId(int modelId) {
		ModelId = modelId;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String locationDescription) {
		Location = locationDescription;
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
	public int getRentalDays() {
		return RentalDays;
	}
	public void setRentalDays(int rentalDays) {
		RentalDays = rentalDays;
	}
	public Orders(int orderId, int customerId, int modelId,
			String locationDescription, double subTotal, double taxesAndFees,
			double totalPrice, double dailyRate, Date dropoffDay,
			Date pickupDay, int rentalDays) {
		super();
		OrderId = orderId;
		CustomerId = customerId;
		ModelId = modelId;
		Location = locationDescription;
		SubTotal = subTotal;
		TaxesAndFees = taxesAndFees;
		TotalPrice = totalPrice;
		DailyRate = dailyRate;
		DropoffDay = dropoffDay;
		PickupDay = pickupDay;
		RentalDays = rentalDays;
	}
	
	public Orders() {
		super();
	}
	
	public Orders(int customerId, int modelId,
			String locationDescription, double subTotal, double taxesAndFees,
			double totalPrice, double dailyRate, Date dropoffDay,
			Date pickupDay, int rentalDays) {
		super();
		CustomerId = customerId;
		ModelId = modelId;
		Location = locationDescription;
		SubTotal = subTotal;
		TaxesAndFees = taxesAndFees;
		TotalPrice = totalPrice;
		DailyRate = dailyRate;
		DropoffDay = dropoffDay;
		PickupDay = pickupDay;
		RentalDays = rentalDays;
	}
	

}
