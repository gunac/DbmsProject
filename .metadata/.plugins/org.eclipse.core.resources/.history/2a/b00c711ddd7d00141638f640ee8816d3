package ApplicationDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.CarModel;
import model.Customer;


public class CarModelDao {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory("CarRental");

	EntityManager em = null;

	public CarModelDao(){
		em = factory.createEntityManager();
	}	
	
	// insert
	public void insertCarModel(CarModel carmodel){
		em.getTransaction().begin();
		em.persist(carmodel);
		em.getTransaction().commit();
	}

	// Read all
	public List<CarModel> getAllCarModel() {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT cm FROM CarModel cm");
		List<CarModel> lstCarModelInfo =(List<CarModel>) q.getResultList();
		em.getTransaction().commit();
		return lstCarModelInfo;
	}
	
	// Availabe CarModel
	public List<CarModel> getAvailableCarModel() {
		em.getTransaction().begin();
		Query q = em.createQuery("SELECT cm FROM CarModel cm WHERE cm.Count > 0", CarModel.class);
		List<CarModel> lstCarModelInfo =(List<CarModel>) q.getResultList();
		em.getTransaction().commit();
		return lstCarModelInfo;
	}
	

	// Update
	public boolean updateCarModel(int modelId, CarModel carmodel)
	{			
		em.getTransaction().begin();
		CarModel carmodelObj = em.find(CarModel.class, modelId);		
		carmodelObj.setCarTypeCode(carmodel.getCarTypeCode());
		carmodelObj.setCount(carmodel.getCount());
		carmodelObj.setModelName(carmodel.getModelName());
		em.merge(carmodelObj);
		em.getTransaction().commit();
		return true;
	}
	
	// Update Carmodels's count
	public boolean updateCarModel(int modelId, int count)
	{			
		em.getTransaction().begin();
		CarModel carmodelObj = em.find(CarModel.class, modelId);		
		carmodelObj.setCount(count);
		em.merge(carmodelObj);
		em.getTransaction().commit();
		return true;
	}
	
	//  removes 
	public boolean removeCarModel(int modelId){
		em.getTransaction().begin();
		CarModel carmodelObj = em.find(CarModel.class, modelId);		
		em.remove(carmodelObj);
		em.getTransaction().commit();
		return true;
	}
	
	// get by id
		public CarModel getModelById(int id){
			em.getTransaction().begin();
			CarModel modelObj = em.find(CarModel.class, id);
			em.getTransaction().commit();
			return modelObj;
		}

	public static void main(String[] args) {

	}

}
