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
<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
<!-- text fonts -->
<link rel="stylesheet" href="${context}/resources/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/resources/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="${context}/resources/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/ace-rtl.min.css" />
<!-- ace settings handler -->
<script src="${context}/resources/assets/js/ace-extra.min.js"></script>
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
<!------------------------------------------------------------------------------------------------------------------------->
</head>
<body class="no-skin">
	<jsp:include page="include/top-menu.jsp"></jsp:include>
	<jsp:include page="include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context }">Home</a></li>
					<li><a href="#">Other Pages</a></li>
					<li class="active">Error 404</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
	
			<div class="page-content">
				<div class="row">
					<div class="col-sm-7">
						<div class="section-seperator margin-b-50">
							<div class="margin-b-50">
								<div class="margin-b-30">
									<h2>NEWS HEADLINE</h2>
									<div id="headline">
									</div>
								</div>
								
							</div>
						</div>
						<div class="row">
							<div class="col-sm-10"><h2>RT NEWS IN CATEGORY</h2></div>
							<div class="col-sm-2">
								<i id="btnPlay" class="fa fa-play-circle-o fa-2x" style="cursor:pointer; margin-top:7px" title="start" onclick="rotation"></i>
								<i id="btnStop" class="fa fa-pause-circle-o fa-2x" style="cursor:pointer; margin-top:7px" title="pause"></i>
							</div>
						</div>
							
						<!-- Progress Box -->
						<div>
							<div class="tabbable">
								<ul class="nav nav-tabs nav-justified" id="myTab2">
									<li class="active">
										<a data-toggle="tab" href="#society" aria-expanded="true">
											<h4>사회</h4>
										</a>
									</li>
									<li class="">
										<a data-toggle="tab" href="#politics" aria-expanded="true">
											<h4>정치</h4>
										</a>
									</li>
									<li class="">
										<a data-toggle="tab" href="#economic" aria-expanded="true">
											<h4>경제</h4>
										</a>
									</li>
									<li class="">
										<a data-toggle="tab" href="#foreign" aria-expanded="true">
											<h4>국제</h4>
										</a>
									</li>
									<li class="">
										<a data-toggle="tab" href="#culture" aria-expanded="true">
											<h4>문화</h4>
										</a>
									</li>
									<li class="">
										<a data-toggle="tab" href="#entertain" aria-expanded="true">
											<h4>연예</h4>
										</a>
									</li>
									<li class="">
										<a data-toggle="tab" href="#digital" aria-expanded="true">
											<h4>IT</h4>
										</a>
									</li>
								</ul>
								<div class="tab-content"><br/>
									<div id="society" class="tab-pane fade active in">
										<div id="societyNews"></div>
									</div>
	
									<div id="politics" class="tab-pane fade">
										<div id="politicsNews"></div>
									</div>
	
									<div id="economic" class="tab-pane fade">
										<div id="economicNews"></div>
									</div>
									
									<div id="foreign" class="tab-pane fade">
										<div id="foreignNews"></div>
									</div>
	
									<div id="culture" class="tab-pane fade">
										<div id="cultureNews"></div>
									</div>
	
									<div id="entertain" class="tab-pane fade">
										<div id="entertainNews"></div>
									</div>
	
									<div id="digital" class="tab-pane fade">
										<div id="digitalNews"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- End Progress Box -->
					</div>
					<div class="col-sm-5 sm-margin-b-60">
						<div>
							<div class="tabbable">
								<ul class="nav nav-tabs nav-justified" id="myTab">
									<li class="active"><a data-toggle="tab" href="#kospi"
										aria-expanded="true">
											<h3>KOSPI</h3>
									</a></li>
	
									<li class=""><a data-toggle="tab" href="#kosdaq"
										aria-expanded="true">
											<h3>KOSDAQ</h3>
									</a></li>
								</ul>
	
								<div class="tab-content">
									<div id="kospi" class="tab-pane fade active in">
										<svg class="svg2" width="500" height="300"></svg>
									</div>
	
									<div id="kosdaq" class="tab-pane fade">
										<svg class="svg1" width="500" height="300"></svg>
									</div>
								</div>
							</div>
						</div>
						<br />
	
						<h4>
							<a href="#">즐겨찾기 인기 종목</a> 
							<span class="text-uppercase margin-l-20">favorite</span>
						</h4>
						<p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed
							tempor incdidunt ut laboret dolor magna ut consequat siad esqudiat
							dolor</p>
						<br />
						<h4>
							<a href="#">추천종목</a> <span class="text-uppercase margin-l-20">best</span>
						</h4>
						<p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed
							tempor incdidunt ut laboret dolor magna ut consequat siad esqudiat
							dolor</p>
					</div>
	
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
</div>
		<footer>
			<jsp:include page="include/bottom.jsp"></jsp:include>
		</footer>
	
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
									<img width="565" height="450" alt="565x450"
										src="${context}/resources/assets/images/gallery/image-1.jpg" />
								</div>
								<div class="item">
									<img width="565" height="450" alt="565x450"
										src="${context}/resources/assets/images/gallery/image-2.jpg" />
								</div>
								<div class="item">
									<img width="565" height="450" alt="565x450"
										src="${context}/resources/assets/images/gallery/image-3.jpg" />
								</div>
								<div class="item">
									<img width="565" height="450" alt="565x450"

										src="${context}/resources/assets/images/gallery/image-4.jpg" />
								</div>
								<div class="item">
									<img width="565" height="450" alt="565x450"
										src="${context}/resources/assets/images/gallery/image-5.jpg" />
								</div>
							</div>
						</div>
						<div class="bootbox-body">
							<form class="bootbox-form">
								<input type="checkbox" class="ace" value="noSee" /> 
								<span class="lbl"> 다시 보지 않음</span>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<c:choose>
							<c:when test="${ empty sessionScope.loginUser}">
								<button data-bb-handler="cancel" id="btnJoin" type="button"
									class="buttons button">회원가입</button>
								<button data-bb-handler="confirm" id="btnLogin" type="button"
									class="buttons button blue-btn">로그인&nbsp;</button>
							</c:when>
							<c:otherwise>
								<button data-bb-handler="confirm" id="btnLogout" type="button"
									class="buttons button blue-btn">로그아웃</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
<!-- javascript file -->
<script src="${context}/resources/assets/owlcarousel/owl.carousel.min.js"></script>
<script>
	$(document).ready(function() {
		//$('#myModal').modal();
		$('#btnLogin').click(function() {
			goLogin();
		});
		$('#btnJoin').click(function() {
			$('#myModal').modal('hide')
		});
		$('#btnLogout').click(function() {
			goLogout();
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
		setInterval(getNews("main",8),1000*60);
		
		// news받아오기
		getNews("main",8);
		getNews("society",5);
		getNews("politics",5);
		getNews("economic",5);
		getNews("foreign",5);
		getNews("culture",5);
		getNews("entertain",5);
		getNews("digital",5);
		
		//news탭 움직이기
		var slideTab;
		 slideTab = navtabSlide();
		$('#btnPlay').click(function(){
			console.log("start");
			slideTab = navtabSlide();
		});
		$('#btnStop').click(function(){
			clearInterval(slideTab);
			console.log("stop");
		});
	});
	
	navtabSlide = function() {
		var tab = ["#society","#politics","#economic","#foreign","#culture","#entertain","#digital"];
		var i = 0;
		interval = setInterval(function(){
			$('.nav-tabs a[href='+tab[i]+']').tab('show');
			i++;
			if(i > 6) i = 0;
		},10000);
		
		return interval;
		
	}
	
	getNews = function(code, num) {
		var param = "newsCode="+code+"&num="+num;
		
		$.ajax({
			url : "${context}/crawler/recentNews.json",
			method : 'get',
			data : param,
			success : function(json){
				var data = JSON.parse(json);
					if(code === "main"){
						$("#headline").empty();
						for(var i = 0;i<data.length;i++)
							setHeadline(data[i]);
					} else if(code ==="society"){
						for(var i = 0;i<data.length;i++)
							setSociety(data[i]);	
					} else if(code === "politics"){
						for(var i = 0;i<data.length;i++)
							setPolitics(data[i]);
					} else if(code === "economic"){
						for(var i = 0;i<data.length;i++)	
							setEconomic(data[i]);
					} else if(code === "foreign"){
						for(var i = 0;i<data.length;i++)
							setForeign(data[i]);
					} else if(code === "culture"){
						for(var i = 0;i<data.length;i++)
							setCulture(data[i]);
					} else if(code === "entertain"){
						for(var i = 0;i<data.length;i++)
							setEntertain(data[i]);
					} else if(code === "digital"){
						for(var i = 0;i<data.length;i++)
							setDigital(data[i]);
					}
					
			},
			error : function(e){
				console.log("error : "+ e);
			}
		});
	}
	setHeadline = function(data) {
		$('#headline').append("<p><h4><a href="+data.link+">"+data.title+"</a><br/></h4></p>");
	}
	setSociety = function(data) {
		$('#societyNews').append("<p><h3><a href="+data.link+">"+data.title+"</a><br/></h3></p>");
	}
	setPolitics = function(data) {
		$('#politicsNews').append("<p><h3><a href="+data.link+">"+data.title+"</a><br/></h3></p>");
	}
	setEconomic = function(data) {
		$('#economicNews').append("<p><h3><a href="+data.link+">"+data.title+"</a><br/></h3></p>");
	}
	setForeign = function(data) {
		$('#foreignNews').append("<p><h3><a href="+data.link+">"+data.title+"</a><br/></h3></p>");
	}
	setCulture = function(data) {
		$('#cultureNews').append("<p><h3><a href="+data.link+">"+data.title+"</a><br/></h3></p>");
	}
	setEntertain = function(data) {
		$('#entertainNews').append("<p><h3><a href="+data.link+">"+data.title+"</a><br/></h3></p>");
	}
	setDigital = function(data) {
		$('#digitalNews').append("<p><h3><a href="+data.link+">"+data.title+"</a><br/></h3></p>");
	}
	
		
	function goLogin() {
		location.href = "login.do"
	}
	
	function goLogout() {
		location.href = "logout.do"
	}

</script>
</body>
</html>