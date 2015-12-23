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

	<div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse<%=Integer.valueOf(listSize) %>">
                                  <%=newsSdf.format(item.getCreateDate()) %>
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapse<%=Integer.valueOf(listSize) %>" class="panel-collapse collapse">
                              <div class="panel-body">
										<h4>
											<a data-toggle="modal" 
												data-backdrop="static"
												data-target="#textResModal" 
												style="color:#4e4e4e;"
												href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_001.toString()%>">
												<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_001) %>"><%=TextResIds.T001_LIST_ITEM_TYPE002_001.getDefaultValue() %></span>
											</a>
										</h4>
										
											<a data-toggle="modal" 
												data-backdrop="static"
												data-target="#textResModal" 
												style="color:#858586;"
												href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE002_002.toString()%>">
												<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE002_002) %>"><%=TextResIds.T001_LIST_ITEM_TYPE002_002.getDefaultValue() %></span>
											</a>
											
									</div>
                            </div>
                          </div>

	