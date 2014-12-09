package api;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import ApplicationDao.OrdersDao;
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

}
