/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.74
 * Generated at: 2023-05-22 07:12:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin.UpdateUsers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import Updateusers.Current_users;

public final class CurrentUsers_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("Updateusers.Current_users");
    _jspx_imports_classes.add("java.util.ArrayList");
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

      out.write("\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Current Users</title>\r\n");
      out.write("<!-- Boostrapp CDN link -->\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ\" crossorigin=\"anonymous\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <nav class=\"navbar navbar-expand-lg bg-body-tertiary\">\r\n");
      out.write("			  <div class=\"container-fluid\">\r\n");
      out.write("			    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("			      <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("			        <li class=\"nav-item\">\r\n");
      out.write("			          <a class=\"nav-link active\" aria-current=\"page\" href=\"Admin/UpdateUsers/UpdateUsers.jsp\">Back</a>\r\n");
      out.write("			        </li>\r\n");
      out.write("			      </ul>\r\n");
      out.write("			    </div>\r\n");
      out.write("			  </div>\r\n");
      out.write("			</nav>\r\n");
      out.write("\r\n");
      out.write("	<div class=\"trains\" id=\"trains\">\r\n");
      out.write("  <h1 style=\"padding-top: 10px;\"><center> Current Users </center></h1>  \r\n");
      out.write("  <br>\r\n");
      out.write("  <hr style=\"border: 2px solid #000000;\">\r\n");
      out.write("  <br>\r\n");
      out.write("  \r\n");
      out.write("  ");
 ArrayList allres = (ArrayList)request.getAttribute("current_emp"); 
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  <table class=\"table table-striped table-hover\">\r\n");
      out.write("  <thead>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th scope=\"col\">Emp No</th>\r\n");
      out.write("      <th scope=\"col\">Emp name</th>\r\n");
      out.write("      <th scope=\"col\">Emp Password</th>\r\n");
      out.write("      <th scope=\"col\">Emp Email</th>\r\n");
      out.write("      <th scope=\"col\">Emp Phone</th>\r\n");
      out.write("      <th scope=\"col\">Delete</th>\r\n");
      out.write("      <th scope=\"col\">Update</th>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </thead>\r\n");
      out.write("  <tbody>\r\n");
      out.write("  \r\n");
      out.write("  ");
for (int i = 0;i<allres.size();i++){ 
      out.write("\r\n");
      out.write("  ");
Current_users cur = (Current_users)allres.get(i); 
      out.write("\r\n");
      out.write("    <tr> \r\n");
      out.write("      <td>");
      out.print(cur.getUdi() );
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(cur.getUname() );
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(cur.getUemail() );
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(cur.getUpassword() );
      out.write("</td>\r\n");
      out.write("      <td>");
      out.print(cur.getuPnum() );
      out.write("</td>\r\n");
      out.write("      <td>\r\n");
      out.write("      	<form action=\"Delete_use_sev\">\r\n");
      out.write("      	<input type=\"hidden\" value=\"");
      out.print(cur.getUdi());
      out.write("\" name=\"uid\">\r\n");
      out.write("      	<button type=\"submit\" class=\"btn btn-danger\">Delete</button>\r\n");
      out.write("      	</form>\r\n");
      out.write("      </td>\r\n");
      out.write("      <td>\r\n");
      out.write("      	<form action=\"Admin/UpdateUsers/Update_users.jsp\" method=\"get\">\r\n");
      out.write("      	<input type=\"hidden\" value=\"");
      out.print(cur.getUdi());
      out.write("\"  name=\"id\">\r\n");
      out.write("      	<input type=\"hidden\" value=\"");
      out.print(cur.getUname());
      out.write("\"  name= \"name\">\r\n");
      out.write("      	<input type=\"hidden\" value=\"");
      out.print(cur.getUemail());
      out.write("\"  name=\"email\">\r\n");
      out.write("      	<input type=\"hidden\" value=\"");
      out.print(cur.getUpassword());
      out.write("\" name=\"password\">\r\n");
      out.write("      	<input type=\"hidden\" value=\"");
      out.print(cur.getuPnum());
      out.write("\" name=\"phone\">\r\n");
      out.write("      	<button type=\"submit\" class=\"btn btn-success\">Update</button>\r\n");
      out.write("      	</form>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    \r\n");
      out.write("  ");
} 
      out.write("\r\n");
      out.write("  </tbody>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("  <hr style=\"border: 2px solid #000000;\">\r\n");
      out.write("  <br>\r\n");
      out.write("</div>\r\n");
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
