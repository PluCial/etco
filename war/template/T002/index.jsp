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
List<ListItem> serviceList =(List<ListItem>) request.getAttribute(ListItemType.T001_001.toString() + "ItemList");
List<ListItem> newsList =(List<ListItem>) request.getAttribute(ListItemType.T001_002.toString() + "ItemList");
HashMap<String,String> pageTextResMap =(HashMap<String,String>) request.getAttribute("pageTextResMap");
HashMap<String,String> serviceListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T001_001.toString() + "TextMap");
HashMap<String,String> newsListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T001_002.toString() + "TextMap");
HashMap<String,String> pageGcsResMap =(HashMap<String,String>) request.getAttribute("pageGcsResMap");

SimpleDateFormat newsSdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'時'mm'分'");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <jsp:include page="/template/T002/include-parts/html_head.jsp" />
<!--     <link href="/user/account/ajax/modal.css" rel="stylesheet"> -->
</head><!--/head-->

<body class="homepage">

    <jsp:include page="/template/T002/include-parts/main_header.jsp" />

    <section id="main-slider" class="no-margin">
        <div class="carousel slide">
<!--             <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol> -->
            <div class="carousel-inner">

                <div class="item active" style="background-image: url(<%=Utils.getResValue(pageGcsResMap, sitePage.getKey().getName(), GcsResIds.T001_001) %>)">
                	<%if(isEditMode) { %>
					                	<a  class="btn btn-default"
											href="/user/account/editGcsRes?objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=GcsResIds.T001_001.toString()%>">
											画像の変更
										</a>
					                	<%}%>
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">
                                    	<%if(isEditMode) { %>
					                	<a data-toggle="modal" 
											data-backdrop="static"
											data-target="#textResModal" 
											style="color: #fff;"
											href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_001.toString()%>">
											<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_001)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_001)%></span>
										</a>
					                	<%}else { %>
					                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_001) %>
					                	<%} %>
                                    </h1>
                                    <h2 class="animation animated-item-2">
                                    <%if(isEditMode) { %>
					                	<a data-toggle="modal" 
											data-backdrop="static"
											data-target="#textResModal" 
											style="color: #fff;"
											href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_002.toString()%>">
											<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_002) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_002) %></span>
										</a>
					                	<%}else { %>
					                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_002) %>
					                	<%} %>
                                    </h2>
                                </div>
                            </div>

<!--                             <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="/template/T002/images/slider/img1.png" class="img-responsive">
                                </div>
                            </div> -->

                        </div>
                    </div>
                </div><!--/.item-->

            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
<!--         <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a> -->
    </section><!--/#main-slider-->

    <section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>
                	<%if(isEditMode) { %>
                	<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						style="color: #4e4e4e;"
						href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_003.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_003) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_003) %></span>
					</a>
                	<%}else { %>
                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_003) %>
                	<%} %>
                </h2>
                
                <p class="lead">
                	<%if(isEditMode) { %>
					<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						class="lead"
						style="color: #4e4e4e;"
						href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_004.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_004) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_004) %></span>
					</a>
					<%}else { %>
					<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_004) %>
					<%} %>
				</p>
            </div>

            <div class="row">
                <div class="features serviceListItem">
                
                	<%for(ListItem item: serviceList) { %>
                    <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-cogs"></i>
                            <h2>
                            	<%if(isEditMode) { %>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#4e4e4e;"
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_001.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %></span>
								</a>
								<%}else { %>
								<span><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %></span>
								<%} %>
                            </h2>
                            <h3>
                            	<%if(isEditMode) { %>
                            	<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#787878;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_002.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %></span>
								</a>
                            	<%}else { %>
                            	<%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %>
                            	<%} %>
                            </h3>
                        </div>
                    </div><!--/.col-md-4-->
                    <%} %>

                </div><!--/.services-->
            </div><!--/.row-->
            
            <%if(isEditMode) { %>
            <div class="text-center">
            	<a data-target="serviceListItem" href="/user/account/ajax/addListItemEntry?listType=<%=ListItemType.T001_001 %>" class="btn btn-default addListItem">追加</a>
            </div>
            <%} %>
            
        </div><!--/.container-->
    </section><!--/#feature-->

    <section id="recent-works">
        <div class="container">
            <div class="row">
                <!--/.col-sm-6-->

                <div class="col-sm-12 wow fadeInDown">
                    <div class="accordion">
                        <div class="center wow fadeInDown" style="padding-bottom:30px">
                            <h2>お知らせ</h2>
                        </div>
                        
                        <%if(isEditMode) { %>
						<div class="text-center" style="padding-bottom:30px">
							<a data-target="newsListItem" data-insert-type="prepend" href="/user/account/ajax/addListItemEntry?listType=<%=ListItemType.T001_002 %>" class="btn btn-default addListItem">追加</a>
						</div>
						<%} %>
                        
                        <div class="panel-group newsListItem" id="accordion1">

							<%for(int i=0; i < newsList.size(); i++) { 
								ListItem item = (ListItem)newsList.get(i);
							%>
							<div class="panel panel-default">
								<div class="panel-heading <%=i==0 ? "active" : "" %>">
									<h3 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse<%=i %>">
											<%=newsSdf.format(item.getCreateDate()) %>
											<i class="fa fa-angle-right pull-right"></i>
										</a>
									</h3>
								</div>
								<div id="collapse<%=i %>" class="panel-collapse collapse <%=i==0 ? "in" : "" %>">
									<div class="panel-body">
										<h4>
											<%if(isEditMode) { %>
											<a data-toggle="modal" 
												data-backdrop="static"
												data-target="#textResModal" 
												style="color:#4e4e4e;"
												href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_001.toString()%>">
												<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %>"><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %></span>
											</a>
											<%}else { %>
											<span><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %></span>
											<%} %>
										</h4>
										<%if(isEditMode) { %>
											<a data-toggle="modal" 
												data-backdrop="static"
												data-target="#textResModal" 
												style="color:#858586;"
												href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_002.toString()%>">
												<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %>"><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %></span>
											</a>
											<%}else { %>
											<span><%=Utils.getResValue(newsListTextMap, item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %></span>
											<%} %>
									</div>
								</div>
							</div>
							<%} %>

                        </div><!--/#accordion1-->
                    </div>
                </div>

            </div><!--/.row-->
            
            
        </div><!--/.container-->
    </section><!--/#middle-->

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