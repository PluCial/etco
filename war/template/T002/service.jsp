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
List<ListItem> serviceList =(List<ListItem>) request.getAttribute(ListItemType.T002_003.toString() + "ItemList");
HashMap<String,String> pageTextResMap =(HashMap<String,String>) request.getAttribute("pageTextResMap");
HashMap<String,String> serviceListTextMap =(HashMap<String,String>) request.getAttribute(ListItemType.T002_003.toString() + "TextMap");

SimpleDateFormat newsSdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'時'mm'分'");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <jsp:include page="/template/T002/include-parts/html_head.jsp" />
</head><!--/head-->

<body>

    <jsp:include page="/template/T002/include-parts/main_header.jsp" />

    <section id="feature" class="transparent-bg">
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>
                	<%if(isEditMode) { %>
                	<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						style="color: #4e4e4e;"
						href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T002_SERVICE_001.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T002_SERVICE_001) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_001) %></span>
					</a>
                	<%}else { %>
                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_001) %>
                	<%} %>
                </h2>
                
                <p class="lead">
                	<%if(isEditMode) { %>
					<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						class="lead"
						style="color: #4e4e4e;"
						href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T002_SERVICE_002.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T002_SERVICE_002) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_002) %></span>
					</a>
					<%}else { %>
					<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_002) %>
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
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T002_LIST_ITEM_TYPE003_001.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T002_LIST_ITEM_TYPE003_001) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T002_LIST_ITEM_TYPE003_001) %></span>
								</a>
								<%}else { %>
								<span><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T002_LIST_ITEM_TYPE003_001) %></span>
								<%} %>
                            </h2>
                            <h3>
                            	<%if(isEditMode) { %>
                            	<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#787878;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T002_LIST_ITEM_TYPE003_002.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T002_LIST_ITEM_TYPE003_002) %>"><%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T002_LIST_ITEM_TYPE003_002) %></span>
								</a>
                            	<%}else { %>
                            	<%=Utils.getResValue(serviceListTextMap, item.getKey().getName(), TextResIds.T002_LIST_ITEM_TYPE003_002) %>
                            	<%} %>
                            </h3>
                        </div>
                    </div><!--/.col-md-4-->
                    <%} %>

                </div><!--/.services-->
            </div><!--/.row-->
            
            <%if(isEditMode) { %>
            <div class="text-center">
            	<a data-target="serviceListItem" href="/user/account/ajax/addListItemEntry?listType=<%=ListItemType.T002_003 %>" class="btn btn-default addListItem">追加</a>
            </div>
            <%} %>
            
            <div class="get-started center wow fadeInDown">

                <h2>
                	<%if(isEditMode) { %>
                	<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						style="color: #4e4e4e;"
						href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T002_SERVICE_003.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T002_SERVICE_003) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_003) %></span>
					</a>
                	<%}else { %>
                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_003) %>
                	<%} %>
                </h2>

                <p class="lead">
                <%if(isEditMode) { %>
                	<a data-toggle="modal" 
						data-backdrop="static"
						data-target="#textResModal" 
						style="color: #4e4e4e;"
						href="/user/account/ajax/editTextRes?editType=longText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T002_SERVICE_004.toString()%>">
						<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T002_SERVICE_004) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_004) %></span>
					</a>
                	<%}else { %>
                	<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T002_SERVICE_004) %>
                	<%} %>
                </p>

            </div><!--/.get-started-->
            
        </div><!--/.container-->
    </section><!--/#feature-->
    
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