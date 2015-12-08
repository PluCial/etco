<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="com.guidebooq.App" %>
<%
Errors errors =(Errors) request.getAttribute("errors");
%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/client/include-parts/html_head.jsp" />
	</head>
	<body class="lockscreen">
		<div class="lockscreen-wrapper">
			<jsp:include page="/client/include-parts/main_header.jsp" />
			

      		<h2 class="text-center"><i class="fa fa-warning text-yellow"></i> 500! Something went wrong.</h2>

      
			<div class="help-block text-center">
				<p>We will work on fixing that right away. Meanwhile, you may return to <a href="/"><%=App.APP_DISPLAY_NAME %> Top</a>.</p>
			</div>
			
		</div><!-- /.login-box -->
		
		<jsp:include page="/client/include-parts/main_footer.jsp" />

		<jsp:include page="/client/include-parts/html_script.jsp" />
	</body>
</html>
