package api;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import ApplicationDao.CarModelDao;
import model.CarModel;


@Path ("/CarModel")
public class CarModelWebService {
	
	CarModelDao dao = new CarModelDao();
	
	@GET
	@Produces("application/json")
	@Path("/")
	public List<CarModel> getAllCarModel() {
		 return dao.getAllCarModel();
	}
	
	
	@POST
	@Path("/")
	@Consumes("application/json")
	public void CreateNewModel(CarModel newmodel){
		dao.insertCarModel(newmodel);		
	}
	
	
	@GET
	@Produces("application/json")
	@Path("/{id}")
	public CarModel GetCarModelById(@PathParam("id") int id) {
		 return dao.getModelById(id);
	}
	
	
	@DELETE
	@Path("/{id}")
	public void DeleteCarModelById(@PathParam("id") int id) {
		 dao.removeCarModel(id);
	}
	
	
	@PUT
	@Path("/{id}")
	@Consumes("application/json")
	public void UpdateCarModel(@PathParam("id") int id,CarModel newmodel){
		dao.updateCarModel(id, newmodel);	
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
