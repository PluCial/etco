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

		<header id="header-main">
		<div class="container">
			<div class="navbar yamm navbar-default">
				<div class="navbar-header">
					<button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="navbar-toggle">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a href="/+<%=user.getSiteId() %>" class="navbar-brand"><img src="/template/T001/images/basic/logo.png" width="40" alt=""/></a>
				</div>

				<div id="navbar-collapse-1" class="navbar-collapse collapse navbar-right">
					<ul class="nav navbar-nav">
						<%
                    		for(SitePage sitePage: pageList) {
                    	%>
                    	<%if(sitePage.getRole().equals("index")) { %>
                        <li><a href="/+<%=user.getSiteId() %>"><%=sitePage.getName() %><div class="arrow-up"><i class="fa fa-angle-down"></i></div></a></li>
                        <%}else { %>
                        <li><a href="/+<%=user.getSiteId() %>/<%=sitePage.getName() %>"><%=sitePage.getName() %><div class="arrow-up"><i class="fa fa-angle-down"></i></div></a></li>
                        <%} %>
                        <%} %>
                        
                        <%if(isEditMode) {%>
                        <li><a href="/user/account/addSitePage"><i class="fa fa-plus"></i></a></li>
                        <%} %>
				  </ul>
				</div>
			</div>
		</div>
	</header>