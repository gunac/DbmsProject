package ApplicationDao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.commons.codec.digest.DigestUtils;

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
		Query q = em.createQuery("SELECT c FROM Customer c");
		List<Customer> lstCustomerInfo =(List<Customer>) q.getResultList();
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
	public boolean getCustomerByEmail(String email) {
		List<Customer> lstCustomerInfo =getAllCustomer();
		Customer cusObj = new Customer();
		List<Customer> lstCusWithSameEmail = new ArrayList<Customer>();
		for(Customer c : lstCustomerInfo){			
			if(c.getEmail().equals(email)){				 
				lstCusWithSameEmail.add(c);
			}
		}	
		if(lstCusWithSameEmail.isEmpty())
			return true;
		else
			return false;
	}

	// Get Password for given Email 
	public String getCustomerPassword(String email) {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT c FROM Customer c where c.Email = '" + email + "'");	 
		Customer cusObj = (Customer) q.getSingleResult();
		em.getTransaction().commit();
		return cusObj.getPassword();
	}
	
	public Customer getCustomerforEmail(String email) {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT c FROM Customer c where c.Email = '" + email + "'");	 
		Customer cusObj = (Customer) q.getSingleResult();
		em.getTransaction().commit();
		return cusObj;
	}

	//Get Customer by email and password
	public Customer getCustomerByEmailandPassword(String email, String password) {
		em.getTransaction().begin();
		
		Customer cusObj = null;
		Query q = em.createNamedQuery("findCustomerByEmailandPassword")
				.setParameter("email", email)
				.setParameter("password", (DigestUtils.sha256Hex(password)));
		try{
		cusObj = (Customer) q.getSingleResult();
		}catch (NoResultException nre){
			return null;
		}
		em.getTransaction().commit();
		return cusObj;
	}
	
	
	// Update
	public boolean updateCustomer(int customerId, Customer customer)
	{			
		em.getTransaction().begin();
		Customer CustomerObj = em.find(Customer.class, customerId);	
		CustomerObj.setName(customer.getName());
		CustomerObj.setDob(customer.getDob());
		CustomerObj.setEmail(customer.getEmail());
		CustomerObj.setPassword(customer.getPassword());
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

	public static void main(String[] args) {
//		CustomerDao dao = new CustomerDao();
//		Customer user = dao.getCustomerById(4);
//		if(dao.updateCustomer(8, user)){
//			System.out.println(dao.getCustomerById(8).getPassword());
//		}
//		System.out.println(user.getPassword());
	}

}
