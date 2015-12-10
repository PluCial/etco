<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%
String keyword = (String)request.getAttribute("keyword");
%>

		<header class="main-header">               
        <nav class="navbar navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <a href="/admin/" class="navbar-brand"><b><%=App.APP_DISPLAY_NAME %></b></a>
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                <i class="fa fa-bars"></i>
              </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
             <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
              <form action="/admin/" method="get" class="navbar-form navbar-left" role="search">
                <div class="form-group">
                  <input type="text" name="keyword" class="form-control" id="navbar-search-input" placeholder="Search" value="<%=keyword == null ? "": keyword%>">
                </div>
              </form>                          
            </div><!-- /.navbar-collapse -->
            
          </div><!-- /.container-fluid -->
        </nav>
      </header>