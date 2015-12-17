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
<%
SitePage sitePage = (SitePage) request.getAttribute("sitePage");
boolean isEditMode = Boolean.valueOf((String) request.getAttribute("isEditMode"));
List<ListItem> serviceList =(List<ListItem>) request.getAttribute("serviceList");
HashMap<String,String> pageTextResMap =(HashMap<String,String>) request.getAttribute("pageTextResMap");
HashMap<String,String> serviceListMap =(HashMap<String,String>) request.getAttribute("serviceListMap");
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

                <div class="item active" style="background-image: url(/template/T002/images/slider/bg1.jpg)">
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
											href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=t003">
											<span id="<%=Utils.getResKeyString(sitePage.getKey().getName(), "t003") %>"><%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t003", "Kaleidoscope Media Service") %></span>
										</a>
					                	<%}else { %>
					                	<%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t003", "Kaleidoscope Media Service") %>
					                	<%} %>
                                    </h1>
                                    <h2 class="animation animated-item-2">
                                    <%if(isEditMode) { %>
					                	<a data-toggle="modal" 
											data-backdrop="static"
											data-target="#textResModal" 
											style="color: #fff;"
											href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=t004">
											<span id="<%=Utils.getResKeyString(sitePage.getKey().getName(), "t004") %>"><%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t004", "キャッチ的なテキストが入ります") %></span>
										</a>
					                	<%}else { %>
					                	<%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t004", "キャッチ的なテキストが入ります") %>
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
						href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=t000">
						<span id="<%=Utils.getResKeyString(sitePage.getKey().getName(), "t000") %>"><%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t000", "サービス") %></span>
					</a>
                	<%}else { %>
                	<%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t000", "サービス") %>
                	<%} %>
                </h2>
                
                <p class="lead">
                	<%if(isEditMode) { %>
					<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						class="lead"
						style="color: #4e4e4e;"
						href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=t001">
						<span id="<%=Utils.getResKeyString(sitePage.getKey().getName(), "t001") %>"><%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t001", "インターネット広告や紙媒体、モバイル端末向けの媒体販促ツールなどを含め広告にまつわるデザイン制作も請負い、プロモーションの全てを引き受け案件進行を行っております。 広告については成果検証を行い、クライアント様を必ずや成功に導くお手伝いをさせていただきます。") %></span>
					</a>
					<%}else { %>
					<%=Utils.getTextResFromMap(pageTextResMap, sitePage.getKey().getName(), "t001", "インターネット広告や紙媒体、モバイル端末向けの媒体販促ツールなどを含め広告にまつわるデザイン制作も請負い、プロモーションの全てを引き受け案件進行を行っております。 広告については成果検証を行い、クライアント様を必ずや成功に導くお手伝いをさせていただきます。") %>
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
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=t001">
									<span id="<%=Utils.getResKeyString(item.getKey().getName(), "t001") %>"><%=Utils.getTextResFromMap(serviceListMap, item.getKey().getName(), "t001", "サービス詳細") %></span>
								</a>
								<%}else { %>
								<span><%=Utils.getTextResFromMap(serviceListMap, item.getKey().getName(), "t001", "サービス詳細") %></span>
								<%} %>
                            </h2>
                            <h3>
                            	<%if(isEditMode) { %>
                            	<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#787878;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=t002">
									<span id="<%=Utils.getResKeyString(item.getKey().getName(), "t002") %>"><%=Utils.getTextResFromMap(serviceListMap, item.getKey().getName(), "t002", "サービスの簡易説明テキスト等入りますサービスの簡易説明テキスト等入ります") %></span>
								</a>
                            	<%}else { %>
                            	<%=Utils.getTextResFromMap(serviceListMap, item.getKey().getName(), "t002", "サービスの簡易説明テキスト等入りますサービスの簡易説明テキスト等入ります") %>
                            	<%} %>
                            </h3>
                        </div>
                    </div><!--/.col-md-4-->
                    <%} %>

                </div><!--/.services-->
            </div><!--/.row-->
            
            <%if(isEditMode) { %>
            <div class="text-center">
            	<a data-target="serviceListItem" href="/user/account/ajax/addListItemEntry?listType=serviceList" class="btn btn-default addListItem">追加</a>
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
                        <div class="center wow fadeInDown">
                            <h2>お知らせ</h2>
                        </div>
                        <div class="panel-group" id="accordion1">
                          <div class="panel panel-default">
                            <div class="panel-heading active">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                  お知らせタイトル
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>

                            <div id="collapseOne1" class="panel-collapse collapse in">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="images/accordion1.png">
                                        </div>
                                        <div class="media-body">
                                             <h4>お知らせ</h4>
                                             <p>テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                  お知らせタイトル
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseTwo1" class="panel-collapse collapse">
                              <div class="panel-body">
                                テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                  お知らせタイトル
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseThree1" class="panel-collapse collapse">
                              <div class="panel-body">
                                テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
                                  お知らせタイトル
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseFour1" class="panel-collapse collapse">
                              <div class="panel-body">
                                テキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキストテキスト
                              </div>
                            </div>
                          </div>
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