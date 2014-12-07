package ApplicationDao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;

@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("#email");
		String password = request.getParameter("#pwd");
		
		System.out.println("Hello from Login Servlet " + email + " "  + password);
		
		CustomerDao dao = new CustomerDao();
		
		Customer customer = dao.getCustomerByEmailandPassword(email, password);
		
		if(customer == null)
		{
			response.sendRedirect("/CarRental/login.jsp");
		}
		else
		{
			request.setAttribute("customer", customer);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/HomePage.jsp");
			dispatcher.forward(request, response);
			response.sendRedirect("/CarRental/HomePage.jsp");
		}
	}


}
