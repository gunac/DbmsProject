package api;


import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import ApplicationDao.CustomerDao;
import model.Customer;

// api/SignUp
@Path ("/Customer")
public class CustomerWebService {
	
CustomerDao dao = new CustomerDao();
	
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Customer> getallCustomers(){
		return dao.getAllCustomer();
	}
	
	@GET
	@Path("/{email}/{password}")
	@Produces(MediaType.TEXT_PLAIN)
	public Customer findCustomerByEmailAndPassword(@PathParam("email") String email,
												   @PathParam("password") String password){
		return dao.getCustomerByEmailandPassword(email, password);
	}

	@POST
	@Path("/")
	@Consumes("application/json")
	public String CreateNewCustomer(Customer newCustomer){
		dao.insertCustomer(newCustomer);
		return "hello";
	}

}
