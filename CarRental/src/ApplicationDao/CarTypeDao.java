package ApplicationDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.CarType;

public class CarTypeDao {
	
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("jpa");
	
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
			
	
	public static void main(String[] args) {
		 		
	}

}
