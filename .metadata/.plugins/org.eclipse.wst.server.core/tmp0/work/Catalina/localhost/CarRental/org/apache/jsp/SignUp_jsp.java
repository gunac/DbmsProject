/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.55
 * Generated at: 2014-12-06 23:26:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SignUp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css\">\r\n");
      out.write("<script src=\"//code.jquery.com/jquery-1.10.2.js\"></script>\r\n");
      out.write("<script src=\"//code.jquery.com/ui/1.11.2/jquery-ui.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/resources/demos/style.css\">\r\n");
      out.write("<script>\r\n");
      out.write("$(function() {\r\n");
      out.write("\t$(\"#dateofbirth\").datepicker({ \r\n");
      out.write("\t\tchangeMonth: true,\r\n");
      out.write("\t    changeYear: true,\r\n");
      out.write("\t\tdateFormat: \"yy-mm-dd\" }).val()\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function createNewUserJSONObj(){\r\n");
      out.write("\r\n");
      out.write("$(function() {\r\n");
      out.write("\t\r\n");
      out.write("\tvar newCustomer = {\r\n");
      out.write("\t\t\t\"customerId\": 2, \r\n");
      out.write("\t\t\t\"name\":$(\"#name\").val(), \r\n");
      out.write("\t\t\t\"dob\":$(\"#dateofbirth\").val(), \r\n");
      out.write("\t\t\t\"email\": $(\"#email\").val(), \r\n");
      out.write("\t\t\t\"password\": $(\"#pwd\").val(), \r\n");
      out.write("\t\t\t\"licenseNo\": $(\"#licenseno\").val(), \r\n");
      out.write("\t\t\t\"roleId\": 2};\r\n");
      out.write("\t\r\n");
      out.write("\tcreateCustomer(newCustomer);\r\n");
      out.write("\talert(\"Created New Customer\");\r\n");
      out.write("});\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function createCustomer(customer){\r\n");
      out.write("\t\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl: \"http://localhost:8080/CarRental/api/Customer\",\r\n");
      out.write("\t\ttype:\"post\",\r\n");
      out.write("\t\tdata: JSON.stringify(customer),\r\n");
      out.write("\t\tdataType: \"json\",\r\n");
      out.write("\t\tcontentType: \"application/json\",\r\n");
      out.write("\t\tsuccess: function(response){\r\n");
      out.write("\t\t\tconsole.log(response);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t})\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<title>SignUp Page - Customer</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("<h1 class=\"text-center\"><u>BEST CAR RENTALS</u></h1>\r\n");
      out.write("  \t<h3><em><u>Sign Up Page</u></em></h3>\r\n");
      out.write("\t\t<form role=\"SignUpPage-form\">\r\n");
      out.write("        <p>Enter your personal information</p>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("          <label for=\"name\">Name:</label>\r\n");
      out.write("          <input type=\"text\" class=\"form-control\" id=\"name\" placeholder=\"Enter name\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("        <label for=\"Pickupdate\">Date Of Birth</label>\r\n");
      out.write("          <input type=\"text\" class=\"form-control\" id=\"dateofbirth\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("          <label for=\"licenseno\">Driver's License No:</label>\r\n");
      out.write("          <input type=\"text\" class=\"form-control\" id=\"licenseno\" placeholder=\"Enter Driver's License No\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("          <label for=\"email\">Email:</label>\r\n");
      out.write("          <input type=\"text\" class=\"form-control\" id=\"email\" placeholder=\"Enter email\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"form-group\">\r\n");
      out.write("          <label for=\"pwd\">Password:</label>\r\n");
      out.write("          <input type=\"password\" class=\"form-control\" id=\"pwd\" placeholder=\"Enter password\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <button id=\"submitnewuser\" class=\"btn btn-primary\" onClick=\"createNewUserJSONObj()\">Submit</button>\r\n");
      out.write("   </form>\r\n");
      out.write("   </div>\r\n");
      out.write("    <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
