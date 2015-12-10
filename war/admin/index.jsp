<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
List<User> userList =(List<User>) request.getAttribute("userList");
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy'年'MM'月'dd'日'");
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/admin/include-parts/html_head.jsp" />
</head>
<body class="skin-blue layout-top-nav">
	<div class="wrapper">
    
    	<!-- Header start -->
 		<jsp:include page="/admin/include-parts/main_header.jsp" />
		<!-- Header end -->
      
		<!-- Full Width Column -->
		<div class="content-wrapper">
			<div class="container">

				<section class="content-header">
					<h1>ユーザー一覧</h1>
				</section>

				<!-- Main content -->
				<section class="content">
					
					<div class="box">
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tbody>
									<tr>
										<th style="width: 40px">ID</th>
										<th style="width: 300px">ユーザー名</th>
										<th style="width: 200px">登録日</th>
										<th style="width: 100px">メールアドレス</th>
										<th>ホームページ</th>
									</tr>
									<%for(User user: userList) { %>
									<tr>
										<td><%=user.getKey().getId() %></td>
										<td><%=user.getName() %></td>
										<td><%=sdf1.format(user.getCreateDate()) %></td>
										<td><%=user.getEmail().getEmail() %></td>
										<td><a target="_blank" href="/+<%=user.getSiteId() %>"><%=user.getSiteName() %></a></td>
									</tr>
									<%} %>
                    
								</tbody>
							</table>
						</div><!-- /.box-body -->
					</div>

				</section><!-- /.content -->
			</div><!-- /.container -->
		</div><!-- /.content-wrapper -->
	</div>
	<jsp:include page="/admin/include-parts/main_footer.jsp" />

    <jsp:include page="/admin/include-parts/html_script.jsp" />
</body>
</html>
