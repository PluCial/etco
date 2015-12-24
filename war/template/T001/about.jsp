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
			href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_ABOUT_001.toString()%>">
			画像の変更
		</a>
		<%}%>
		<div class="page_header_parallax" style="background-image: url(<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_ABOUT_001) %>">
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
	<div class="inner-content no-padding">
		<div class="clearfix space70"></div>
		<div class="container">
			
			<div class="features">
				<div class="container">
					<div class="row">
						<div class="col-md-5">
							<div style="position: relative;">
								<img src="<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_ABOUT_002) %>" class="img-responsive" alt="">
								<%if(isEditMode) { %>
								<a  class="btn btn-default image-change"
									href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_ABOUT_002.toString()%>">
									画像の変更
								</a>
								<%}%>
							</div>
						</div>
						<div class="col-md-6">
							<div class="fc-main">
								
								<div class="feature-content space30">
									<div class="fc-inner">
                                        <h2>会社名</h2>
                                        <p>株式会社KMS（カレイドスコープメディアサービス）</p>
                                        <h2>代表取締役社長</h2>
                                        <p>◯◯◯◯◯◯◯◯</p>
                                        <h2>事業内容</h2>
                                        <p>総合広告代理事業</p>
                                        <h2>本店所在地</h2>
                                        <p>〒160-0004 東京都新宿区四谷4-3-3 FUKUYAビル2F-A<br>TEL 03-6380-6577 / FAX 03-6380-6581</p>
									</div>
								</div>
                                <div class="feature-content space30">
									<div class="fc-inner">
                                        <h2>主要取引銀行</h2>
                                        <p>三井住友銀行</p>
								</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix space90">
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
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_ABOUT_090.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_ABOUT_090)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_090)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_090) %>
						<%} %>
					</h4>
			    	<!-- <img src="images/basic/logo-ico.png" class="img-responsive space20" width="70" alt=""/> -->
					<p>
						<%if(isEditMode) { %>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color: #878787;"
							href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_ABOUT_091.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_ABOUT_091)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_091)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_091) %>
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
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_ABOUT_092.toString()%>">
							<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_ABOUT_092)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_092)%></span>
						</a>
						<%}else { %>
						<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_092) %>
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






