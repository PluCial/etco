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
List<ListItem> newsList =(List<ListItem>) request.getAttribute(ListItemType.T001_002.toString() + "ItemList");
HashMap<String,String> pageTextResMap =(HashMap<String,String>) request.getAttribute("pageTextResMap");
HashMap<String,String> newsListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T001_002.toString() + "TextMap");

SimpleDateFormat newsSdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'時'mm'分'");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <jsp:include page="/template/T002/include-parts/html_head.jsp" />
</head><!--/head-->

<body>

    <jsp:include page="/template/T002/include-parts/main_header.jsp" />

    <section id="contact-info">
        <div class="center wow fadeInDown" style="padding-bottom:30px">                
            <h2>
             	<%if(isEditMode) { %>
				<a data-toggle="modal" 
					data-backdrop="static"
					data-target="#textResModal" 
					style="color: #4e4e4e;"
					href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_NEWS_001.toString()%>">
					<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_NEWS_001)%>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_001)%></span>
				</a>
				<%}else { %>
					<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_NEWS_001) %>
				<%} %>
            </h2>
        </div>
        
        <%if(isEditMode) { %>
		<div class="text-center" style="padding-bottom:30px">
			<a data-target="newsListItem" data-insert-type="prepend" href="/user/account/ajax/addListItemEntry?listType=<%=ListItemType.T001_002 %>" class="btn btn-default addListItem">追加</a>
		</div>
		<%} %>

        <div class="container">
            <div class="col-sm-12 wow fadeInDown">
                    <div class="accordion">
                    
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
                </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->

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