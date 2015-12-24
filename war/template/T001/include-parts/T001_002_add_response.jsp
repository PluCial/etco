<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.etco.Utils" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
ListItem item = (ListItem) request.getAttribute("listItem");
String listSize = (String) request.getAttribute("listSize");
SimpleDateFormat newsSdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日' HH'時'mm'分'");
%>

				<div class="panel">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion-e3" href="#collapse<%=Integer.valueOf(listSize) %>">
							<%=newsSdf.format(item.getCreateDate()) %>
							<span class="icon-cross2"></span>
							</a>
						</h4>
					</div>
					<div id="collapse<%=Integer.valueOf(listSize) %>" class="panel-collapse collapse">
						<div class="panel-body">
							<h5>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#000;"
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_001.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %>"><%=TextResIds.T001_LIST_ITEM_TYPE002_001.getDefaultValue() %></span>
								</a>
							</h5>
							<p>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#878787;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_002.toString()%>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %>"><%=TextResIds.T001_LIST_ITEM_TYPE002_002.getDefaultValue() %></span>
								</a>
							</p>
						</div>
					</div>
				</div>

	