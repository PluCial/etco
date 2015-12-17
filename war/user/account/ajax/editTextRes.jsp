<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="org.slim3.util.StringUtil" %>
<%@ page import="com.etco.model.TextRes" %>
<%@ page import="com.etco.Utils" %>
<%
String editType = (String) request.getAttribute("editType");
String objectType = (String) request.getAttribute("objectType");
String parentKey = (String) request.getAttribute("parentKey");
String resId = (String) request.getAttribute("resId");

TextRes textRes = (TextRes) request.getAttribute("textRes");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<style>
		.modal-body input, .modal-body textarea {
			color: #555;font-size: 16px;
		}
	</style>
</head>
<body>
	<div class="modal-header">
		<div class="pull-right">
			<button class="btn btn-box-tool btn-sm" data-dismiss="modal"><i class="fa fa-times"></i></button>
		</div>
		<h4 class="modal-title"><i class="fa fa-pencil-square-o"></i> テキストの修正</h4>
	</div><!-- /modal-header -->
    <form id="resources-form">
		<div class="modal-body">
			
				<%if(editType.equals("shortText")) { %>
				<input type="text" name="content" class="form-control" style="height: 40px;" value="<%=textRes == null ? "" : textRes.getContent().getValue() %>" />
				<%}else if(editType.equals("longText")) { %>
				<textarea name="content" class="form-control" rows="10"><%=textRes == null ? "" : textRes.getContent().getValue() %></textarea>
				<%} %>
		</div><!-- /modal-body -->
		<div class="modal-footer">
			<button id="text-resources-submit-button" type="button" class="btn btn-primary btn-sm">変更</button>
		</div>	<!-- /modal-footer -->
		<input type="hidden" name="objectType" value="<%=objectType %>" />
		<input type="hidden" name="parentKey" value="<%=parentKey %>" />
		<input type="hidden" name="resId" value="<%=resId %>" />
		<input type="hidden" name="resourcesKey" value="<%=Utils.getResKeyString(parentKey, resId) %>" />
	</form>
</body>
</html>