package api;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
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

	@POST
	@Path("/")
	@Consumes("application/json")
	public void CreateNewLocation(Location newlocation){
		dao.insertLocation(newlocation);		
	}
	
	@DELETE
	@Path("/{name}")
	public void DeleteLocation(@PathParam("name") String loc) {
		 dao.removeLocation(loc);
	}
	 

}
