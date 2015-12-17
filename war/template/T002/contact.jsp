<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <jsp:include page="/template/T002/include-parts/html_head.jsp" />
</head><!--/head-->

<body>

    <jsp:include page="/template/T002/include-parts/main_header.jsp" />

    <section id="contact-info">
        <div class="center wow fadeInDown">                
            <h2>お問い合わせ</h2>
            <p class="lead">ご不明な点ございましたら、お気軽にお問い合わせください的なテキストが入ります</p>
        </div>

        <div class="container">
            <div class="row contact-wrap wow fadeInDown"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="form-group">
                            <label>お名前 *</label>
                            <input type="text" name="name" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>メールアドレス *</label>
                            <input type="email" name="email" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>電話番号</label>
                            <input type="number" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>会社名</label>
                            <input type="text" class="form-control">
                        </div>                        
                    </div>
                    <div class="col-sm-5">
                        <div class="form-group">
                            <label>件名 *</label>
                            <input type="text" name="subject" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>お問い合わせ内容 *</label>
                            <textarea name="message" id="message" required class="form-control" rows="8"></textarea>
                        </div>                        
                        <div class="form-group">
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
</body>
</html>