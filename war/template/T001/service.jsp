<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.etco.Utils" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
SitePage sitePage = (SitePage) request.getAttribute("sitePage");
boolean isEditMode = Boolean.valueOf((String) request.getAttribute("isEditMode"));

HashMap<String,String> pageTextResMap =(HashMap<String,String>) request.getAttribute("pageTextResMap");
HashMap<String,String> pageGcsResMap =(HashMap<String,String>) request.getAttribute("pageGcsResMap");

List<ListItem> serviceList =(List<ListItem>) request.getAttribute(ListItemType.T001_003.toString() + "ItemList");
HashMap<String,String> serviceListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T001_003.toString() + "TextMap");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<jsp:include page="/template/T001/include-parts/html_head.jsp" />
<style>
a.image-change {
	position: absolute;
	top: 10px;
	left: 10px;
}
</style>
</head>
<body class="bg-pattern10 active">
<div class="outer-wrapper boxed">

	<!-- HEADER -->
	<jsp:include page="/template/T001/include-parts/main_header.jsp" />
	<!-- /HEADER -->

	<!-- PAGE HEADER -->
	<div class="page_header" style="position: relative;">
		<%if(isEditMode) { %>
		<a  class="btn btn-default image-change"
			href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_SERVICE_001.toString()%>">
			画像の変更
		</a>
		<%}%>
		<div class="page_header_parallax" style="background-image: url(<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_SERVICE_001) %>">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3><%=sitePage.getName() %></h3>
					</div>
				</div>
			</div>
		</div>
		<div class="bcrumb-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="bcrumbs">
							<li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
							<li><%=sitePage.getName() %></li>
						</ul>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="inner-content">
		<div class="container">

			<!-- ABOUT -->
			<div class="section-about space100">
				<div class="row">
					<div class="col-md-6">
						<div style="position: relative;">
							<img src="<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_SERVICE_002) %>" class="img-responsive" alt="">
							<%if(isEditMode) { %>
							<a  class="btn btn-default image-change"
								href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_SERVICE_002.toString()%>">
								画像の変更
							</a>
							<%}%>
						</div>
					</div>
					<div class="col-md-6">
						<div>
							<h3>
								<%if(isEditMode) { %>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color: #000;"
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_SERVICE_001.toString()%>">
									<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_SERVICE_001)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_001)%></span>
								</a>
								<%}else { %>
								<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_001) %>
								<%} %>
							</h3>
							<p>
								<%if(isEditMode) { %>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color: #878787;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_SERVICE_002.toString()%>">
									<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_SERVICE_002)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_002)%></span>
								</a>
								<%}else { %>
								<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_002) %>
								<%} %>
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- SERVICES -->
			<div class="section-services2 space40">
				<div class="row">
					<div class="col-md-4">
						<h3>
							<%if(isEditMode) { %>
							<a data-toggle="modal" 
								data-backdrop="static"
								data-target="#textResModal" 
								style="color: #000;"
								href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_SERVICE_003.toString()%>">
								<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_SERVICE_003)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_003)%></span>
							</a>
							<%}else { %>
							<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_003) %>
							<%} %>
						</h3>
						<p class="space30">
							<%if(isEditMode) { %>
							<a data-toggle="modal" 
								data-backdrop="static"
								data-target="#textResModal" 
								style="color: #878787;"
								href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_SERVICE_004.toString()%>">
								<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_SERVICE_004)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_004)%></span>
							</a>
							<%}else { %>
							<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_004) %>
							<%} %>
						</p>
						
					</div>
					<!-- end section -->
					<div class="col-md-8">
						<div class="row serviceListItem">
							<%for(ListItem item: serviceList) { %>
							<div class="col-md-4 ss2-content text-center">
								<i class="icon-support"></i>
								<h4>
									<%if(isEditMode) { %>
									<a data-toggle="modal" 
										data-backdrop="static"
										data-target="#textResModal" 
										style="color:#000;"
										href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE003_001.toString()%>">
										<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE003_001) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE003_001) %></span>
									</a>
									<%}else { %>
									<span><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE003_001) %></span>
									<%} %>
								</h4>
								<p>
									<%if(isEditMode) { %>
									<a data-toggle="modal" 
										data-backdrop="static"
										data-target="#textResModal" 
										style="color:#878787;"
										href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE003_002.toString()%>">
										<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE003_002) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE003_002) %></span>
									</a>
									<%}else { %>
									<span><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE003_002) %></span>
									<%} %>
								</p>
							</div>
							<%} %>
						</div>
						
						<%if(isEditMode) { %>
				        <div class="text-center" style="margin-bottom: 30px;">
				        	<a data-target="serviceListItem" href="/user/account/ajax/addListItemEntry?listType=<%=ListItemType.T001_003 %>" class="btn btn-default addListItem">追加</a>
				        </div>
				        <%} %>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>
			
		</div>
	</div>
	
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<h4 class="space30">
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color: #fff;"
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_SERVICE_090.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_SERVICE_090)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_090)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_090) %>
						<%} %>
					</h4>
			    	<!-- <img src="images/basic/logo-ico.png" class="img-responsive space20" width="70" alt=""/> -->
					<p>
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color: #878787;"
							href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_SERVICE_091.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_SERVICE_091)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_091)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_091) %>
						<%} %>
					</p>
                </div>
				<div class="col-md-3">
					<h4 class="space30">
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color: #fff;"
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_SERVICE_092.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_SERVICE_092)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_092)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_SERVICE_092) %>
						<%} %>
					</h4>
			  		<ul class="c-info">
						<li><i class="fa fa-map-marker"></i> 〒160-0004<br>東京都新宿区四谷4-3-3 FUKUYAビル2F-A</li>
						<li><i class="fa fa-phone"></i> 03-6380-6577</li>
						<li><i class="fa fa-envelope-o"></i> info@kms3.com</li>
					</ul>
					<div class="clearfix space10"></div>
				</div>
			</div>
		</div>
	</footer>


	<!-- FOOTER -->
	<jsp:include page="/template/T001/include-parts/main_footer.jsp" />
	<!-- /FOOTER -->
</div>


<jsp:include page="/template/T001/include-parts/html_script.jsp" />
    
<%if(isEditMode) { %>
<jsp:include page="/user/account/ajax/dialog_modal.jsp">
	<jsp:param name="modelId" value="textResModal" />
</jsp:include>
<%} %>

</body>
</html>