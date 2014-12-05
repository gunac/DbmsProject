package ApplicationDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Customer;


public class CustomerDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("CarRental");

	EntityManager em = null;

	public CustomerDao(){
		em = factory.createEntityManager();
	}	

	// insert
	public void insertCustomer(Customer Customer){
		em.getTransaction().begin();
		em.persist(Customer);
		em.getTransaction().commit();
	}

	// Read all
	public List<Customer> getAllCustomer() {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT c FROM Customer c", Customer.class);
		List<Customer> lstCustomerInfo = q.getResultList();
		em.getTransaction().commit();
		return lstCustomerInfo;
	}

	// get by id
	public Customer getCustomerById(int id){
		em.getTransaction().begin();
		Customer cusObj = em.find(Customer.class, id);
		em.getTransaction().commit();
		return cusObj;
	}

	// Get Customer by by Email to check duplicates
	// if list count > 0 => Email exists
	public List<Customer> getCustomerByEmail(String email) {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT c FROM Customer c where c.Email = : email", Customer.class);
		List<Customer> lstCustomerInfo = q.getResultList();
		em.getTransaction().commit();
		return lstCustomerInfo;
	}

	// Get Password for given Email 
	public String getCustomerPassword(String email) {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT c FROM Customer c where c.Email = : email", Customer.class);
		Customer cusObj = (Customer) q.getSingleResult();
		em.getTransaction().commit();
		return cusObj.getPassword();
	}


	// Update
	public boolean updateCustomer(int customerId, Customer customer)
	{			
		em.getTransaction().begin();
		Customer CustomerObj = em.find(Customer.class, customerId);	
		CustomerObj.setName(customer.getName());
		CustomerObj.setDob(customer.getDob());
		CustomerObj.setEmail(customer.getEmail());
		CustomerObj.setEmail(customer.getPassword());
		CustomerObj.setLicenseNo(customer.getLicenseNo());		
		em.merge(CustomerObj);
		em.getTransaction().commit();
		return true;
	}


	//  removes 
	public boolean removeCustomer(int cusId){
		em.getTransaction().begin();
		Customer CustomerObj = em.find(Customer.class, cusId);		
		em.remove(CustomerObj);
		em.getTransaction().commit();
		return true;
	}

}
