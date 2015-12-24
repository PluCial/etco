<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="java.util.List" %>
<%
	User user =(User) request.getAttribute("user");
boolean isEditMode = Boolean.valueOf((String) request.getAttribute("isEditMode"));
List<SitePage> pageList =(List<SitePage>) request.getAttribute("pageList");
%>

	<!-- FOOTER COPYRIGHT -->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<p>&copy; KMS inc. All Rights Reserved.</p>
				</div>
				<div class="col-md-4">
					<div class="f-social pull-right">
						<a class="fa fa-twitter" href="#"></a>
						<a class="fa fa-facebook" href="#"></a>
						<a class="fa fa-linkedin" href="#"></a>
						<a class="fa fa-dribbble" href="#"></a>
						<a class="fa fa-google-plus" href="#"></a>
						<a class="fa fa-skype" href="#"></a>
						<a class="fa fa-behance" href="#"></a>
						<a class="fa fa-stumbleupon" href="#"></a>
						<a class="fa fa-rss" href="#"></a>
					</div>
				</div>
			</div>
		</div>
	</div>