<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.guidebooq.App" %>
<%@ page import="com.guidebooq.enums.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.guidebooq.model.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="org.slim3.util.StringUtil" %>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%
Spot spot = (Spot) request.getAttribute("spot");
Errors errors =(Errors) request.getAttribute("errors");
String detail = (String) request.getAttribute("detail");
String selectItemType = (String) request.getAttribute("attribute");
%>
<!DOCTYPE html>
<html lang="<%=spot.getLangUnit().getLang() %>">
<head>
	<jsp:include page="/spot/include-parts/html_head.jsp" />
	<link href="/plugins/cropper/cropper.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/plugins/silviomoreto/dist/css/bootstrap-select.css">
	<style>
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
    height: 500px;
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
	
<body>

	<div class="body-inner">
		<!-- Header start -->
		<jsp:include page="/spot/include-parts/main_header.jsp" />
		<!-- Header end -->

		<!-- Slider start -->
		<jsp:include page="/spot/include-parts/spot_sub_page_top.jsp" />
    	<!--/ Slider end -->


		<!-- Portfolio item start -->
		<section id="portfolio-item">
			<div class="container">
				<form action="/spot/secure/itemAddEntry" method="post" enctype="multipart/form-data">
				
				<!-- Portfolio item row start -->
				<div class="row">
					<!-- Portfolio item slider start -->
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
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

					</div>
					<!-- Portfolio item slider end -->

					<!-- sidebar start -->
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="sidebar">
							<div class="portfolio-desc">
									<div class="form-group ${f:errorClass('itemName','has-error')}">
										<%if (errors.containsKey("itemName")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.itemName}</label>
										<%} %>
										<input type="text" class="form-control" ${f:text("itemName")} placeholder="アイテム名"/>
									</div>
									
									<div class="form-group ${f:errorClass('attribute','has-error')}">
										<%if (errors.containsKey("attribute")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.attribute}</label>
										<%} %>
										<select name="attribute" class="form-control selectpicker" title='関連するカテゴリを選択'>
											<%
												for(SpotAttribute type: SpotAttribute.values()) {
											%>
											<option data-icon="<%=type.getIconClass() %>" value="<%=type.toString() %>" <%=selectItemType != null && selectItemType.equals(type.toString()) ? "selected" : "" %>><%=type.getName() %></option>
											<%} %>
										</select>
									</div>

									<div class="form-group ${f:errorClass('price','has-error')}">
										<%if (errors.containsKey("price")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.price}</label>
										<%} %>
										<div class="input-group">
											<span class="input-group-addon"><%=spot.getCountry().getCurrencie().getSymbol() %></span>
											<input type="text" class="form-control"  ${f:text("price")} style="height:40px;text-align: right;" placeholder="税抜き金額">
											<span class="input-group-addon">.00</span>
										</div>
									</div>
								
									<div class="form-group ${f:errorClass('detail','has-error')}">
										<%if (errors.containsKey("detail")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.detail}</label>
										<%} %>
										<textarea name="detail" class="form-control" rows="10" placeholder="アイテム説明"><%=detail == null ? "" : detail %></textarea>
									</div>
									
									<input type="hidden" name="spotId" value="<%=spot.getSpotId() %>" />
									<input type="hidden" name="imageX" id="imageX" value="" />
									<input type="hidden" name="imageY" id="imageY" value="" />
									<input type="hidden" name="imageHeight" id="imageHeight" value="" />
									<input type="hidden" name="imageWidth" id="imageWidth" value="" />
							
									<p><button type="submit" class="project-btn btn btn-primary">保存して追加</button></p>

							</div>
						</div>
					</div>
					<!-- sidebar end -->
				</div><!-- Portfolio item row end -->
				</form>
			</div><!-- Container end -->
		</section><!-- Portfolio item end -->

		<div class="gap-40"></div>
	

		<!-- Footer start -->
		<jsp:include page="/spot/include-parts/main_footer.jsp" />
		<!--/ Footer end -->
	
	</div><!-- Body inner end -->
	
	<!-- javaScript start -->
	<jsp:include page="/spot/include-parts/html_script.jsp" />
    <script src="/plugins/cropper/cropper.min.js" type="text/javascript"></script>
    <script src="/spot/js/item-add.js" type="text/javascript"></script>
    <script src="/plugins/silviomoreto/dist/js/bootstrap-select.js"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
    <!-- javaScript end -->
</body>
</html>
