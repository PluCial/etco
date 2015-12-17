<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="org.slim3.util.StringUtil" %>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="com.etco.model.*" %>
<%
Errors errors =(Errors) request.getAttribute("errors");
User user =(User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/user/account/include-parts/html_head.jsp" />
		<style>
			h3 {
				  text-align: center;
				  margin-bottom: 2em;
			}
			.box {
				  background: #fff;
				  padding: 20px;
			}
			.content {
				margin: 5% auto;
				max-width: 600px;
			}
			.checkbox {
				margin-top: 2em;
			}
		</style>
	</head>
	<body class="skin-blue layout-top-nav">
		<div class="wrapper">
			<jsp:include page="/user/account/include-parts/main_header.jsp" />
      
      
			<div class="content-wrapper">
				<div class="container">

					<section class="content">
						<h3>
							ページの追加
						</h3>
			
						<div class="box box-primary">
                
							<!-- form start -->
							<form action="/user/account/addSitePageEntry" method="post">
								<div class="box-body">
									
									<div class="form-group ${f:errorClass('pageName','has-error')}">
										<label for="pageName">ページ名</label>
										<%if (errors.containsKey("pageName")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.pageName}</label>
										<%}%>
										<input type="text" ${f:text("pageName")} class="form-control" placeholder="ページ名" required>
									</div>
									
									<div class="form-group ${f:errorClass('pageRole','has-error')}">
										<label for="pageRole">ページタイプ</label>
										<%if (errors.containsKey("pageRole")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.pageRole}</label>
										<%}%>
										
										<select name="pageRole" class="form-control selectpicker">
											<%
												for(PageRole role: PageRole.values()) {
													if(role != PageRole.INDEX) { 
											%>
											<option value="<%=role.toString() %>"><%=role.getName() %></option>
											<%} %>
											<%} %>
										</select>
									</div>
									
 									
								</div><!-- /.box-body -->

								<div class="box-footer">
									<a href="/+<%=user.getSiteId() %>" class="btn btn-default pull-left">キャンセル</a>
									<button type="submit" class="btn btn-primary pull-right">追加する</button>
								</div>
							</form>
						</div>
            
					</section>
          
				</div><!-- /.container -->
			</div><!-- /.content-wrapper -->
      
			<jsp:include page="/user/account/include-parts/main_footer.jsp" />
		</div><!-- ./wrapper -->

		<jsp:include page="/user/account/include-parts/html_script.jsp" />

	</body>
</html>

