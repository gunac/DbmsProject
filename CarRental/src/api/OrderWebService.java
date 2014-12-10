package api;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import ApplicationDao.OrdersDao;
import model.CarModel;
import model.Orders;


@Path ("/Orders")
public class OrderWebService {
	
	OrdersDao dao = new OrdersDao();
	
	@GET
	@Produces("application/json")
	@Path("/")
	public List<Orders> getAllOrders() {
		 return dao.getAllOrders();
	}
	
	
	@GET
	@Produces("application/json")
	@Path("/{id}")
	public List<Orders> GetOrderById(@PathParam("id") int id) {
		 return dao.getOrderByCustomerId(id);
	}
	
	@DELETE
	@Path("/{id}")
	public void DeleteOrder(@PathParam("id") int id) {
		 dao.removeOrder(id);
	}
	
//	@PUT
//	@Path("/{id}/{rentid}/{modelid}/{pickday}/{dropday}")
//	@Produces(MediaType.APPLICATION_JSON)
//	public int insertOrderintoorders(@PathParam("id") int id,@PathParam("rentid") int rentid,@PathParam("modelid") int modelid, @PathParam("pickday") String pickupday,@PathParam("dropday") String dropoffday){
//		return dao.insertOrder(id, rentid, modelid,pickupday,dropoffday);	
//	}

}
