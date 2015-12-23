<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="org.slim3.util.StringUtil" %>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="java.util.Map" %>
<%
Errors errors =(Errors) request.getAttribute("errors");
User user =(User) request.getAttribute("user");

String objectType = (String) request.getAttribute("objectType");
String parentKey = (String) request.getAttribute("parentKey");
String resId = (String) request.getAttribute("resId");
%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/user/account/include-parts/html_head.jsp" />
		<link href="/plugins/cropper/cropper.min.css" rel="stylesheet">
		<style>
	.content {
    	margin-top: 2em;
	}
	.form-group,  .portfolio-slider{
		margin-bottom: 25px;
	}
	.has-error label.control-label {
		color:#ee3b24;
	}
	input.form-control, textarea.form-control {
		color: #000;
	}
	.icheckbox_square-blue {
    background-position: 0 0;
	}
	.icheckbox_square-blue, .iradio_square-blue {
    display: inline-block;
    vertical-align: middle;
    margin: 0;
    padding: 0;
    width: 22px;
    height: 22px;
    background: url(/plugins/iCheck/square/blue.png) no-repeat;
    border: none;
    cursor: pointer;
}

.icheckbox_square-blue.checked {
    background-position: -48px 0;
}

.img-container {
    height: 400px;
    width: 100%;
    max-width: 750px;
    margin-bottom: 15px;
    box-shadow: inset 0 0 5px rgba(0,0,0,.25);
    background-color: #fcfcfc;
    overflow: hidden;
}

.avatar-upload label {
    display: block;
    float: left;
    clear: left;
    width: 100px;
}

.avatar-upload input {
    display: block;
    margin-left: 110px;
}
	</style>
	</head>
	<body class="skin-blue layout-top-nav">
		<div class="wrapper">
			<jsp:include page="/user/account/include-parts/main_header.jsp" />
      
      
			<div class="content-wrapper">
				<div class="container">

					<div class="content">
<%-- 					<div class="register-logo">
						<a href="<%=PathUtils.spotPage(spot.getSpotId(), spot.getLangUnit().getLang(), isLocal, true) %>"><b><%=spot.getName() %></b></a>
					</div> --%>
					<h3 style="text-align: center;">画像を選択してください。</h3>
					
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<form action="/user/account/editGcsResEntry" method="post" enctype="multipart/form-data">
								<div class="box">
									<div class="box-body">
										<%if (errors.containsKey("uploadImage")){ %>
										<div class="${f:errorClass('uploadImage','has-error')}">
											<label class="control-label has-error" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.uploadImage}</label>
										</div>
										<%} %>
						
										<div class="avatar-wrapper"></div>
										<div class="img-container">
											<img src="">
										</div>
										<div class="avatar-upload">
											<label for="avatarInput">Local upload</label>
											<input class="avatar-input" id="inputImage" name="uploadImage" type="file" accept="image/*" />
										</div>

									</div><!-- ./box-body -->
									<div class="box-footer">
										
										<button type="submit" class="pull-right btn btn-primary"><i class="fa fa-file-image-o"></i> 変更する</button>
									</div><!-- /.box-footer -->
								
								</div><!-- /.box -->
								<input type="hidden" name="objectType" value="<%=objectType %>" />
								<input type="hidden" name="parentKey" value="<%=parentKey %>" />
								<input type="hidden" name="resId" value="<%=resId %>" />
								<input type="hidden" name="imageX" id="imageX" value="" />
								<input type="hidden" name="imageY" id="imageY" value="" />
								<input type="hidden" name="imageHeight" id="imageHeight" value="" />
								<input type="hidden" name="imageWidth" id="imageWidth" value="" />
							</form>
						</div>
					</div>
				</div>
          
				</div><!-- /.container -->
			</div><!-- /.content-wrapper -->
      
			<jsp:include page="/user/account/include-parts/main_footer.jsp" />
		</div><!-- ./wrapper -->

		<jsp:include page="/user/account/include-parts/html_script.jsp" />
		<script src="/plugins/cropper/cropper.min.js" type="text/javascript"></script>
		<script src="/app/js/item-add.js" type="text/javascript"></script>
	</body>
</html>

