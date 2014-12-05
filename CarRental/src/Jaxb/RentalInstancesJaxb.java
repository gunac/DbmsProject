package Jaxb;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import model.CarTypeInstances;
import model.RentalInstances;
import ApplicationDao.CarTypeDao;
import ApplicationDao.RentalDao;

public class RentalInstancesJaxb {

	
	public void createRentalInstancesFromXML()
	{
		try {

			// Convert XML to JAVA representation
			File file = new File("/Users/Guna/eclipseworkspace/DbmsProject/CarRental/WebContent/rentalInformation-out.xml");

			JAXBContext context;

			RentalInstances rentalInstances =null;
			context = JAXBContext.newInstance(RentalInstances.class);
			Unmarshaller unmarshaller =  context.createUnmarshaller();
			rentalInstances =(RentalInstances) unmarshaller.unmarshal(file);
			
			RentalDao dao = new RentalDao();
			dao.insertRentalInstances(rentalInstances);

			System.out.println("Obj created");


		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		RentalInstancesJaxb j = new RentalInstancesJaxb();
		j.createRentalInstancesFromXML();
		System.out.println("Check rental database");

	}

}
