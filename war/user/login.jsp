<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.enums.*" %>
<%
String requestUrl =(String) request.getAttribute("requestUrl");
Errors errors =(Errors) request.getAttribute("errors");
%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/app/include-parts-simple/html_head.jsp" />
	</head>
	<body class="login-page">
		<div class="login-box">
			<jsp:include page="/app/include-parts-simple/main_header.jsp" />
			
			<div class="login-box-body">
				<h4 class="login-box-msg">ログイン</h4>
				<form action="/user/loginEntry" method="post">
					<div class="form-group has-feedback ${f:errorClass('email','has-error')}">
						<%if (errors.containsKey("email")){ %>
						<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.email}</label>
						<%} %>
						<input type="email" ${f:text("email")} class="form-control" placeholder="メールアドレス" required />
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback ${f:errorClass('password','has-error')}">
						<%if (errors.containsKey("password")){ %>
						<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.password}</label>
						<%} %>
						<input type="password" ${f:text("password")} class="form-control" placeholder="パスワード" required />
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					
					<div>
              			<button type="submit" class="btn btn-primary btn-block btn-flat">ログイン</button>
            		</div><!-- /.col -->	
				</form>

				<div class="social-auth-links text-center">
					<p>- もしくは -</p>
					<a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Facebook アカウントで始める</a>
					<a href="#" class="btn btn-block btn-social btn-google-plus btn-flat"><i class="fa fa-google-plus"></i> Google+ アカウントで始める</a>
				</div>

				<a href="/user/resetPassword">パスワードをお忘れですか?</a><br>
				<a href="/user/register" class="text-center">まだアカウントをお持ちでない方はこちら</a>

			</div><!-- /.login-box-body -->
		</div><!-- /.login-box -->
		
		<jsp:include page="/app/include-parts-simple/main_footer.jsp" />

		<jsp:include page="/app/include-parts-simple/html_script.jsp" />
	</body>
</html>
