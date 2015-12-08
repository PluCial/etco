<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>
<%@ page import="com.etco.App" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/app/include-parts/html_head.jsp" />
</head>
	
<body class="info">

	<div class="body-inner">
		<!-- Header start -->
 		<jsp:include page="/app/include-parts/main_header.jsp" />
		<!-- Header end -->
    	
    	<!-- Main container start -->
	<section id="main-container">
		<article class="container">

			<header>
				<div>
					<span class="title-icon classic pull-left"><i class="fa fa-file-text-o"></i></span>
					<h2 class="title classic">プライバシーポリシー</h2>
					| <%=App.APP_DISPLAY_NAME %><small class="pull-right">v1: 2/10/2015</small>
				</div>
			</header>

			
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="faq-box">
						<p>
							<%=App.MANAGEMENT_COMPANY_NAME_JP %>（以下、「弊社」といいます。）は、弊社が提供する<%=App.APP_DISPLAY_NAME %>(<a href="//<%=App.APP_PRODUCTION_DOMAIN %>"><%=App.APP_PRODUCTION_DOMAIN %></a>)（以下、「本サービス」といいます。）で扱うお客様の個人情報保護の重要性について認識し、個人情報の保護に関する法律（以下「個人情報保護法」といいます。）を遵守すると共に、以下のプライバシーポリシー（以下「本プライバシーポリシー」といいます。）に従い、適切な取扱い及び保護に努めます。
						</p>
						
					</div>
						<div class="faq-box">
							
								<h3>１．個人情報の定義</h3>
							
							<p>本サービスにおける個人情報の定義としては、氏名、住所、電話番号、メールアドレス、生年月日、所属する会社名・団体名、役職、金融機関口座番号、クレジットカード番号、その他弊社が提供する本サービスのために必要な個人情報のうち1つもしくは2つを組み合わせることによって特定の個人を識別できるものとします。</p>
						</div>
						
						<div class="faq-box">
							
								<h3>２．個人情報の利用目的</h3>
							
							<p>弊社は、本サービスにおける個人情報について、プライバシーポリシーに則って、以下の範囲内でのみ利用します。個人情報に関する法令等により認められた場合、又は本人の同意がある場合を除き、この範囲を超えて利用することはありません。</p>
							<ul>
								<li>本サービスの提供と本サービスのご案内のため</li>
								<li>本サービスにおける提供サービス利用者とサービス提供者間の契約の円滑な履行のため</li>
								<li>本サービスの利用料金の請求や与信管理のため</li>
								<li>本サービスに関する各種連絡のため（メールマガジンやダイレクトメール、郵送物、プレゼント発送等も含みます。）</li>
								<li>本サービスにおける広告配信のため</li>
								<li>各種キャンペーンやアンケートの実施業務</li>
								<li>本サービスの利用状況の把握や統計データの作成のため</li>
								<li>今後の本サービスの改善や新サービスの開発のため</li>
								<li>本サービス運用によって生じた紛争やトラブルの解決のため</li>
								<li>本サービスに関するお問合せ等への対応のため</li>
								<li>その他上記利用目的に付随する目的のため</li>
								<li>その他ユーザーに連絡する必要が生じたときのため</li>
							</ul>
						</div>
						
						<div class="faq-box">
							
								<h3>３．個人情報の第三者提供</h3>
							
							<p>弊社は以下に定める場合を除き、個人情報を第三者に提供しません。</p>
							<ul>
								<li>事前に本人からの同意がある場合</li>
								<li>弊社が第三者との間で合併・分割・事業譲渡により事業の承継を行う場合</li>
								<li>法令に基づく場合</li>
								<li>人の生命、身体又は財産の保護のために必要がある場合であって、本人の同意を得ることが困難である場合</li>
								<li>公衆衛生の向上又は児童の健全な育成の推進のために特に必要がある場合であって、本人の同意を得ることが困難である場合</li>
								<li>国の機関もしくは地方公共団体又はその委託を受けた者が法令の定める事務を遂行することに対して協力する必要がある場合であって、本人の同意を得ることにより当該事務の遂行に支障を及ぼすおそれがある場合</li>
								<li>弊社と守秘義務契約を結んだ業務提携先との依頼・協力関係において上記個人情報の利用目的の達成のために必要最低限の範囲内において個人情報の取扱いの委託が発生する場合</li>
								<li>事前クレジットカード決済の利用に関し、第三者利用の調査など正当な目的に基づき、クレジットカード会社から開示請求があった場合</li>
							</ul>
							<p>弊社の保管する提供サービス利用者の個人情報については、本サービスを運営するにあたって必要最低限の範囲内において、本人の利用する提供サービスのサービス提供者と共同して利用するものとします。</p>
							<p>また、事前クレジットカード決済を行うためのユーザーのクレジットカードの情報は、直接決済代行会社およびクレジットカード会社に送られるものとします。</p>
						</div>
						
						<div class="faq-box">
							
								<h3>４．個人情報の安全管理</h3>
							
							<p>不正アクセスや脆弱性の対策、個人情報管理責任者の設置、従業員の教育を通じて弊社は個人情報を適切に管理します。弊社が個人情報の取引先を外部に委託する場合は、守秘義務契約を締結し適切な管理を実施します。</p>
						</div>
						
						<div class="faq-box">
							
								<h3>５．アクセス統計情報の利用について</h3>
							
							<p>弊社はアクセスログ等のデータを収集し、個人を特定できない形で統計情報として今後の本サービスの改善や本サービス利用動向の調査に用いることがあります。当該統計データについては本プライバシーポリシーの定める個人情報の対象外とします。</p>
						</div>
						
						<div class="faq-box">
							
								<h3>６．クッキー及びその他の技術について</h3>
							
							<p>本サービスにおいては、ユーザーのcookieやウェブビーコン、その他の技術を利用動向の把握やより効率的な広告運用や検索エンジンからの流入、一時的な情報の保持のために利用します。cookieに保存される情報には個人情報自体は含まれません。また、cookieの受け入れを無効とした場合、本サービスの大部分の機能をご利用いただけなくなる可能性がありますのでご注意ください。</p>
						</div>
						
						<div class="faq-box">
							
								<h3>７．個人情報の利用停止、訂正の求め</h3>
							
							<p>弊社は個人情報の開示、修正、削除、利用停止等について本人確認を実施の上、法令の定めに従い対応し、書面又はメールにて回答します。ただし、個人情報に関する法規制その他の法令により弊社が対応の義務を負わない場合は、この限りではありません。</p>
						</div>
						
						<div class="faq-box">
							
								<h3>８．本プライバシーポリシーの変更について</h3>
							
							<p>弊社は本プライバシーポリシーを全部又は一部改定する場合があります。変更がある場合は、本サービス上に掲出します。</p>
						</div>
	          		

				</div><!-- End col-md-6 -->
			</div><!-- Content row  end -->

		</article><!--/ container end -->

	</section><!--/ Main container end -->
	

		<!-- Footer start -->
		<jsp:include page="/app/include-parts/main_footer.jsp" />
		<!--/ Footer end -->
	
	</div><!-- Body inner end -->
	
	<!-- javaScript start -->
	<jsp:include page="/app/include-parts/html_script.jsp" />
	<!-- javaScript end -->
	
</body>
</html>