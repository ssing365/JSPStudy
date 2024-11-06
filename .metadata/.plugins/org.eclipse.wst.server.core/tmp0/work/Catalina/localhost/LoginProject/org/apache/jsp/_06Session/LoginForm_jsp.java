/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.31
 * Generated at: 2024-11-04 09:04:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._06Session;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class LoginForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
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

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
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

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Session</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<!-- \r\n");
      out.write("	JSP에서 include는 다음 2가지 방식이 있다.\r\n");
      out.write("	1. include 지시어를 이용하는 방법(주석처리함)\r\n");
      out.write("	2. 액션태그를 이용한 방법\r\n");
      out.write("	  -->\r\n");
      out.write("	");
      out.write('\r');
      out.write('\n');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Common/Link.jsp", out, false);
      out.write("\r\n");
      out.write("	<h2>로그인 페이지</h2>\r\n");
      out.write("	<!-- \r\n");
      out.write("	로그인을 위해 폼값을 전송한 후 만약 조건에 맞는 회원정보가 없다면\r\n");
      out.write("	request영역에 에러메시지를 저장한 후 현재페이지로 forward한다.\r\n");
      out.write("	request영역은 forward된 페이지까지는 공유되므로 아래에서 메시지를 출력할 수 있다. -->\r\n");
      out.write("	<span style=\"color: red; font-size: 1.2em\"> \r\n");
      out.write("		");
      out.print(request.getAttribute("LoginErrMsg") == null ? 
				"" : request.getAttribute("LoginErrMsg"));
      out.write("\r\n");
      out.write("	</span>\r\n");
      out.write("	");

	/* session영역에 해당 속성값이 있는지 확인한다. 즉, session영역에 저장된 속성이 없다면
	로그아웃 상태이므로 로그인 폼을 웹브라우저에 출력해야한다.*/
	if (session.getAttribute("UserId") == null){ //로그인 상태 확인
		//로그아웃 상태
		
      out.write("\r\n");
      out.write("	<script>\r\n");
      out.write("	/* \r\n");
      out.write("	로그인 폼의 입력값을 서버로 전송하기 전에 검증하기 위해 정의한 함수.\r\n");
      out.write("	입력값이 빈값인지 확인하여 경고창 출력.*/\r\n");
      out.write("	function validateForm(form){\r\n");
      out.write("		/* \r\n");
      out.write("		매개변수로 전달된 form태그의 DOM을 통해 하위태그인 input에 접근할 수 있다.\r\n");
      out.write("		접근시에는 name속성값을 사용하고, value는 입력된 값을 가리키게된다.\r\n");
      out.write("		*/\r\n");
      out.write("		if(!form.uid.value){\r\n");
      out.write("			//입력된 값이 없다면 경고창을 띄우고..\r\n");
      out.write("			alert(\"아이디를 입력하세요.\");\r\n");
      out.write("			//입력을 위해 포커스를 이동하고..\r\n");
      out.write("			form.uid.focus();\r\n");
      out.write("			//submit이벤트핸들러쪽으로 false를 반환한다. -> 서버로 전송은 취소(중단)된다.\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		if(form.upw.value == \"\"){\r\n");
      out.write("			alert(\"패스워드를 입력하세요.\");\r\n");
      out.write("			form.upw.focus(); //포커스 이동 개좋은데\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("	}\r\n");
      out.write("	</script>\r\n");
      out.write("	<!-- \r\n");
      out.write("	로그인폼에서 아이디, 비번을 입력 후 submit을 누르면 action에 설정된 경로로 폼값이 전송된다.\r\n");
      out.write("	submit버튼을 누를 때 이벤트핸들러를 통해 JavaScript함수를 호출하는데, \r\n");
      out.write("	이때 전달되는 인수 this는 <form>태그의 DOM을 가리킨다. -->\r\n");
      out.write("	<form action=\"LoginProcess.jsp\" method =\"post\" name = \"loginFrm\"\r\n");
      out.write("	onsubmit =\"return validateForm(this);\">\r\n");
      out.write("	아이디 : <input type=\"text\" name=\"uid\" /><br/>\r\n");
      out.write("	패스워드 : <input type=\"text\" name=\"upw\" /><br/>\r\n");
      out.write("	<input type=\"submit\" value=\"로그인하기\" />\r\n");
      out.write("	</form>\r\n");
      out.write("	");

	} else{ 
	
      out.write("\r\n");
      out.write("		");
      out.print( session.getAttribute("UserName") );
      out.write(" 회원님, 로그인하셨습니다.<br/>\r\n");
      out.write("		<a href=\"Logout.jsp\">[로그아웃]</a>\r\n");
      out.write("	");

	}
      out.write("\r\n");
      out.write("	\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
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
