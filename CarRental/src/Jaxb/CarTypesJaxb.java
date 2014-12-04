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
import model.ListCarTypes;

public class CarTypesJaxb {
	
	
	public void createXml(){
		
		CarType carObj = new CarType();
		carObj.setCarTypeCode("AAA");
		carObj.setCarTypeName("NAME");
		carObj.setSeatingInfo("2 seats only");
		
		

		CarType carObj1 = new CarType();
		carObj1.setCarTypeCode("AAA");
		carObj1.setCarTypeName("NAME");
		carObj1.setSeatingInfo("2 seats only");
		
		List<CarType> lstcarTypeObj =  new ArrayList<CarType>();
		
		lstcarTypeObj.add(carObj);
		lstcarTypeObj.add(carObj1);
		
		
		try
		{
			JAXBContext context = JAXBContext.newInstance(ListCarTypes.class);
			Marshaller m = context.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
			m.marshal(lstcarTypeObj, System.out);

			File f = new File("/jpa/src/OutputFromClassObject.xml");
			FileWriter w = new FileWriter(f);
			w.write("");
			m.marshal(lstcarTypeObj, f);


		} catch (Exception  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		
		CarTypesJaxb jb = new CarTypesJaxb();
		jb.createXml();
	 
		/*try {

			// Convert XML to JAVA representation
			File file = new File("/Users/Guna/eclipseworkspace/DbmsProject/CarRental/WebContent/allCarTypes-out.xml");

			JAXBContext context;
			
			
			
			
			

			context = JAXBContext.newInstance(ListCarTypes.class);
			Unmarshaller unmarshaller =  context.createUnmarshaller();
			ListCarTypes lstcarTypeObj = (ListCarTypes) unmarshaller.unmarshal(file);
			 

		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}

}
