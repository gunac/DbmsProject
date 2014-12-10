package ApplicationDao;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;

@WebServlet(name = "SignUp", urlPatterns = { "/SignUp" })
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		String name = request.getParameter("name");
		String licenseno = request.getParameter("licenseno");
		String dateofbirth = request.getParameter("dateofbirth");
		System.out.println(dateofbirth + "From Sign Up Servlet");
		Date dob = new Date();
		
		DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		try {
			dob = formatter.parse(dateofbirth);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		int userId = 0 ;
		String useremail = null;
		String username = null;
		String customerId = null;
		int roleid = 2;
		
		Customer newcustomer = new Customer(name, dob, email, password,licenseno, 2);
		CustomerDao dao = new CustomerDao();
		
			dao.insertCustomer(newcustomer);
			
			CustomerDao newdao = new CustomerDao();
			Customer customer = newdao.getCustomerByEmailandPassword(email, password);
			
			if(customer != null){
				userId = customer.getCustomerId();
				customerId = String.valueOf(userId);
				useremail = customer.getEmail();
				username = customer.getName();
				roleid = customer.getRoleId();
			}
			
			if(customer == null)
			{
				request.setAttribute("customer", null);
				request.setAttribute("errorMessage", "Email account already exists! ");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
			else
			{
		
				HttpSession session = request.getSession();
				session.setAttribute("customerId", userId);
				session.setAttribute("useremail", useremail);
				session.setAttribute("username", username);
				session.setAttribute("roleid", roleid);
				//setting session to expiry in 30 mins
				session.setMaxInactiveInterval(30*60);
				Cookie customercookie = new Cookie("customerId", customerId);
				customercookie.setMaxAge(30*60);
				response.addCookie(customercookie);
				request.setAttribute("customer", customer);
			   response.sendRedirect("/CarRental/HomePage.jsp");
			}
		}
	}


