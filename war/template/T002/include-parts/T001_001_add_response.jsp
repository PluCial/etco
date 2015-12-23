<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.etco.Utils" %>
<%
ListItem item = (ListItem) request.getAttribute("listItem");
%>

	<div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <i class="fa fa-cogs"></i>
                            <h2>
								<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#4e4e4e;"
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_001.toString() %>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_001) %>">サービス詳細</span>
								</a>
                            </h2>
                            <h3>
                            	<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#787878;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=<%=TextResIds.T001_LIST_ITEM_TYPE001_002.toString() %>">
									<span id="<%=Utils.getResKey(item.getKey().getName(), TextResIds.T001_LIST_ITEM_TYPE001_002) %>">サービスの簡易説明テキスト等入りますサービスの簡易説明テキスト等入ります</span>
								</a>
                            </h3>
                        </div>
                    </div><!--/.col-md-4-->

	