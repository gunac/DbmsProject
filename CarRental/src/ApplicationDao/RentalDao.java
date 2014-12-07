package ApplicationDao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.CarType;
import model.CarTypeInstances;
import model.Customer;
import model.Rental;
import model.RentalInstances;

public class RentalDao {


	EntityManagerFactory factory = Persistence.createEntityManagerFactory("CarRental");

	EntityManager em = null;

	public RentalDao(){
		em = factory.createEntityManager();
	}	

	public void insertRentalInstances(RentalInstances lstrentalInstances){
		em.getTransaction().begin();

		for(Rental rental : lstrentalInstances.getRentalTypes())
		{
			em.persist(rental);
		}

		em.getTransaction().commit();

	}
	
	public List<Rental> getAllRental() {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT r FROM Rental r");
		List<Rental> lstRentalInfo = q.getResultList();
		em.getTransaction().commit();
		return lstRentalInfo;
	}

	// 
	public List<Rental> getRentalInfoForLocationAndDate(String Location, Date dropoffdate) {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT r FROM Rental r WHERE r.Location ='"+ Location +"'and r.Dropoffdate = '"+dropoffdate+ "'");
		List<Rental> lstRentalInfo = (List<Rental>)q.getResultList();
		em.getTransaction().commit();
		return lstRentalInfo;
	}
	
	public List<Rental> getRentalInfoByLocation(String Location) {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT r FROM Rental r WHERE r.Location ='"+ Location +"'");
		List<Rental> lstRentalInfo = (List<Rental>)q.getResultList();
		em.getTransaction().commit();
		return lstRentalInfo;
	}
	
	public Rental getRentalById(int id){
		em.getTransaction().begin();
		Rental rentalObj = em.find(Rental.class, id);
		em.getTransaction().commit();
		return rentalObj;
	}

}
