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

List<ListItem> newsList =(List<ListItem>) request.getAttribute(ListItemType.T001_002.toString() + "ItemList");
HashMap<String,String> newsListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T001_002.toString() + "TextMap");
SimpleDateFormat newsSdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'時'mm'分'");
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
			href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_NEWS_001.toString()%>">
			画像の変更
		</a>
		<%}%>
		<div class="page_header_parallax" style="background-image: url(<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_NEWS_001) %>">
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
	
	<!-- INNER CONTENT -->
	<div class="inner-content">
		<div class="container">
			
			<%if(isEditMode) { %>
			<div class="text-center" style="padding-bottom:30px">
				<a data-target="newsListItem" data-insert-type="prepend" href="/user/account/ajax/addListItemEntry?listType=<%=ListItemType.T001_002 %>" class="btn btn-default addListItem">追加</a>
			</div>
			<%} %>
			
			<div class="panel-group newsListItem" id="accordion-e3">
			
				<%for(int i=0; i < newsList.size(); i++) { 
					ListItem item = (ListItem)newsList.get(i);
				%>
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-e3" href="#collapse<%=i %>" class="<%=i>0 ? "collapsed" : "" %>">
							<%=newsSdf.format(item.getCreateDate()) %>
							<span class="<%=i > 0 ? "icon-cross2" : "icon-check2" %>"></span>
							</a>
						</h4>
					</div>
					<div id="collapse<%=i %>" class="panel-collapse collapse <%=i==0 ? "in" : "" %>">
						<div class="panel-body">
							<h5>
								<%if(isEditMode) { %>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#000;"
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_001.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %>"><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %></span>
								</a>
								<%}else { %>
								<span><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %></span>
								<%} %>
							</h5>
							<p>
								<%if(isEditMode) { %>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#878787;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_002.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %>"><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %></span>
								</a>
								<%}else { %>
								<span><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %></span>
								<%} %>
							</p>
						</div>
					</div>
				</div>
				<%} %>
			
				<!-- <div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-e3" href="#collapse001">
							お知らせタイトル1
							<span class="icon-check2"></span>
							</a>
						</h4>
					</div>
					<div id="collapse001" class="panel-collapse collapse in">
						<div class="panel-body">
							<p>お知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入ります</p>
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-e3" href="#collapse002" class="collapsed">
							お知らせタイトル2
							<span class="icon-cross2"></span>
							</a>
						</h4>
					</div>
					<div id="collapse002" class="panel-collapse collapse">
						<div class="panel-body">
							<h5>お知らせタイトル</h5>
							<p>お知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入ります</p>
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-e3" href="#collapse003" class="collapsed">
							お知らせタイトル3
							<span class="icon-cross2"></span>
							</a>
						</h4>
					</div>
					<div id="collapse003" class="panel-collapse collapse">
						<div class="panel-body">
							<p>お知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入りますお知らせ詳細が入ります</p>
						</div>
					</div>
				</div> -->
			</div>
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
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_NEWS_090.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_NEWS_090)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_090)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_090) %>
						<%} %>
					</h4>
			    	<!-- <img src="images/basic/logo-ico.png" class="img-responsive space20" width="70" alt=""/> -->
					<p>
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color: #878787;"
							href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_NEWS_091.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_NEWS_091)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_091)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_091) %>
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
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_NEWS_092.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_NEWS_092)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_092)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_092) %>
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
