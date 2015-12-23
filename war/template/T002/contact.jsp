<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="org.slim3.controller.validator.Errors" %>
<%@ page import="com.etco.App" %>
<%@ page import="com.etco.model.*" %>
<%@ page import="com.etco.enums.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.etco.Utils" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String siteId = (String) request.getAttribute("siteId");
Errors errors =(Errors) request.getAttribute("errors");
String message =(String) request.getAttribute("message");

SitePage sitePage = (SitePage) request.getAttribute("sitePage");
boolean isEditMode = Boolean.valueOf((String) request.getAttribute("isEditMode"));
HashMap<String,String> pageTextResMap =(HashMap<String,String>) request.getAttribute("pageTextResMap");
HashMap<String,String> pageGcsResMap =(HashMap<String,String>) request.getAttribute("pageGcsResMap");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <jsp:include page="/template/T002/include-parts/html_head.jsp" />
</head><!--/head-->

<body>

    <jsp:include page="/template/T002/include-parts/main_header.jsp" />

    <section id="contact-info">
        <div class="center wow fadeInDown">                
            <h2>
            <%if(isEditMode) { %>
			<a data-toggle="modal" 
				data-backdrop="static"
				data-target="#textResModal" 
				style="color: #4e4e4e;"
				href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_CONTACT_001.toString()%>">
				<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_CONTACT_001) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_CONTACT_001) %></span>
			</a>
			<%}else { %>
			<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_CONTACT_001) %>
			<%} %>
            </h2>
            <p class="lead">
            <%if(isEditMode) { %>
			<a data-toggle="modal" 
				data-backdrop="static"
				data-target="#textResModal" 
				style="color: #4e4e4e;"
				href="/user/account/ajax/editTextRes?editType=shortText&objectType=page&parentKey=<%=sitePage.getKey().getName() %>&resId=<%=TextResIds.T001_CONTACT_002.toString()%>">
				<span id="<%=Utils.getResKey(sitePage.getKey().getName(), TextResIds.T001_CONTACT_002) %>"><%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_CONTACT_002) %></span>
			</a>
			<%}else { %>
			<%=Utils.getResValue(pageTextResMap, sitePage.getKey().getName(), TextResIds.T001_CONTACT_002) %>
			<%} %>
            </p>
        </div>

        <div class="container">
            <div class="row contact-wrap wow fadeInDown"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form class="contact-form" name="contact-form" method="post" action="/site/contactEntry">
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="form-group has-feedback ${f:errorClass('name','has-error')}">
                            <label>お名前 *</label>
                            <%if (errors.containsKey("name")){ %>
								<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.name}</label>
							<%} %>
                            <input type="text" name="name" class="form-control" required="required">
                        </div>
                        <div class="form-group has-feedback ${f:errorClass('email','has-error')}">
                            <label>メールアドレス *</label>
                            <%if (errors.containsKey("email")){ %>
								<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.email}</label>
							<%} %>
                            <input type="email" name="email" class="form-control" required="required">
                        </div>
                        <div class="form-group has-feedback ${f:errorClass('phoneNumber','has-error')}">
                            <label>電話番号 *</label>
                            <%if (errors.containsKey("phoneNumber")){ %>
								<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.phoneNumber}</label>
							<%} %>
                            <input type="number" name="phoneNumber" class="form-control">
                        </div>
                        <div class="form-group has-feedback ${f:errorClass('companyName','has-error')}">
                            <label>会社名</label>
                            <%if (errors.containsKey("companyName")){ %>
								<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.companyName}</label>
							<%} %>
                            <input type="text" name="companyName" class="form-control">
                        </div>                        
                    </div>
                    <div class="col-sm-5">
                        <div class="form-group has-feedback ${f:errorClass('subject','has-error')}">
                            <label>件名 *</label>
                            <%if (errors.containsKey("subject")){ %>
								<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.subject}</label>
							<%} %>
                            <input type="text" name="subject" class="form-control" required="required">
                        </div>
                        <div class="form-group has-feedback ${f:errorClass('message','has-error')}">
                            <label>お問い合わせ内容 *</label>
                            <%if (errors.containsKey("message")){ %>
								<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> ${errors.message}</label>
							<%} %>
                            <textarea name="message" id="message" required class="form-control" rows="8"></textarea>
                        </div>                        
                        <div class="form-group">
                        	<input type="hidden" name="siteId" value="<%=siteId %>" />
                            <button type="submit" name="submit" class="btn btn-primary btn-lg" required="required">送信</button>
                        </div>
                    </div>
                </form> 
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->

    <!--/#bottom-->

    <jsp:include page="/template/T002/include-parts/main_footer.jsp" />

    <jsp:include page="/template/T002/include-parts/html_script.jsp" />
    
    <%if(isEditMode) { %>
	<!-- secure JS start -->
	<jsp:include page="/user/account/ajax/dialog_modal.jsp">
		<jsp:param name="modelId" value="textResModal" />
	</jsp:include>
	<!-- secure JS end -->
	<%} %>
</body>
</html>