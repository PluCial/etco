<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@ page import="com.etco.App" %>
<%
String pageTitle = (String) request.getAttribute("pageTitle");
String pageDescription = (String) request.getAttribute("pageDescription");
%>

	<!-- Basic Page Needs
	================================================== -->
	<meta charset="utf-8">
    <title><%=App.APP_DISPLAY_NAME %><%=pageTitle == null ? "" : " | " + pageTitle %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

	<!-- core CSS -->
    <link href="/template/T002/css/bootstrap.min.css" rel="stylesheet">
    <link href="/template/T002/css/font-awesome.min.css" rel="stylesheet">
    <link href="/template/T002/css/animate.min.css" rel="stylesheet">
    <link href="/template/T002/css/prettyPhoto.css" rel="stylesheet">
    <link href="/template/T002/css/main.css" rel="stylesheet">
    <link href="/template/T002/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/template/T002/js/html5shiv.js"></script>
    <script src="/template/T002/js/respond.min.js"></script>
    <![endif]-->

	