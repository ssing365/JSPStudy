package utils;

import jakarta.servlet.jsp.JspWriter;

//자주 사용하는 JS의 함수를 클래스로 정의해둠.
public class JSFunction {
	
	/*
	 메서드 생성시 static을 통해 정적메서드로 정의하면, 해당 클래스의 인스턴스를 생성하지 않고도
	 클래스명으로 즉시 메서드를 호출할 수 있다.
	 **/
//	Java클래스에서는 JSP의 내장객체를 즉시 사용할 수 없으므로 반드시 매개변수로 전달받아 사용해야한다.
//	여기서는 웹브라우저에 문자열을 출력하기 위해 out내장객체를 JspWriter타입으로 받은 후 사용하고있다.
	public static void alertLocation(String msg, String url, JspWriter out) {

		try {
			String script = ""
					+ "<script>"
					+ " alert('"+ msg +"');"
					+" location.href='" + url + "';"
					+"</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+"<script>"
					+"alert('"+msg+"');"
					+"history.back();"
					+"</script>";
			out.println(script);
		}
		catch(Exception e) {}
	}
}