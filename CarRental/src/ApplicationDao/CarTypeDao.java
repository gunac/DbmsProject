package ApplicationDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

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
		em.close();
	}

	public void insertCarTypeInstances(CarTypeInstances lstcartypeObj){
		em.getTransaction().begin();
		for(CarType ct : lstcartypeObj.getCarTypes())
		{
			em.persist(ct);
		}

		em.getTransaction().commit();
		em.close();
	}
	
	public List<CarType> getAllCarTypes() {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT c FROM CarType c");
		List<CarType> lstCarTypeInfo =(List<CarType>)q.getResultList();
		em.getTransaction().commit();
		em.close();
		return lstCarTypeInfo;
	}

	public static void main(String[] args) {
		
		//CarTypeDao d = new CarTypeDao();
		//d.getAllCarTypes();

	}

}
