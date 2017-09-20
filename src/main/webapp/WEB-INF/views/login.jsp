<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${context}/assets/acecv/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${context}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">

<!-- PAGE LEVEL PLUGIN STYLES -->
<%-- <link href="${context}/assets/acecv/css/animate.css" rel="stylesheet"> --%>
<link href="${context}/assets/acecv/vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css" />

<!-- THEME STYLES -->
<link href="${context}/assets/acecv/css/layout.css" rel="stylesheet" type="text/css" />

<!--  Image Slider -->
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.theme.default.min.css" />

<!-- Favicon -->
<link rel="shortcut icon" href="${context}/favicon.ico" />
<title>PPT-제법 쓸만한 예측 툴</title>
</head>
<body id="body">
	<header class="header navbar-fixed-top">
		<!-- Navbar -->
		<nav class="navbar" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="menu-container js_nav-item">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="toggle-icon"></span>
					</button>

					<!-- Logo -->
					<div class="logo">
						<a class="logo-wrap" href="hello.do"> <img class="logo-img"
							src="${context}/assets/acecv/img/logo.png" alt="Asentus Logo">
						</a>
					</div>
					<!-- End Logo -->
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-collapse">
					<div class="menu-container">
						<ul class="nav navbar-nav navbar-nav-right">
							<li class="js_nav-item nav-item"><a
								class="nav-item-child nav-item-hover" href="hello.do">HOME</a></li>
							<li class="js_nav-item nav-item"><a
								class="nav-item-child nav-item-hover" href="#">기업검색</a></li>
							<li class="js_nav-item nav-item"><a
								class="nav-item-child nav-item-hover" href="#">사용자포트폴리오</a></li>
							<li class="js_nav-item nav-item"><a
								class="nav-item-child nav-item-hover" href="#">증권거래소</a></li>
							<li class="js_nav-item nav-item"><a
								class="nav-item-child nav-item-hover" href="login.do">로그인</a></li>
						</ul>
					</div>
				</div>
				<!-- End Navbar Collapse -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>
	<br/><br/><br/>
	<div class="container content-lg">
		<div class="row">
			<div class="col-sm-12">
					<div align="center">
						<h1>.PPT</h1>
					</div>
			</div>
		</div>
		<div class="row">
			<div align="center" class="section-seperator margin-b-50">
				<form id="loginForm" action="login.do" method="post">
					<input type="text" style="width:450px; height:50px" placeholder="&nbsp;&nbsp;아이디" autofocus><br/><br/>
					<input type="password" pattern="^[A-Za-z]*|[0-9]$" style="width:450px; height:50px" placeholder="&nbsp;&nbsp;패스워드" ><br/>
				</form>
				<br/><br/>
				<button id="btnLogin" class="btn-theme btn-theme-md btn-default-bg text-uppercase" style="font-size:20px">로그인</button>
			</div>
			<hr/>
		</div>
		<div class="row">
			<div align="center" >
				<div class="col-sm-12" align="center">
						<a href="#">아이디를 잊으셨나요?</a>/
						<a href="#">비밀번호를 잊으셨나요?</a>/
						<a href="#">회원가입</a>
				</div>
			</div>
		</div>
	</div>

	<!--========== FOOTER ==========-->
	<footer class="footer">
		<div class="content container">
			<div class="row">
				<div class="col-xs-6">
					<img class="footer-logo" src="${context}/assets/acecv/img/logo.png"
						alt="Acecv Logo">
				</div>
				<div class="col-xs-6 text-right sm-text-left">
					<p class="margin-b-0">
						<a class="fweight-700" href="hello.do">Acecv</a> Theme Powered by:
						<a class="fweight-700" href="http://www.keenthemes.com/">KeenThemes.com</a>
					</p>
				</div>
			</div>
			<!--// end row -->
		</div>
	</footer>

	<!-- javascript file -->
<script src="https://d3js.org/d3.v4.min.js"></script>
	<%-- <script src="${context}/assets/js/bootbox.js"></script> --%>

	<!-- CORE PLUGINS -->
	<!-- (Load javascripts at bottom, this will reduce page load time) -->
<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
<script src="${context}/assets/js/bootstrap.min.js"></script>
<script src="${context}/assets/acecv/vendor/jquery-migrate.min.js" type="text/javascript"></script>

	<!-- PAGE LEVEL PLUGINS -->
<script src="${context}/assets/acecv/vendor/jquery.parallax.min.js"	type="text/javascript"></script> --%>
<script src="${context}/assets/acecv/vendor/jquery.appear.js"
	type="text/javascript"></script>
<script src="${context}/assets/acecv/vendor/jquery.wow.min.js"
	type="text/javascript"></script>
<script
	src="${context}/assets/acecv/vendor/swiper/js/swiper.jquery.min.js"
	type="text/javascript"></script>

<!-- PAGE LEVEL SCRIPTS -->
<%-- <script src="${context}/assets/acecv/js/layout.js" type="text/javascript"></script> --%>
<script src="${context}/assets/acecv/js/components/progress-bar.min.js"
	type="text/javascript"></script>
<script src="${context}/assets/acecv/js/components/wow.min.js"
	type="text/javascript"></script>
<script src="${context}/assets/acecv/js/components/swiper.min.js"
		type="text/javascript"></script>
<script>
	$('document').ready(function(){
		$('#btnLogin').click(function(){
			$('#loginForm').
		})
	});
</script>
</body>
</html>