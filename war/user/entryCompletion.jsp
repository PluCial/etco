<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.enums.*" %>
<%
	EntryType entry =(EntryType) request.getAttribute("entry");
%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/app/include-parts-simple/html_head.jsp" />
	</head>
	<body class="login-page">
		<div class="login-box">
			<div class="login-logo">
				<a href="/"><b><%=App.APP_DISPLAY_NAME %></b></a>
			</div><!-- /.login-logo -->
			
			<div class="callout callout-info">
               <h4><%=entry.getTitle() %></h4>
               <p><%=entry.getMessege() %></p>
            </div>
		</div><!-- /.login-box -->
		
		
		
		<jsp:include page="/app/include-parts-simple/main_footer.jsp" />

		<jsp:include page="/app/include-parts-simple/html_script.jsp" />
	</body>
</html>
