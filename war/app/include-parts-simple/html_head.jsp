<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%
String applecationName = (String) request.getAttribute("applecationName");
String pageTitle = (String) request.getAttribute("pageTitle");
%>

		<meta charset="UTF-8">
		<title><%=applecationName == null ? "" : applecationName %><%=pageTitle == null ? "" : " | " + pageTitle %></title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<!-- Bootstrap 3.3.4 -->
		<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<!-- Font Awesome Icons -->
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<!-- Theme style -->
		<link href="/app/AdminLTE/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
		<!-- iCheck -->
		<link href="/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
		<!-- Favicons
		================================================== -->
		<link rel="icon" href="/favicon-32x32.png" type="image/x-icon" />
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/favicon-144x144.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/favicon-72x72.png">
		<link rel="apple-touch-icon-precomposed" href="/favicon-54x54.png">
    
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

	