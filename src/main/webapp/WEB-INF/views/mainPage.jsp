<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="responsive photo gallery using colorbox" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<title>PPT-제법 쓸만한 예측 툴</title>
<link rel="stylesheet" href="${context}/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${context}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- page specific plugin styles -->
<link rel="stylesheet"
	href="${context}/assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet"
	href="${context}/assets/css/jquery.gritter.min.css" />

<!-- text fonts -->
<link rel="stylesheet"
	href="${context}/assets/css/fonts.googleapis.com.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${context}/assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
<link rel="stylesheet" href="${context}/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${context}/assets/css/ace-rtl.min.css" />

<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.theme.default.min.css" />

<script src="${context}/assets/js/ace-extra.min.js"></script>

</head>
<body>
	<header>
		<h1>header part</h1>
		<hr style="border: 2px solid" />
	</header>
	<section>
		메인페이지입니다<br /> 홈 화면이 될수도 있습니다.<br />&nbsp;&nbsp;
		<button class="btn" id="btnLogin" onclick="goLogin()">login</button>
	</section>
	<footer> footer part </footer>

	<div class="bootbox modal fade bootbox-prompt in" id="myModal"
		tabindex="-1" role="dialog" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="bootbox-close-button close"
						data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">PPT 모달</h4>
				</div>
				<div class="modal-body">
					<div class="bootbox-form" data-rel="colorbox">
						<!-- Slides Container -->
						<div class="owl-carousel owl-theme">
							<div class="item">
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-1.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-2.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-3.jpg" />
							</div>
						</div>
					</div>
					<div class="bootbox-body">
						<form class="bootbox-form">
							<input type="checkbox" class="ace" value="noSee" /> <span
								class="lbl"> 다시 보지 않음</span>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button data-bb-handler="cancel" id="btnCancel" type="button"
						class="btn btn-default">회원가입</button>
					<button data-bb-handler="confirm" id="btnOK" type="button"
						class="btn btn-primary">로그인하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- javascript file -->
	<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
	<script src="${context}/assets/js/bootstrap.min.js"></script>
	<script src="${context}/assets/js/jquery-ui.custom.min.js"></script>
	<script src="${context}/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="${context}/assets/js/bootbox.js"></script>
	<script src="${context}/assets/js/jquery.easypiechart.min.js"></script>
	<script src="${context}/assets/js/jquery.gritter.min.js"></script>
	<script src="${context}/assets/js/jquery.colorbox.min.js"></script>
	<script src="${context}/assets/js/spin.js"></script>
	<script src="${context}/assets/owlcarousel/owl.carousel.js"></script>
	<!-- ace scripts -->
	<script src="${context}/assets/js/ace-elements.min.js"></script>
	<script src="${context}/assets/js/ace.min.js"></script>

	<script>
		$(document).ready(
				function() {
					$('#myModal').modal();
					$('#btnOK').click(function() {
						goLogin();
					});
					$('#btnCancel').click(function() {
						$('#myModal').modal('hide')
					});
					$('.owl-carousel').owlCarousel({
		                margin: 10,
						loop: true,
		                dots : true,
		                responsiveClass : true,
		                responsive:{
		                	0:{
		                		items:1,
		                		nav:true,
		                		dots:true
		                	}
		                }
		            });
				});
		function goLogin(){
			location.href = "login.do"
		}
	</script>
</body>
</html>