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
									href="/user/account/ajax/editTextRes?editType=shortText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=t001">
									<span id="<%=Utils.getResKeyString(item.getKey().getName(), "t001") %>">サービス詳細</span>
								</a>
                            </h2>
                            <h3>
                            	<a data-toggle="modal" 
									data-backdrop="static"
									data-target="#textResModal" 
									style="color:#787878;"
									href="/user/account/ajax/editTextRes?editType=longText&objectType=listItem&parentKey=<%=item.getKey().getName() %>&resId=t002">
									<span id="<%=Utils.getResKeyString(item.getKey().getName(), "t002") %>">サービスの簡易説明テキスト等入りますサービスの簡易説明テキスト等入ります</span>
								</a>
                            </h3>
                        </div>
                    </div><!--/.col-md-4-->

	