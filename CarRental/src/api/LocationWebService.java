package api;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import ApplicationDao.LocationDao;
import model.Location;

@Path ("/Location")
public class LocationWebService {

	LocationDao dao = new LocationDao();
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/")
	public List<Location> getAllLocation() {
		 return dao.getAllLocation();
	}

	 

}
