package api;

import java.util.List;

import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import model.CarType;
import ApplicationDao.CarTypeDao;

@Path ("/CarType")
public class CarTypeWebService {
	
CarTypeDao dao = new CarTypeDao();
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/")
	public List<CarType> getAllCarTypeNames() {
		 return dao.getAllCarTypes();
	}

}
