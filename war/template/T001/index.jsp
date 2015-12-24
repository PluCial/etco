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

List<ListItem> serviceList =(List<ListItem>) request.getAttribute(ListItemType.T001_001.toString() + "ItemList");
List<ListItem> newsList =(List<ListItem>) request.getAttribute(ListItemType.T001_002.toString() + "ItemList");
HashMap<String,String> serviceListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T001_001.toString() + "TextMap");
HashMap<String,String> newsListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T001_002.toString() + "TextMap");

SimpleDateFormat newsSdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'時'mm'分'");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<jsp:include page="/template/T001/include-parts/html_head.jsp" />
<style>
#main-slider .container {
}
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

	<!-- SLIDER  -->
	<section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <div class="carousel-inner">

                <div class="item active" style="height: 550px;background-repeat: no-repeat;background-size: cover;background-image: url(<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_INDEX_001) %>)">
                	<%if(isEditMode) { %>
					<a  class="btn btn-default image-change"
						href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_INDEX_001.toString()%>">
						画像の変更
					</a>
					<%}%>
					
                    <div class="container" style="padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;">
                        <div class="row slide-margin" style="margin-top: 150px;">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1" style="color: #fff;">
                                    	<%if(isEditMode) { %>
					                	<a data-toggle="modal" 
											data-backdrop="static"
											data-target="#textResModal" 
											style="color: #fff;"
											href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_INDEX_001.toString()%>">
											<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_INDEX_001)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_001)%></span>
										</a>
					                	<%}else { %>
					                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_001) %>
					                	<%} %>
                                    </h1>
                                    <h2 class="animation animated-item-2" style="color: #fff;">
                                    <%if(isEditMode) { %>
					                	<a data-toggle="modal" 
											data-backdrop="static"
											data-target="#textResModal" 
											style="color: #fff;"
											href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_INDEX_002.toString()%>">
											<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_INDEX_002) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_002) %></span>
										</a>
					                	<%}else { %>
					                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_002) %>
					                	<%} %>
                                    </h2>
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->

    </section><!--/#main-slider-->

	<!-- INNER CONTENT -->
	<div class="inner-content no-padding">
		<div class="container">
			<div class="space60"></div>
			<div class="welcome-content text-center">
				<h2>
					<%if(isEditMode) { %>
					<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						style="color: #000;"
						href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_INDEX_003.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_INDEX_003)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_003)%></span>
					</a>
					<%}else { %>
					<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_003) %>
					<%} %>
				</h2>
				<p class="lead">
					<%if(isEditMode) { %>
					<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						style="color: #878787;"
						href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_INDEX_004.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_INDEX_004)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_004)%></span>
					</a>
					<%}else { %>
					<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_004) %>
					<%} %>
				</p>
			</div>
		</div>
		<div class="container">
			<%if(serviceList.size() > 0) { %>
			<div class="service-home col-md-12 text-center serviceListItem">
				<%for(ListItem item: serviceList) { %>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="#">
					<i class="icon-support"></i>
					</a>
					<div class="clearfix"></div>
					<h4>
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color:#000;"
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_001.toString()%>">
							<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %></span>
						</a>
						<%}else { %>
						<span><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %></span>
						<%} %>
					</h4>
					<p>
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color:#878787;"
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_002.toString()%>">
							<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %></span>
						</a>
						<%}else { %>
						<span><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %></span>
						<%} %>
					</p>
				</div>
				<%} %>
			</div>
			<%} %>
			
			<%if(isEditMode) { %>
            <div class="text-center" style="margin-bottom: 30px;">
            	<a data-target="serviceListItem" href="/user/account/ajax/addListItemEntry?listType=<%=ListItemType.T001_001 %>" class="btn btn-default addListItem">追加</a>
            </div>
            <%} %>
		</div>
		<div class="clearfix"></div>
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
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_INDEX_090.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_INDEX_090)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_090)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_090) %>
						<%} %>
					</h4>
			    	<!-- <img src="images/basic/logo-ico.png" class="img-responsive space20" width="70" alt=""/> -->
					<p>
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color: #878787;"
							href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_INDEX_091.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_INDEX_091)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_091)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_091) %>
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
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_INDEX_092.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_INDEX_092)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_092)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_INDEX_092) %>
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

