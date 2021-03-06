<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="com.etco.App" %>
<%
Errors errors =(Errors) request.getAttribute("errors");
%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/app/include-parts-simple/html_head.jsp" />
	</head>
	<body class="lockscreen">
		<div class="lockscreen-wrapper">
			<jsp:include page="/app/include-parts-simple/main_header.jsp" />
			

      		<h2 class="text-center"><i class="fa fa-warning text-yellow"></i> 404! Page not found.</h2>

      
			<div class="help-block text-center">
				<p>We could not find the page you were looking for. Meanwhile, you may return to <a href="/"><%=App.APP_DISPLAY_NAME %> Top</a>.</p>
			</div>
			
		</div><!-- /.login-box -->
		
		<jsp:include page="/app/include-parts-simple/main_footer.jsp" />

		<jsp:include page="/app/include-parts-simple/html_script.jsp" />
	</body>
</html>
