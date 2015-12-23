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
<jsp:include page="/template/T002/include-parts/html_head.jsp" />
<style>
a.image-change {
	position: absolute;
	top: 10px;
	left: 10px;
}
</style>
</head><!--/head-->

<body>

    <jsp:include page="/template/T002/include-parts/main_header.jsp" />

    <section id="about-us">
        <div class="container">
			<div class="center wow fadeInDown">
				<h2>
				<%if(isEditMode) { %>
				<a data-toggle="modal" 
					data-backdrop="static"
					data-target="#textResModal" 
					style="color: #4e4e4e;"
					href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_ABOUT_001.toString()%>">
					<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_ABOUT_001)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_001)%></span>
				</a>
				<%}else { %>
					<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_001) %>
				<%} %>
				</h2>
			</div>
			
			<!-- about us slider -->
			<div id="about-slider">
				<div id="carousel-slider" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
				  	<!-- <ol class="carousel-indicators visible-xs">
					    <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-slider" data-slide-to="1"></li>
					    <li data-target="#carousel-slider" data-slide-to="2"></li>
				  	</ol> -->

					<div class="carousel-inner">
						<div class="item active">
							<img src="<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_ABOUT_002) %>" class="img-responsive" alt="">
							<%if(isEditMode) { %>
							<a  class="btn btn-default image-change"
								href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_ABOUT_002.toString()%>">
								画像の変更
							</a>
							<%}%>
					    </div>   
					</div>
					
					<!-- <a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
						<i class="fa fa-angle-left"></i> 
					</a>
					
					<a class=" right carousel-control hidden-xs"href="#carousel-slider" data-slide="next">
						<i class="fa fa-angle-right"></i> 
					</a> -->
				</div> <!--/#carousel-slider-->
			</div><!--/#about-slider-->
			
		</div><!--/.container-->
    </section><!--/about-us-->
    
    
    <section id="contact-info">
        <div class="gmap-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 text-center">
                        <div class="gmap">
                            <iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=JoomShaper,+Dhaka,+Dhaka+Division,+Bangladesh&amp;aq=0&amp;oq=joomshaper&amp;sll=37.0625,-95.677068&amp;sspn=42.766543,80.332031&amp;ie=UTF8&amp;hq=JoomShaper,&amp;hnear=Dhaka,+Dhaka+Division,+Bangladesh&amp;ll=23.73854,90.385504&amp;spn=0.001515,0.002452&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=1073661719450182870&amp;output=embed"></iframe>
                        </div>
                    </div>

                    <div class="col-sm-6 map-content">
                        <ul class="row">
                            <li class="col-sm-9">
                                <address>
                                    <h5>
                                    <%if(isEditMode) { %>
									<a data-toggle="modal" 
										data-backdrop="static"
										data-target="#textResModal" 
										style="color: #4e4e4e;"
										href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_ABOUT_002.toString()%>">
										<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_ABOUT_002)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_002)%></span>
									</a>
									<%}else { %>
									<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_ABOUT_002) %>
									<%} %>
                                    </h5>
                                    <p>〒160-0004<br>東京都新宿区四谷4-3-3 FUKUYAビル2F-A</p>
                                    <p>TEL : 03-6380-6577<br>FAX : 03-6380-6581<br>
                                    Email : info@domain.com</p>
                                </address>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
    <!--/#bottom-->

    <jsp:include page="/template/T002/include-parts/main_footer.jsp" />

    <jsp:include page="/template/T002/include-parts/html_script.jsp" />
    
    <%if(isEditMode) { %>
	<!-- secure JS start -->
	<jsp:include page="/user/account/ajax/dialog_modal.jsp">
		<jsp:param name="modelId" value="textResModal" />
	</jsp:include>
	<!-- secure JS end -->
	<%} %>
</body>
</html>