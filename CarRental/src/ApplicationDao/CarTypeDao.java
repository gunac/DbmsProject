package ApplicationDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.CarType;
import model.CarTypeInstances;
 
public class CarTypeDao {


	EntityManagerFactory factory = Persistence.createEntityManagerFactory("CarRental");

	EntityManager em = null;

	public CarTypeDao(){
		em = factory.createEntityManager();
	}	



	// inserts a new site record into the database and then returns a list of all the sites	
	public void createCarType(CarType cartypeObj){
		em.getTransaction().begin();
		em.persist(cartypeObj);
		em.getTransaction().commit();

	}

	public void createCarType(CarTypeInstances lstcartypeObj){
		em.getTransaction().begin();
		for(CarType ct : lstcartypeObj.getCarTypes())
		{
			em.persist(ct);
		}
		 
		em.getTransaction().commit();

	}



	public static void main(String[] args) {

	}

}
