package Jaxb;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import model.CarType;
import model.CarTypeInstances;

import ApplicationDao.*;
public class CarTypesJaxb {


	public void createCarTpeXml(){

		CarType carObj = new CarType();
		carObj.setCarTypeCode("Gu");
		carObj.setCarTypeName("NAME");
		carObj.setSeatingInfo("2 seats only");



		CarType carObj1 = new CarType();
		carObj1.setCarTypeCode("DD");
		carObj1.setCarTypeName("NAME");
		carObj1.setSeatingInfo("2 seats only");

		List<CarType> lstcarTypeObj =  new ArrayList<CarType>();

		lstcarTypeObj.add(carObj);
		lstcarTypeObj.add(carObj1);

		CarTypeInstances lstcarobj = new CarTypeInstances();
		lstcarobj.setCarTypes(lstcarTypeObj);

		try
		{
			JAXBContext context = JAXBContext.newInstance(CarTypeInstances.class);
			Marshaller m = context.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
			m.marshal(lstcarobj, System.out);

			File f = new File("/Users/Guna/eclipseworkspace/DbmsProject/CarRental/src/OutputFromClassObject.xml");
			FileWriter w = new FileWriter(f);
			w.write("");
			m.marshal(lstcarobj, f);


		} catch (Exception  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void createCarTypeObjFromXML()
	{
		try {

			// Convert XML to JAVA representation
			File file = new File("/Users/Guna/eclipseworkspace/DbmsProject/CarRental/WebContent/allCarTypes-out.xml");

			JAXBContext context;

			CarTypeInstances carTypeInstances =null;
			context = JAXBContext.newInstance(CarTypeInstances.class);
			Unmarshaller unmarshaller =  context.createUnmarshaller();
			carTypeInstances =(CarTypeInstances) unmarshaller.unmarshal(file);
			
			CarTypeDao dao = new CarTypeDao();
			dao.createCarType(carTypeInstances);

			System.out.println("Obj created");


		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public static void main(String[] args) {

		CarTypesJaxb jb = new CarTypesJaxb();
		//jb.createCarTpeXml();
		
		// Inserts CarType data into XML CALL ONLY ONCE!
	    jb.createCarTypeObjFromXML();
		System.out.println("check xml file");

	}

}
