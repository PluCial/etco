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
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="/template/T001/css/bootstrap.min.css" type="text/css">

	<!-- Styles -->
	<link rel="stylesheet" href="/template/T001/js/owl-carousel/owl.carousel.css">
	<link rel="stylesheet" href="/template/T001/js/owl-carousel/owl.theme.css">
	<link rel="stylesheet" href="/template/T001/js/owl-carousel/owl.transitions.css">
	<link rel="stylesheet" href="/template/T001/js/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="/template/T001/js/flexslider/flexslider.css">
	<link rel="stylesheet" href="/template/T001/js/isotope/isotope.css">
	<link rel="stylesheet" href="/template/T001/css/jquery-ui.css">
	<link rel="stylesheet" href="/template/T001/js/magnific-popup/magnific-popup.css">
	<link rel="stylesheet" href="/template/T001/css/style.css">

	<!-- Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,200,100,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Dosis:400,200,300,500,600,700,800' rel='stylesheet' type='text/css'>

	<!-- Icon Fonts -->
	<link rel="stylesheet" href="/template/T001/css/icomoon/style.css" type="text/css">
	<link rel="stylesheet" href="/template/T001/font-awesome/css/font-awesome.min.css" type="text/css">

	<!-- SKIN -->
	<link rel="stylesheet" href="/template/T001/css/color-scheme/default-blue.css" type="text/css">


	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
           <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-ajaxtransport-xdomainrequest/1.0.2/jquery.xdomainrequest.min.js"></script>      
	<![endif]-->

	