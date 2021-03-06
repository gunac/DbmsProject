package ApplicationDao;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.CarModel;
import model.Location;

public class LocationDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("CarRental");

	EntityManager em = null;

	public LocationDao(){
		em = factory.createEntityManager();
	}	

	// insert
	public void insertLocation(Location loc){
		em.getTransaction().begin();
		em.persist(loc);
		em.getTransaction().commit();
		RentalDao d = new RentalDao();
		d.insertRentalInfoForAllLocation();
	}

	// Read all
	public List<Location> getAllLocation() {
		em.getTransaction().begin();
		Query q = em.createNamedQuery("GetAllLocation");
		List<Location> lstLocationInfo =(List<Location>) q.getResultList();
		em.getTransaction().commit();
		return lstLocationInfo;
	} 
//  removes 
	public void removeLocation(String loc){
		em.getTransaction().begin();
		Location locObj = em.find(Location.class, loc);		
		em.remove(locObj);
		em.getTransaction().commit();
		RentalDao d = new RentalDao();
		d.insertRentalInfoForAllLocation();
		//return true;
	}



	public static void main(String[] args) {
		
		 
		//System.out.println("Current Date: " + ft.format(dNow));

	}


}
