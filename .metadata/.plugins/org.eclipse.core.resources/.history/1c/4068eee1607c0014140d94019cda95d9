package ApplicationDao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.CarType;
import model.CarTypeInstances;
import model.Rental;
import model.RentalInstances;

public class RentalDao {

	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("CarRental");

	EntityManager em = null;

	public RentalDao(){
		em = factory.createEntityManager();
	}	
	
	public void createRentalInfo(RentalInstances lstrentalInstances){
		em.getTransaction().begin();
		for(Rental rental : lstrentalInstances.getRentalTypes())
		{
			em.persist(rental);
		}
		 
		em.getTransaction().commit();

	}
}
