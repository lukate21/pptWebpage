<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="${context}/assets/acecv/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${context}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700"
	rel="stylesheet" type="text/css">
<%-- <link href="${context}/assets/acecv/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css" /> --%>

<!-- PAGE LEVEL PLUGIN STYLES -->
<%-- <link href="${context}/assets/acecv/css/animate.css" rel="stylesheet"> --%>
<link href="${context}/assets/acecv/vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css" />

<!-- THEME STYLES -->
<link href="${context}/assets/acecv/css/layout.min.css" rel="stylesheet" type="text/css" />

<!--  Image Slider -->
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.theme.default.min.css" />

<!-- Favicon -->
<link rel="shortcut icon" href="${context}/favicon.ico"/>
<style>
.axis--x path {
	display: none;
}

.line {
	fill: none;
	stroke: steelblue;
	stroke-width: 1.5px;
}
</style>
<title>PPT-제법 쓸만한 예측 툴</title>
</head>
<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">PPT </span>
									<span class="grey" id="id-text2">제법 쓸만한 예측 툴</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; .PPT</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-pencil-square-o green"></i>
												제법 쓸만한 예측 툴 PPT입니다
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> Remember Me</span>
														</label>

														<button type="button" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">Login</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>
											
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													비밀번호를 잊어버렸어요
												</a>
											</div>

											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													회원가입
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												비밀번호 재발급
											</h4>

											<div class="space-6"></div>
											<p>
												이메일을 입력해주시면 임시번호를 전송해 드립니다
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">전송</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												Back to login
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												회원가입
											</h4>

											<div class="space-6"></div>
											<p> 회원가입에 필요한 정보입니다: </p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Repeat password" />
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="tel" class="form-control" placeholder="Tel" />
															<i class="ace-icon fa fa-mobile-phone"></i>
														</span>
													</label>

													<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															모든 
															<a href="#">사용자 약관</a>
															에 동의합니다.
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">초기화</span>
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success">
															<span class="bigger-110">가입완료</span>

															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												돌아가기
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- javascript file -->
<script src="https://d3js.org/d3.v4.min.js"></script>
<%-- <script src="${context}/assets/js/bootbox.js"></script> --%>

<!-- CORE PLUGINS -->
<!-- (Load javascripts at bottom, this will reduce page load time) -->
<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
<script src="${context}/assets/js/bootstrap.min.js"></script>
<script src="${context}/assets/acecv/vendor/jquery-migrate.min.js" type="text/javascript"></script>

<!-- PAGE LEVEL PLUGINS -->
<%-- <script src="${context}/assets/acecv/vendor/jquery.easing.js" type="text/javascript"></script>
<script src="${context}/assets/acecv/vendor/jquery.back-to-top.js" type="text/javascript"></script>
<script src="${context}/assets/acecv/vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
<script src="${context}/assets/acecv/vendor/jquery.parallax.min.js"	type="text/javascript"></script> --%>
<script src="${context}/assets/acecv/vendor/jquery.appear.js" type="text/javascript"></script>
<script src="${context}/assets/acecv/vendor/jquery.wow.min.js" type="text/javascript"></script>
<script	src="${context}/assets/acecv/vendor/swiper/js/swiper.jquery.min.js"	type="text/javascript"></script>

<!-- PAGE LEVEL SCRIPTS -->
<%-- <script src="${context}/assets/acecv/js/layout.js" type="text/javascript"></script> --%>
<script src="${context}/assets/acecv/js/components/progress-bar.min.js"	type="text/javascript"></script>
<script src="${context}/assets/acecv/js/components/wow.min.js" type="text/javascript"></script>
<script src="${context}/assets/acecv/js/components/swiper.min.js" type="text/javascript"></script>

	</body>
</html>