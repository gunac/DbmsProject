package ApplicationDao;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	// deletes
		public void removeOrder(int orderId){
			em.getTransaction().begin();
			Orders orderObj = em.find(Orders.class, orderId);		
			em.remove(orderObj);
			em.getTransaction().commit();
			//return true;
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
		Query q = em.createQuery("SELECT o FROM Orders o WHERE o.CustomerId = "+ customerId);
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
	
	public int insertOrder(int customerId, int rentalId, int modelId , String pickupday, String dropoffday, String location)
	{
	SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");

	Date pickupDay, dropoffDay;
	try {
	pickupDay = formatter.parse(pickupday);
	dropoffDay  = formatter.parse(dropoffday);


	int difference = (int)Math.abs(pickupDay.getTime() - dropoffDay.getTime());
	int NoOfDays = (int) Math.ceil(difference / (1000 * 3600 * 24))+1;

	
	RentalDao rentalDao = new RentalDao();
	Rental rentalObj = new Rental();
	rentalObj =  rentalDao.getRentalById(rentalId);
	CarModelDao cmDao = new CarModelDao();
	cmDao.decreaseCountandUpcateCarModel(modelId);
	double taxes = rentalObj.getTaxesAndFees();
	// Create Order Obj	
	Orders orderObj = new Orders();	
	orderObj.setCustomerId(customerId);
	orderObj.setModelId(modelId);
	orderObj.setLocation(location);
	orderObj.setSubTotal(rentalObj.getSubTotal());
	orderObj.setTaxesAndFees(taxes);
	// Calculate total price for 2 days based on number of days
	orderObj.setTotalPrice((rentalObj.getDailyRate() * NoOfDays) + taxes);
	orderObj.setDailyRate(rentalObj.getDailyRate());
	orderObj.setDropoffDay(dropoffDay);
	orderObj.setPickupDay(pickupDay);
	orderObj.setRentalDays(NoOfDays);

	em.getTransaction().begin();
	em.persist(orderObj);
	em.getTransaction().commit();
	} catch (ParseException e) {
	e.printStackTrace();
	}
	return getLastInsertedId();

	}

	public int getLastInsertedId()
	{
	em.getTransaction().begin();
	Query q = em.createNativeQuery("select last_insert_id();");

	BigInteger lastInsertedId = (BigInteger) q.getSingleResult();
	System.out.println(lastInsertedId);
	return lastInsertedId.intValue();
	}

	public static void main(String[] args) {
		
	}

}
