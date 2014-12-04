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
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)		
	private int OrderId;
	private Customer CustomerId;
	private CarModel ModelId;
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
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	
	// creates a foreign key in Tower Table
		@ManyToOne()
		@JoinColumn(name="CustomerId")
	public Customer getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(Customer customerId) {
		CustomerId = customerId;
	}
	
	// creates a foreign key in Tower Table
		@ManyToOne()
		@JoinColumn(name="ModelId")
	public CarModel getModelId() {
		return ModelId;
	}
	public void setModelId(CarModel modelId) {
		ModelId = modelId;
	}
	public String getLocationDescription() {
		return LocationDescription;
	}
	public void setLocationDescription(String locationDescription) {
		LocationDescription = locationDescription;
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
	public Order(int orderId, Customer customerId, CarModel modelId,
			String locationDescription, double subTotal, double taxesAndFees,
			double totalPrice, double dailyRate, Date dropoffDay,
			Date pickupDay, int rentalDays) {
		super();
		OrderId = orderId;
		CustomerId = customerId;
		ModelId = modelId;
		LocationDescription = locationDescription;
		SubTotal = subTotal;
		TaxesAndFees = taxesAndFees;
		TotalPrice = totalPrice;
		DailyRate = dailyRate;
		DropoffDay = dropoffDay;
		PickupDay = pickupDay;
		RentalDays = rentalDays;
	}
	public Order() {
		super();
	}
	public Order(Customer customerId, CarModel modelId,
			String locationDescription, double subTotal, double taxesAndFees,
			double totalPrice, double dailyRate, Date dropoffDay,
			Date pickupDay, int rentalDays) {
		super();
		CustomerId = customerId;
		ModelId = modelId;
		LocationDescription = locationDescription;
		SubTotal = subTotal;
		TaxesAndFees = taxesAndFees;
		TotalPrice = totalPrice;
		DailyRate = dailyRate;
		DropoffDay = dropoffDay;
		PickupDay = pickupDay;
		RentalDays = rentalDays;
	}
	

}
