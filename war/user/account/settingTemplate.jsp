<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="org.slim3.util.StringUtil" %>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.enums.*" %>
<%
Errors errors =(Errors) request.getAttribute("errors");
%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/user/account/include-parts/html_head.jsp" />
		<style>
			h2 {
				margin-bottom: 2em;
				margin-top: 1.5em;
			}
			.templateItem {
				  height: 230px;
				  position: relative;
			}
			.templateItem>a strong {
				text-shadow: 1px 1px 3px rgba(0,0,0,.7),1px 1px 5px rgba(0,0,0,.3);
    			color: #fff;
    			position: absolute;
    			bottom: 30px;
    			right: 50px;
    			font-size: 18px;
    			font-weight: bold;
			}
		</style>
	</head>
	<body class="skin-blue layout-top-nav">
		<div class="wrapper">
			<jsp:include page="/user/account/include-parts/main_header.jsp" />
      
      
			<div class="content-wrapper">
				<div class="container">

					<section class="content">
						<h2 class="text-center">テンプレートの選択</h2>
			
						<div class="row template-list">
							<%for(Template temp: Template.values()) { %>
							<div class="col-md-4 templateItem">
								<a href="/user/account/settingTemplateEntry?template=<%=temp.toString() %>">
								<img class="img-responsive" src="/template/<%=temp.toString() %>/thumbnail.jpg">
								<strong><%=temp.getName() %></strong>
								</a>
							</div>
							<%} %>
						</div>
            
					</section>
          
				</div><!-- /.container -->
			</div><!-- /.content-wrapper -->
      
			<jsp:include page="/user/account/include-parts/main_footer.jsp" />
		</div><!-- ./wrapper -->

		<jsp:include page="/user/account/include-parts/html_script.jsp" />

	</body>
</html>

