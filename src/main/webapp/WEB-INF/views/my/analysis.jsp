<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>PPT-제법 쓸만한 예측 툴</title>
<!-- Main import -->
<!-- Zerif -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/owl.theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/jquery.vegas.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/zerif/css/animate.min.css">
<link href="${pageContext.request.contextPath }/resources/zerif/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/zerif/css/response.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
<!-- text fonts -->
<link rel="stylesheet" href="${context}/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<!------------------------------------------------------------------------------------------------------------------------------------>
</head>
<body>
	<jsp:include page="../include/top-menu.jsp" />
	<!-- Experience -->
	<section class="works" id="works">
		<div class="container">
			<!-- SECTION HEADER -->
			<div class="section-header">
				<!-- SECTION TITLE -->
				<h2 class="dark-text">나만의 사전</h2>
				<!-- SHORT DESCRIPTION ABOUT THE SECTION -->
				<h6>설명</h6>
			</div>
			<!-- / END SECTION HEADER -->
			<div class="row projects">
				<div id="loader">
					<div class="loader-icon"></div>
				</div>
				<div class="col-md-12" id="portfolio-list">
					<!-- PORTFOLIO ITEMS-->
					<ul class="cbp-rfgrid">

						<!-- PROJECT -->
						<li class="wow fadeInLeft animated animated" data-wow-offset="30"
							data-wow-duration="1.5s" data-wow-delay="0.15s"
							style="visibility: visible; -webkit-animation-duration: 1.5s; -moz-animation-duration: 1.5s; animation-duration: 1.5s; -webkit-animation-delay: 0.15s; -moz-animation-delay: 0.15s; animation-delay: 0.15s;">
							<a href="${context }/my/analysis/first.do" class="more">
								<img src="${context }/resources/blur-1853262_1280.jpg" alt="project">
								<div class="project-info">
									<div class="project-details">
										<h5 class="white-text red-border-bottom">나만의 분석 만들기</h5>
										<div class="details white-text">Create custom analysis</div>
									</div>
								</div> 
							</a>
						</li>
						<!-- / PROJECT -->
					</ul>
				</div>
				<!-- END OF PORTFOLIO ITEMS-->
			</div>

			<!-- PROJECT DETAILS WILL BE LOADED HERE -->
			<div id="loaded-content"></div>

			<a id="back-button" class="red-btn" href="#"><i
				class="icon-fontawesome-webfont-27"></i> Go Back</a>

		</div>
		<!-- / END CONTAINER -->
	</section>
	<jsp:include page="../include/bottom.jsp" />
</body>
</html>