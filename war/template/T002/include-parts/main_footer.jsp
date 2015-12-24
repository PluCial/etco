<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="java.util.List" %>
<%
	User user =(User) request.getAttribute("user");
boolean isEditMode = Boolean.valueOf((String) request.getAttribute("isEditMode"));
List<SitePage> pageList =(List<SitePage>) request.getAttribute("pageList");
%>
	<footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; KMS inc. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <%
                    		for(SitePage sitePage: pageList) {
                    	%>
                    	<%if(sitePage.getRole().equals("index")) { %>
                        <li><a href="/+<%=user.getSiteId() %>"><%=sitePage.getName() %></a></li>
                        <%}else { %>
                        <li><a href="/+<%=user.getSiteId() %>/<%=sitePage.getName() %>"><%=sitePage.getName() %></a></li>
                        <%} %>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
    </footer>