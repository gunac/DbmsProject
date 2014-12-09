package ApplicationDao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import Jaxb.CarTypesJaxb;
import Jaxb.RentalInstancesJaxb;
import carrental.CarRentalWebServiceClient;
import model.Rental;
import model.RentalInstances;
import model.Location;

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


	public void insertRentalInfoForAllLocation(){
		LocationDao dao = new LocationDao();
		CarRentalWebServiceClient carApi = new CarRentalWebServiceClient();
		RentalInstancesJaxb rentalJaxb = new RentalInstancesJaxb();
		CarTypesJaxb carTypeJaxb = new CarTypesJaxb();


		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/yyyy");

		/// Add one day
		Calendar cal = Calendar.getInstance();
		cal.setTime(dNow);
		cal.add(Calendar.DATE, 1);
		Date tomo = cal.getTime();
		cal.setTime(tomo);
		cal.add(Calendar.DATE, 1);
		Date dayafter = cal.getTime();

		String startdate = ft.format(tomo).toString();
		String enddate = ft.format(dayafter).toString();
		String pickuptime ="10:00";
		String dropofftime = "10:30";
		List<Location> lstLoc = dao.getAllLocation();
		/*// Generate CarType XML data from output.xml and write it to allCarType-out.xml
		carApi.createAllCarTypeXML();
		// Write cartype information to database
		carTypeJaxb.insertCarTypeFromXml();*/
		for(Location l : lstLoc){
			// Fetch data from api for given location and store it in output XML
			carApi.getDataFromApiAndWriteToXML(startdate,enddate,pickuptime,dropofftime,l.getName());
			// Generate Rental XML data from output.xml and write it to rentalInformation-out.xml
			carApi.getRentalInformationFromApi();

			// Write from XML to DATABASE by calling JAXB
			rentalJaxb.createRentalInstancesFromXML();
		}
	}

	public static void main(String[] args) {
		RentalDao rentalDao = new RentalDao();
		rentalDao.insertRentalInfoForAllLocation();
	}
}
