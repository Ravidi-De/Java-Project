/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.74
 * Generated at: 2023-05-22 07:30:25 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Reserve;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reserve_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');


String Username;
Username = (String)session.getAttribute("user_name");
System.out.println("\n Username :"+Username);




      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!-- Created By CodingLab - www.codinglabweb.com -->\r\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\r\n");
      out.write("  <head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>Resive</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"style/style.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"./style/boostrap.min.css\">\r\n");
      out.write("     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <!-- Styles of the webpage -->\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("  <div class=\"nav\">\r\n");
      out.write("    <h3 style=\"padding-left:20px ;\">User :  ");
      out.print(Username );
      out.write("</h3>\r\n");
      out.write("    <form action=\"../My_res_sv\">\r\n");
      out.write("    	<input type=\"hidden\" value=\"");
      out.print(Username );
      out.write("\" name=\"name\">\r\n");
      out.write("    	<button type=\"submit\" style=\"border: none;padding:10px 25px;border-radius: 15px;\">My Reservations</button>\r\n");
      out.write("    </form>\r\n");
      out.write("    <ul>\r\n");
      out.write("      <li><a href=\"#\">Home</a></li>\r\n");
      out.write("      <li><a href=\"../Train_res\">Trains</a></li>\r\n");
      out.write("      <li><a href=\"#contact\">Contact Us</a></li>\r\n");
      out.write("      <li><a href=\"../SignUp/login.jsp\">Log Out</a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("<!-- Resavation Form Start -->\r\n");
      out.write("<div class=\"mainContainer\">\r\n");
      out.write("\r\n");
      out.write("  <div class=\"containers\">\r\n");
      out.write("    <div class=\"title\">Reserve Now</div>\r\n");
      out.write("    <div class=\"content\">\r\n");
      out.write("      <form action=\"../insertReserve\" method=\"post\">\r\n");
      out.write("        <div class=\"user-details\">\r\n");
      out.write("          <div class=\"input-box\">\r\n");
      out.write("            <span class=\"details\">Name</span>\r\n");
      out.write("            <input type=\"text\" placeholder=\"Enter your name\" required name=\"uname\" value=\"");
      out.print(Username);
      out.write("\">\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"input-box\">\r\n");
      out.write("            <span class=\"details\">Phone Number</span>\r\n");
      out.write("            <input type=\"text\" placeholder=\"Enter your Phone NUmber\" required name=\"phone\">\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"input-box\">\r\n");
      out.write("            <span class=\"details\">Email</span>\r\n");
      out.write("            <input type=\"text\" placeholder=\"Enter your email\" required name=\"email\">\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"input-box\">\r\n");
      out.write("            <span class=\"details\">Number Of Pasangers</span>\r\n");
      out.write("            <input type=\"text\" placeholder=\"Number of Pax\" required name=\"pax\">\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"input-box\">\r\n");
      out.write("            <span class=\"details\">From</span>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            <select class=\"form-select\" aria-label=\"Default select example\" name=\"from\">\r\n");
      out.write("  			<option selected>From</option>\r\n");
      out.write(" 		 	<option value=\"Anuradhapura\">Anuradhapura</option>\r\n");
      out.write("  			<option value=\"Kurunegala\">Kurunegala</option>\r\n");
      out.write("  			<option value=\"Polgahwela\">Polgahwela</option>\r\n");
      out.write("  			<option value=\"Meerigama\">Meerigama</option>\r\n");
      out.write("  			<option value=\"Petta\">Petta</option>\r\n");
      out.write("  			<option value=\"Nuwara\">Nuwara</option>\r\n");
      out.write("  			<option value=\"Ella\">Ella</option>\r\n");
      out.write("			</select>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"input-box\">\r\n");
      out.write("            <span class=\"details\">To</span>\r\n");
      out.write("            \r\n");
      out.write("            <select class=\"form-select\" aria-label=\"Default select example\" name=\"to\">\r\n");
      out.write("  			<option selected>To</option>\r\n");
      out.write("			<option value=\"Anuradhapura\">Anuradhapura</option>\r\n");
      out.write("  			<option value=\"Kurunegala\">Kurunegala</option>\r\n");
      out.write("  			<option value=\"Polgahwela\">Polgahwela</option>\r\n");
      out.write("  			<option value=\"Meerigama\">Meerigama</option>\r\n");
      out.write("  			<option value=\"Petta\">Petta</option>\r\n");
      out.write("  			<option value=\"Nuwara\">Nuwara</option>\r\n");
      out.write("  			<option value=\"Ella\">Ella</option>\r\n");
      out.write("			\r\n");
      out.write("			\r\n");
      out.write("			</select>\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"button\">\r\n");
      out.write("          <input type=\"submit\" value=\"Reserve Now\">\r\n");
      out.write("        </div>\r\n");
      out.write("      </form>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- resavation form end -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--contact us form-->\r\n");
      out.write("<div class=\"mainContact\" id=\"contact\">\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("  <div class=\"content\">\r\n");
      out.write("    <div class=\"left-side\">\r\n");
      out.write("      <div class=\"address details\">\r\n");
      out.write("        <i class=\"fas fa-map-marker-alt\"></i>\r\n");
      out.write("        <div class=\"topic\">Address</div>\r\n");
      out.write("        <div class=\"text-one\">No 39,New Malkaduwawa</div>\r\n");
      out.write("        <div class=\"text-two\">Kurunegala</div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"phone details\">\r\n");
      out.write("        <i class=\"fas fa-phone-alt\"></i>\r\n");
      out.write("        <div class=\"topic\">Phone</div>\r\n");
      out.write("        <div class=\"text-one\">+9476 271 200</div>\r\n");
      out.write("        <div class=\"text-two\">+9496 3434 5678</div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"email details\">\r\n");
      out.write("        <i class=\"fas fa-envelope\"></i>\r\n");
      out.write("        <div class=\"topic\">Email</div>\r\n");
      out.write("        <div class=\"text-one\">Railway@gmail.com</div>\r\n");
      out.write("        <div class=\"text-two\">Sachin@gmail.com</div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"right-side\">\r\n");
      out.write("      <div class=\"topic-text\">Send us a message</div>\r\n");
      out.write("      <p>If you have any kind of a problem on our any thing pleace let us know.</p>\r\n");
      out.write("    <form action=\"#\">\r\n");
      out.write("      <div class=\"input-box\">\r\n");
      out.write("        <input type=\"text\" placeholder=\"Enter your name\">\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"input-box\">\r\n");
      out.write("        <input type=\"text\" placeholder=\"Enter your email\">\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"input-box message-box\">\r\n");
      out.write("        <input type=\"text\" name=\"\" id=\"\" placeholder=\"Enter Your Massage\">\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"button\">\r\n");
      out.write("        <input type=\"button\" value=\"Send Now\" >\r\n");
      out.write("      </div>\r\n");
      out.write("    </form>\r\n");
      out.write("  </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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