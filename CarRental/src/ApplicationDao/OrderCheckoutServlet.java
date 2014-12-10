package ApplicationDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "OrderCheckout", urlPatterns = { "/OrderCheckout" })
public class OrderCheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrdersDao dao = new OrdersDao();
		String usrid = request.getParameter("id");
		int id = Integer.parseInt(usrid);
		String rentalid = request.getParameter("rentalid");
		int rentid = Integer.parseInt(rentalid);
		String modellid = request.getParameter("modelid");
		int modelid = Integer.parseInt(modellid);
		String pickupday = request.getParameter("pickupday");
		String dropoffday = request.getParameter("dropoffday");
		String loc = request.getParameter("location");
		
			int orderid = dao.insertOrder(id, rentid, modelid,pickupday,dropoffday,loc);
			
				HttpSession session = request.getSession();
				session.setAttribute("orderid", orderid);
				//setting session to expiry in 30 mins
			   response.sendRedirect("/CarRental/OrderCheckout.jsp");
			}
		}


