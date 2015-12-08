<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%
User client =(User) request.getAttribute("client");
boolean isClientLogged = Boolean.valueOf((String) request.getAttribute("isClientLogged"));
%>

		<header id="header" class="navbar-fixed-top header6" role="banner">
			<div class="container">
				<div class="row">
					<!-- Logo start -->
					<div class="navbar-header">
					    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					    </button>
					    <h1 class="navbar-brand">
					    	<a href="/" ><img src="/images/logo/logo-reversal.png" alt="<%=App.APP_DISPLAY_NAME %>"></a>
					    </h1>
					</div><!--/ Logo end -->
					
					<nav class="collapse navbar-collapse clearfix" role="navigation">
						<ul class="nav navbar-nav navbar-right">
							<%if(isClientLogged) { %>
							<li><a href="/client/logout"><i class="fa fa-sign-out"></i> ログアウト</a></li>
							<%}else { %>
		                    <li><a href="/client/register"><i class="fa fa-plus"></i> 新規登録</a></li>
	            			<li><a href="/client/login"><i class="fa fa-sign-in"></i> ログアウト</a></li>
	            			<%} %>
						</ul>
					</nav><!--/ Navigation end -->
					
				</div><!--/ Row end -->
			</div><!--/ Container end -->
		</header>