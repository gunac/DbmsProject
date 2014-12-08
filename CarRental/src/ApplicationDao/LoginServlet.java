package ApplicationDao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;

@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		int userId = 0 ;
		String useremail = null;
		String username = null;
		String customerId = null;
		
		System.out.println("Hello from Login Servlet " + email + " "  + password);
		
		CustomerDao dao = new CustomerDao();
		
			Customer customer = dao.getCustomerByEmailandPassword(email, password);
			if(customer != null){
				userId = customer.getCustomerId();
				customerId = String.valueOf(userId);
				useremail = customer.getEmail();
				username = customer.getName();
			}
		
		
		if(customer == null)
		{
			request.setAttribute("customer", null);
			request.setAttribute("errorMessage", "Invalid email or password");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		}
		else
		{
			if(customer.getRoleId() == 2)
			{
				HttpSession session = request.getSession();
				session.setAttribute("customerId", userId);
				session.setAttribute("useremail", useremail);
				session.setAttribute("username", username);
				//setting session to expiry in 30 mins
				session.setMaxInactiveInterval(30*60);
				Cookie customercookie = new Cookie("customerId", customerId);
				customercookie.setMaxAge(30*60);
				response.addCookie(customercookie);
				
				request.setAttribute("customer", customer);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/HomePage.jsp");
				//dispatcher.forward(request, response);
			   response.sendRedirect("/CarRental/HomePage.jsp");
			}
			else
				if(customer.getRoleId() == 1){
					HttpSession session = request.getSession();
					session.setAttribute("customerId", customerId);
					session.setAttribute("useremail", useremail);
					session.setAttribute("username", username);
					//setting session to expiry in 30 mins
					
					session.setMaxInactiveInterval(30*60);
					Cookie customercookie = new Cookie("customerId", customerId);
					customercookie.setMaxAge(30*60);
					response.addCookie(customercookie);
					
					request.setAttribute("customer", customer);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPage.jsp");
					//dispatcher.forward(request, response);
					response.sendRedirect("/CarRental/AdminPage.jsp");
				}
		}
	}


}
