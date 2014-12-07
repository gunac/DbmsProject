package api;


import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
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
	
	@GET
	@Path("/{email}")
	@Produces(MediaType.TEXT_PLAIN)
	public Customer findCustomerByEmail(@PathParam("email") String email){
		return dao.getCustomerforEmail(email);
	}
	
	@GET
	@Path("/{email}/{password}")
	@Produces(MediaType.TEXT_PLAIN)
	public Customer findCustomerById(@PathParam("id") int customerId){
		return dao.getCustomerById(customerId);
	}

	@POST
	@Path("/")
	@Consumes("application/json")
	public void CreateNewCustomer(Customer newCustomer){
		dao.insertCustomer(newCustomer);
	}
	
	@PUT
	@Path("/{id}")
	@Consumes("application/json")
	public void UpdateCustomerDetails(@PathParam("id") int customerId, Customer UpdatedCustomer){
		dao.updateCustomer(customerId, UpdatedCustomer);
	}
	
	

}
