package api;

import javax.ws.rs.PUT;
import javax.ws.rs.Path;


import ApplicationDao.RentalDao;


@Path ("/Rental")
public class RentalWebService {
	
	RentalDao dao = new RentalDao();

	@PUT
	@Path("/")
	public void CreateNewModel(){
		dao.insertRentalInfoForAllLocation();		
	}

}
