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

	<!--========== PAGE LAYOUT ==========-->

	<!-- Experience -->
	<div id="experience">
		<div class="row">
			<div class="container content-lg">
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

					<h2>RT NEWS IN CATEGORY</h2>
					<!-- Progress Box -->
					<div>
						<div class="tabbable">
							<ul class="nav nav-tabs nav-justified" id="myTab2">
								<li class="active"><a data-toggle="tab" href="#society"
									aria-expanded="true">
										<h4>사회</h4>
								</a></li>
								<li class=""><a data-toggle="tab" href="#politics"
									aria-expanded="true">
										<h4>정치</h4>
								</a></li>
								<li class=""><a data-toggle="tab" href="#economic"
									aria-expanded="true">
										<h4>경제</h4>
								</a></li>
								<li class=""><a data-toggle="tab" href="#foreign"
									aria-expanded="true">
										<h4>국제</h4>
								</a></li>
								<li class=""><a data-toggle="tab" href="#culture"
									aria-expanded="true">
										<h4>문화</h4>
								</a></li>
								<li class=""><a data-toggle="tab" href="#entertain"
									aria-expanded="true">
										<h4>연예</h4>
								</a></li>
								<li class=""><a data-toggle="tab" href="#digital"
									aria-expanded="true">
										<h4>기술</h4>
								</a></li>
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
		</div>
	</div>
	<!--========== END PAGE LAYOUT ==========-->

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
						<a class="fweight-700" href="login.do">Acecv</a> Theme Powered by:
						<a class="fweight-700" href="http://www.keenthemes.com/">KeenThemes.com</a>
					</p>
				</div>
			</div>
			<!--// end row -->
		</div>
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
									src="${context}/assets/images/gallery/image-1.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"
									src="${context}/assets/images/gallery/image-2.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"
									src="${context}/assets/images/gallery/image-3.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"
									src="${context}/assets/images/gallery/image-4.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"
									src="${context}/assets/images/gallery/image-5.jpg" />
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
<script>
	$(document).ready(function() {
		//$('#myModal').modal();
		$('#btnOK').click(function() {
			goLogin();
		});
		$('#btnCancel').click(function() {
			$('#myModal').modal('hide')
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
		lineMultiChart("data.tsv");
		lineChart("data2.tsv");
		
		getNews("main",8);
		getNews("society",5);
		getNews("politics",5);
		getNews("economic",5);
		getNews("foreign",5);
		getNews("culture",5);
		getNews("entertain",5);
		getNews("digital",5);
		
		navtabSlide();
	});
	
	navtabSlide = function() {
		var tab = ["#society","#politics","#economic","#foreign","#culture","#entertain","#digital"];
		var i = 1;
		setInterval(function(){
			$('.nav-tabs a[href='+tab[i]+']').tab('show');
			i++;
			if(i > 6) i = 0;
		},4000);
		
	}
	
	sleep = function(ms) {
		ts1 = new Date().getTime() + ms;
		do ts2 = new Date().getTime();
		while (ts2<ts1);
	}
	getNews = function(code, num) {
		var param = "newsCode="+code+"&num="+num;
		
		$.ajax({
			url : "http://222.106.22.63:8080/ppt/crawler/recentNews.do",
			method : 'get',
			data : param,
			dataType : "jsonp",
			success : function(data){
					if(code === "main"){
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
		$('#headline').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	setSociety = function(data) {
		$('#societyNews').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	setPolitics = function(data) {
		$('#politicsNews').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	setEconomic = function(data) {
		$('#economicNews').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	setForeign = function(data) {
		$('#foreignNews').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	setCulture = function(data) {
		$('#cultureNews').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	setEntertain = function(data) {
		$('#entertainNews').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	setDigital = function(data) {
		$('#digitalNews').append("<p><a href="+data.link+">"+data.title+"</a><br/></p>");
	}
	
		
	function goLogin() {
		location.href = "login.do"
	}

	lineMultiChart = function(file) {
		var svg = d3.select(".svg1"), margin = { top : 20, right : 80, bottom : 30,	left : 50 },
			width = svg.attr("width") - margin.left - margin.right, 
			height = svg.attr("height")	- margin.top - margin.bottom, 
			g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		var parseTime = d3.timeParse("%Y%m%d");

		var x = d3.scaleTime().range([ 0, width ]), 
			y = d3.scaleLinear().range([ height, 0 ]), 
			z = d3.scaleOrdinal(d3.schemeCategory10);

		var line = d3.line().curve(d3.curveBasis)
			.x(function(d) { return x(d.date); })
			.y(function(d) { return y(d.temperature); });

		d3.tsv(file, type, function(error, data) {
			if (error)
				throw error;

			var cities = data.columns.slice(1).map(function(id) {
				return {
					id : id,
					values : data.map(function(d) {
						return {
							date : d.date,
							temperature : d[id]
						};
					})
				};
			});

			x.domain(d3.extent(data, function(d) { return d.date; }));

			y.domain([ d3.min(cities, function(c) {
				return d3.min(c.values, function(d) {
					return d.temperature;
				});
			}), d3.max(cities, function(c) {
				return d3.max(c.values, function(d) {
					return d.temperature;
				});
			}) ]);

			z.domain(cities.map(function(c) { return c.id; }));

			g.append("g").attr("class", "axis axis--x")
			.attr("transform", "translate(0," + height + ")").call(d3.axisBottom(x));

			g.append("g").attr("class", "axis axis--y")
					.call(d3.axisLeft(y)).append("text")
					.attr("transform", "rotate(-90)").attr("y", 6)
					.attr("dy", "0.71em").attr("fill", "#000").text("Temperature, ºF");

			var city = g.selectAll(".city").data(cities).enter()
					.append("g").attr("class", "city");

			city.append("path").attr("class", "line")
			.attr("d", function(d) {
						return line(d.values);
					}).style("stroke", function(d) {
				return z(d.id);
			});

			city.append("text").datum(function(d) {
				return {
					id : d.id,
					value : d.values[d.values.length - 1]
				};
			}).attr("transform", function(d) { 
				return "translate(" + x(d.value.date) + ","	+ y(d.value.temperature) + ")";	})
				.attr("x", 3).attr("dy", "0.35em").style("font", "10px sans-serif")
				.text(function(d) {
					return d.id;
				});
			});

		function type(d, _, columns) {
			d.date = parseTime(d.date);
			for (var i = 1, n = columns.length, c; i < n; ++i)
				d[c = columns[i]] = +d[c];
			return d;
		}
	}

	lineChart = function(file) {
		
		var svg = d3.select(".svg2"), 
			margin = { top : 20, right : 20, bottom : 30, left : 50	}, 
			width = +svg.attr("width") - margin.left - margin.right, 
			height = +svg.attr("height") - margin.top - margin.bottom, 
			g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		var parseTime = d3.timeParse("%d-%b-%y");

		var x = d3.scaleTime().rangeRound([ 0, width ]);

		var y = d3.scaleLinear().rangeRound([ height, 0 ]);

		var line = d3.line().x(function(d) { return x(d.date); })
							.y(function(d) { return y(d.close);	});

		d3.tsv(file, function(d) {
			d.date = parseTime(d.date);
			d.close = +d.close;
			return d;
		}, function(error, data) {
			if (error) throw error;

			x.domain(d3.extent(data, function(d) { return d.date; }));
			y.domain(d3.extent(data, function(d) { return d.close; }));

			g.append("g").attr("transform", "translate(0," + height + ")")
					.call(d3.axisBottom(x)).select(".domain").remove();

			g.append("g").call(d3.axisLeft(y)).append("text").attr("fill", "#000")
					.attr("transform", "rotate(-90)").attr("y", 6).attr("dy", "0.71em")
					.attr("text-anchor", "end").text("Price ($)");

			g.append("path").datum(data).attr("fill", "none")
					.attr("stroke", "steelblue").attr("stroke-linejoin", "round")
					.attr("stroke-linecap", "round").attr("stroke-width", 1.5).attr("d", line);
		});
	}
</script>
</body>
</html>