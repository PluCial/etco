<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>

	<section id="footer" class="footer service-footer">
		<div class="container">
		
			<div class="row">
				<div class="col-md-10 col-md-offset-3 footer-widget">
 					<h3 class="widget-title"><%=App.APP_DISPLAY_NAME %></h3>
 				</div>
 			</div>
			
			<div class="row">
				<div class="col-md-3 col-sm-12 col-md-offset-3 footer-widget">
					<ul class="unstyled">
<%-- 						<li><a href="/info/about"><%=App.APP_DISPLAY_NAME %>とは</a></li> --%>
						<li><a href="/info/price">運用会社</a></li>
						<li><a href="/info/contact">お問い合わせ</a></li>
					</ul>
				</div>
			
				<div class="col-md-3 col-sm-12 footer-widget">
					<ul class="unstyled">
						<li><a href="/info/agreement">利用規約</a></li>
						<li><a href="/info/privacy">プライバシーポリシー</a></li>
					</ul>
				</div>

			</div><!--/ Row end -->
			
			<div class="row">
				<div class="col-md-12 text-center">
							
					<div class="copyright-info">
         			&copy; Copyright <%=App.MANAGEMENT_COMPANY_NAME %>. <span>All Rights Reserved</span>
        			</div>
				</div>
			</div><!--/ Row end -->
		   <div id="back-to-top" data-spy="affix" data-offset-top="10" class="back-to-top affix">
				<button class="btn btn-primary" title="Back to Top"><i class="fa fa-angle-double-up"></i></button>
			</div>
		</div><!--/ Container end -->
		
	</section>