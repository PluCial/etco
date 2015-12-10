<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="org.slim3.util.StringUtil" %>
<%@ page import="com.etco.App" %>
<%
Errors errors =(Errors) request.getAttribute("errors");
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
							<i class="fa fa-plus"></i> サイトの作成
						</h3>
			
						<div class="box box-primary">
                
							<!-- form start -->
							<form action="/user/account/settingSiteInfoEntry" method="post">
								<div class="box-body">
								
									<div class="form-group ${f:errorClass('siteId','has-error')}">
										<%if (errors.containsKey("siteId")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.siteId}</label>
										<%}else { %>
										<label for="exampleInputEmail1">サイトID</label>
										<%} %>
										<div class="input-group">
											<span class="input-group-addon" style="color: #333;"><b><%=App.APP_PRODUCTION_SCHEME %><%=App.APP_PRODUCTION_DOMAIN %>/+</b></span>
											<input type="text" ${f:text("siteId")} class="form-control" placeholder="サイトID(半角英数字)" required>
										</div>
									</div>
									
									<div class="form-group ${f:errorClass('name','has-error')}">
										<%if (errors.containsKey("name")){ %>
										<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.name}</label>
										<%}else { %>
										<label for="exampleInputEmail1">サイト名</label>
										<%} %>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-pencil-square-o"></i></span>
											<input type="text" ${f:text("name")} class="form-control" placeholder="例：株式会社KMS" required>
										</div>
									</div>
									
 									
								</div><!-- /.box-body -->

								<div class="box-footer">
									<button type="submit" class="btn btn-primary pull-right">登録して次へ</button>
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

