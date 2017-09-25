<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="responsive photo gallery using colorbox" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<title>PPT-제법 쓸만한 예측 툴</title>
<link rel="stylesheet" href="${context}/assets/acecv/vendor/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${context}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

<!-- GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">

<!-- PAGE LEVEL PLUGIN STYLES -->
<link href="${context}/assets/acecv/vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css" />

<!-- THEME STYLES -->
<link href="${context}/assets/acecv/css/layout.min.css" rel="stylesheet" type="text/css" />

<!--  Image Slider -->
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.theme.default.min.css" />

<!-- Favicon -->
<link rel="shortcut icon" href="${context}/favicon.ico"/>
<link rel="stylesheet" href="${context}/assets/css/bootstrap.min.css" />


<!-- text fonts -->
<link rel="stylesheet" href="${context}/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

<!-- page specific plugin styles -->
<link rel="stylesheet" href="${context}/assets/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="${context}/assets/css/bootstrap-multiselect.min.css" />
<link rel="stylesheet" href="${context}/assets/css/select2.min.css" />
<link rel="stylesheet" href="${context}/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${context}/assets/css/ace-rtl.min.css" />
<script src="${context}/assets/js/ace-extra.min.js"></script>


</head>
<body id="body" data-spy="scroll" data-target=".header">
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
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="hello.do">HOME</a>
							</li>
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="#">기업검색</a>
							</li>
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="#">사용자포트폴리오</a>
							</li>
							<li class="js_nav-item nav-item">
								<a class="nav-item-child nav-item-hover" href="#">증권거래소</a>
							</li>
							<c:choose>
							<c:when test="${ empty sessionScope.loginUser}">
								<li class="js_nav-item nav-item">
									<a class="nav-item-child nav-item-hover" href="login.do">로그인</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="js_nav-item nav-item">
									<a class="nav-item-child nav-item-hover" href="myPage.do">마이페이지</a>
								</li>
								<li class="js_nav-item nav-item">
									<a class="nav-item-child nav-item-hover" href="logout.do">로그아웃</a>
								</li>
							</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<!-- End Navbar Collapse -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>

	<!--========== PAGE LAYOUT ==========-->

	<!-- Experience -->
	<div class="content-lg">
		<div class="main-container ace-save-state">
			<div class="container">
				<div class="main-content">
					<div class="main-content-inner">
						<div class="page-content">
							<div class="col-sm-10" id="chart">
								<iframe src="${context}/company/chart.do?name=${name}" width="100%" height="700px" frameBorder="0">
								
								</iframe>
							</div>
							<div class="col-sm-2">
								<div class="row">
									<div class="form-group">
										<div class="pos-rel">
											<input class="typeahead scrollable" type="text"placeholder="기업검색" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="section-seperator margin-b-50">
										<div class="margin-b-50">
											<div class="margin-b-30">
												<h2>최근기사</h2>
												<div id="news">
												</div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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

<!-- Image Slider -->
<script src="${context}/assets/owlcarousel/owl.carousel.js"></script>

<script src="${context}/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${context}/assets/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="${context}/assets/js/jquery.raty.min.js"></script>
<script src="${context}/assets/js/bootstrap-multiselect.min.js"></script>
<script src="${context}/assets/js/select2.min.js"></script>
<script src="${context}/assets/js/jquery-typeahead.js"></script>

<!-- ace scripts -->
<script src="${context}/assets/js/ace-elements.min.js"></script>
<script src="${context}/assets/js/ace.min.js"></script>
<script>
	$(document).ready(function() {
		$('#myModal').modal();
		$('#btnLogin').click(function() {
			goLogin();
		});
		$('#btnJoin').click(function() {
			$('#myModal').modal('hide')
		});
		$('#btnLogout').click(function() {
			geLogout();
		});
		$('.owl-carousel').owlCarousel({
			margin : 10,
			loop : true,
			dots : true,
			responsiveClass : true,
			responsive : {
				0 : {
					items : 1,
					nav : true,
					dots : true
				}
			}
		});
	
		
	function goLogin() {
		location.href = "login.do"
	}
	
	function goLogout() {
		location.href = "logout.do"
	}
	$(document).on("click",".tt-suggestion.tt-selectable",function(){
		change();
	});
	$("input.typeahead").keydown(function (key) {
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	change();
        }
    });
	function change(){
		var comName;
		if($('input.typeahead')[1].value != $('input.typeahead')[0].value && $('input.typeahead')[0].value != ''){
			comName = $('input.typeahead')[0].value;
		}else{
			comName = $('input.typeahead')[1].value;
		}
		var tag = '<iframe src="${context}/company/chart.do?name='+comName+'" width="100%" height="700px" frameBorder="0"></iframe>'
		$('#chart').html(tag);
		$.ajax({
			url : "${context}/crawler/comNews.json?name="+comName,
			success : function(data){
				var obj = []
				obj = JSON.parse(data);
				console.log(obj);
				$('#news').empty();
				for(var i = 0;i<obj.length;i++){
					$('#news').append('<p><a href="'+obj[i].link+'">'+obj[i].title+"</a><br/></p>");
				}
			},
			error : function(e){
				console.log("error : "+ e);
			}
		});
	}
});
</script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
			var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox(
							{
								infoTextFiltered : '<span class="label label-purple label-lg">Filtered</span>'
							});
			var container1 = demo1.bootstrapDualListbox('getContainer');
			container1.find('.btn').addClass('btn-white btn-info btn-bold');
			var comList = [];
			<c:forEach items="${comList}" var="companyVO">
				comList.push("${companyVO.name}");
			</c:forEach>
			//typeahead.js
			//example taken from plugin's page at: https://twitter.github.io/typeahead.js/examples/
			var substringMatcher = function(strs) {
				return function findMatches(q, cb) {
					var matches, substringRegex;
					
					// an array that will be populated with substring matches
					matches = [];

					// regex used to determine if a string contains the substring `q`
					substrRegex = new RegExp(q, 'i');

					$.each(strs, function(i, str) {
						if (substrRegex.test(str)) {
							matches.push({
								value : str
							});
						}
					}); 
					cb(matches);
				}
			}
			$('input.typeahead').typeahead({
				hint : true,
				highlight : true,
				minLength : 0
			}, {
				name : 'company',
				displayKey : 'value',
				source : substringMatcher(comList),
				limit : 10
			});

			///////////////
			
		});
	</script>
</body>
</html>