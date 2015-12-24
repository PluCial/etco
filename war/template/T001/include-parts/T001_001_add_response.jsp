<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.etco.Utils" %>
<%
ListItem item = (ListItem) request.getAttribute("listItem");
%>

	<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="#">
					<i class="icon-support"></i>
					</a>
					<div class="clearfix"></div>
					<h4>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color:#000;"
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_001.toString()%>">
							<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %>"><%=TextResIds.T001_LIST_ITEM_TYPE001_001.getDefaultValue() %></span>
						</a>
					</h4>
					<p>
						<a data-toggle="modal" 
							data-backdrop="static"
							data-target="#textResModal" 
							style="color:#878787;"
							href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_002.toString()%>">
							<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %>"><%=TextResIds.T001_LIST_ITEM_TYPE001_002.getDefaultValue() %></span>
						</a>
					</p>
				</div>

	