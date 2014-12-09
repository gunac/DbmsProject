package ApplicationDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
 


import model.Customer;
import model.Orders;
import model.Rental;

public class OrdersDao {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("CarRental");

	EntityManager em = null;

	public OrdersDao(){
		em = factory.createEntityManager();
	}
	
	// Can be used to show in admin page
	public List<Orders> getAllOrders() {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT r FROM Orders r");
		List<Orders> lstOrderInfo =(List<Orders>) q.getResultList();
		em.getTransaction().commit();
		return lstOrderInfo;
	}

	// Used to show History for a user
	public List<Orders> getOrderByCustomerId(int customerId){
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT o FROM Orders o WHERE o.CustomerId "+ customerId);
		List<Orders> lstOrderInfo =(List<Orders>) q.getResultList();
		em.getTransaction().commit();
		return lstOrderInfo;
	}
	
	// get order by orderId
	public Orders getOrderByOrderId(int orderId){
		em.getTransaction().begin();
		Orders neworder =em.find(Orders.class, orderId);
		em.getTransaction().commit();
		return neworder;
	}
	
	public void insertOrder(int customerId, int rentalId, int modelId , int NoOfDays)
	{
		
		RentalDao rentalDao = new RentalDao();
		Rental rentalObj = new Rental();
		rentalDao.getRentalById(rentalId);
		
		// Create Order Obj
		
		Orders orderObj = new Orders();		
		orderObj.setCustomerId(customerId);
		orderObj.setModelId(modelId);
		orderObj.setLocation(rentalObj.getLocation());
		orderObj.setSubTotal(rentalObj.getSubTotal());
		orderObj.setTaxesAndFees(rentalObj.getTaxesAndFees());
		// We gave to re write logic to get price for number of days
		orderObj.setTotalPrice(rentalObj.getTotalPrice() * NoOfDays);
		orderObj.setDailyRate(rentalObj.getDailyRate());
		orderObj.setDropoffDay(rentalObj.getDropoffDay());
		orderObj.setPickupDay(rentalObj.getPickupDay());
		orderObj.setRentalDays(NoOfDays);
		
		em.getTransaction().begin();
		em.persist(orderObj);
		em.getTransaction().commit();
		
	}

	public static void main(String[] args) {
		
	}

}
