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
<link rel="stylesheet" href="${context}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${context}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
	
<!-- GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700" rel="stylesheet" type="text/css">
<link href="${context}/assets/acecv/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css"/>
<link href="${context}/assets/acecv/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

<!-- PAGE LEVEL PLUGIN STYLES -->
<link href="${context}/assets/acecv/css/animate.css" rel="stylesheet">
<link href="${context}/assets/acecv/vendor/swiper/css/swiper.min.css" rel="stylesheet" type="text/css"/>

<!-- THEME STYLES -->
<link href="${context}/assets/acecv/css/layout.min.css" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="${context}/assets/owlcarousel/assets/owl.theme.default.min.css" />
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
						<a class="logo-wrap" href="hello.do"> 
							<img class="logo-img" src="${context}/assets/acecv/img/logo.png" alt="Asentus Logo">
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
								<a	class="nav-item-child nav-item-hover" href="#">기업검색</a>
							</li>
							<li class="js_nav-item nav-item">
								<a	class="nav-item-child nav-item-hover" href="#">사용자포트폴리오</a>
							</li>
							<li class="js_nav-item nav-item">
								<a	class="nav-item-child nav-item-hover" href="#">증권거래소</a>
							</li>
							<li class="js_nav-item nav-item">
								<a	class="nav-item-child nav-item-hover" href="login.do">로그인</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- End Navbar Collapse -->
			</div>
		</nav>
		<!-- Navbar -->
	</header>

	<!--========== PAGE LAYOUT ==========-->
    <!-- About -->
	<div id="about">
		<div class="row">
			<div class="container content-sm">
				<!-- // end row -->
			</div>
		</div>
	</div>
	<!-- End About -->

	<!-- Experience -->
	<div id="experience">
		<div class="row">
			<div class="container">
				<div class="col-sm-7">
					<div class="section-seperator margin-b-50">
						<div class="margin-b-50">
							<div class="margin-b-30">
								<h2>NEWS HEADLINE</h2>
								<p>I'm Alisa Portman, orem ipsum dolor sit amet, consectetur
									adipisicing elit, sed do eiusmod tempor incididunt ut labore et
									dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
									exercitation ullamco laboris nisi ut aliquip ex ea commodo
									consequat.</p>
								<p>Duis aute irure dolor in reprehenderit in voluptate velit
									esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
									occaecat cupidatat non proident, sunt in culpa qui officia
									deserunt mollit anim id est laborum.</p>
							</div>
							<a href="#"	class="btn-theme btn-theme-md btn-default-bg text-uppercase">
								Download my CV
							</a>
						</div>
					</div>

					<h2>RT NEWS IN CATEGORY</h2>
					<!-- Progress Box -->
					<div class="progress-box">
						<h5>
							Adobe Illustrator <span class="color-heading pull-right">87%</span>
						</h5>
						<div class="progress">
							<div class="progress-bar bg-color-base" role="progressbar" data-width="87"></div>
						</div>
					</div>
					<div class="progress-box">
						<h5>
							Adobe Photoshop <span class="color-heading pull-right">96%</span>
						</h5>
						<div class="progress">
							<div class="progress-bar bg-color-base" role="progressbar" data-width="96"></div>
						</div>
					</div>
					<div class="progress-box">
						<h5>
							Graphic Design <span class="color-heading pull-right">77%</span>
						</h5>
						<div class="progress">
							<div class="progress-bar bg-color-base" role="progressbar" data-width="77"></div>
						</div>
					</div>
					<!-- End Progress Box -->
				</div>
				<div class="col-sm-5 sm-margin-b-60">
					<div>
						<div class="tabbable">
							<ul class="nav nav-tabs nav-justified" id="myTab">
								<li class="active">
									<a data-toggle="tab" href="#kospi" aria-expanded="true">
										<h3>KOSPI</h3>
									</a>
								</li>

								<li class="">
									<a data-toggle="tab" href="#kosdaq" aria-expanded="true">
										<h3>KOSDAQ</h3>
									</a>
								</li>
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
						<a href="#">추천종목</a> 
						<span class="text-uppercase margin-l-20">best</span>
					</h4>
					<p>Lorem ipsum dolor sit amet consectetur adipiscing elit sed
						tempor incdidunt ut laboret dolor magna ut consequat siad esqudiat
						dolor</p>
				</div>
			</div>
		</div>
	</div>
	<!-- End Experience -->

	<!-- End Contact -->
        <!--========== END PAGE LAYOUT ==========-->
	<!--========== FOOTER ==========-->
        <footer class="footer">
            <div class="content container">
                <div class="row">
                    <div class="col-xs-6">
                        <img class="footer-logo" src="${context}/assets/acecv/img/logo.png" alt="Acecv Logo">
                    </div>
                    <div class="col-xs-6 text-right sm-text-left">
                        <p class="margin-b-0"><a class="fweight-700" href="login.do">Acecv</a> Theme Powered by: <a class="fweight-700" href="http://www.keenthemes.com/">KeenThemes.com</a></p>
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
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-1.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-2.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-3.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-4.jpg" />
							</div>
							<div class="item">
								<img width="565" height="450" alt="565x450"	src="${context}/assets/images/gallery/image-5.jpg" />
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
	<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
	<script src="${context}/assets/js/bootstrap.min.js"></script>
	<script src="${context}/assets/js/bootbox.js"></script>
	<script src="${context}/assets/owlcarousel/owl.carousel.js"></script>
	
	 <!-- CORE PLUGINS -->
    <script src="${context}/assets/acecv/vendor/jquery-migrate.min.js" type="text/javascript"></script>
	<!-- PAGE LEVEL PLUGINS -->
     <script src="${context}/assets/acecv/vendor/jquery.easing.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/vendor/jquery.back-to-top.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/vendor/jquery.wow.min.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/vendor/jquery.parallax.min.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/vendor/jquery.appear.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/vendor/swiper/js/swiper.jquery.min.js" type="text/javascript"></script>
	 <!-- PAGE LEVEL SCRIPTS -->
     <script src="${context}/assets/acecv/js/layout.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/js/components/progress-bar.min.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/js/components/swiper.min.js" type="text/javascript"></script>
     <script src="${context}/assets/acecv/js/components/wow.min.js" type="text/javascript"></script>
	<!-- ace scripts -->
	<%-- <script src="${context}/assets/js/ace-elements.min.js"></script>
	<script src="${context}/assets/js/ace.min.js"></script>
 --%>
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
		
	var svg = d3.select(".svg1"),
	    margin = {top: 20, right: 80, bottom: 30, left: 50},
	    width = svg.attr("width") - margin.left - margin.right,
	    height = svg.attr("height") - margin.top - margin.bottom,
	    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	var parseTime = d3.timeParse("%Y%m%d");

	var x = d3.scaleTime().range([0, width]),
	    y = d3.scaleLinear().range([height, 0]),
	    z = d3.scaleOrdinal(d3.schemeCategory10);

	var line = d3.line()
	    .curve(d3.curveBasis)
	    .x(function(d) { return x(d.date); })
	    .y(function(d) { return y(d.temperature); });

	d3.tsv("data.tsv", type, function(error, data) {
	  if (error) throw error;

	  var cities = data.columns.slice(1).map(function(id) {
	    return {
	      id: id,
	      values: data.map(function(d) {
	        return {date: d.date, temperature: d[id]};
	      })
	    };
	  });
	  
	  x.domain(d3.extent(data, function(d) { return d.date; }));

	  y.domain([
	    d3.min(cities, function(c) { return d3.min(c.values, function(d) { return d.temperature; }); }),
	    d3.max(cities, function(c) { return d3.max(c.values, function(d) { return d.temperature; }); })
	  ]);

	  z.domain(cities.map(function(c) { return c.id; }));

	  g.append("g")
	      .attr("class", "axis axis--x")
	      .attr("transform", "translate(0," + height + ")")
	      .call(d3.axisBottom(x));

	  g.append("g")
	      .attr("class", "axis axis--y")
	      .call(d3.axisLeft(y))
	    .append("text")
	      .attr("transform", "rotate(-90)")
	      .attr("y", 6)
	      .attr("dy", "0.71em")
	      .attr("fill", "#000")
	      .text("Temperature, ºF");

	  var city = g.selectAll(".city")
	    .data(cities)
	    .enter().append("g")
	      .attr("class", "city");

	  city.append("path")
	      .attr("class", "line")
	      .attr("d", function(d) { return line(d.values); })
	      .style("stroke", function(d) { return z(d.id); });
	
	  city.append("text")
	      .datum(function(d) { return {id: d.id, value: d.values[d.values.length - 1]}; })
	      .attr("transform", function(d) {return "translate(" + x(d.value.date) + "," + y(d.value.temperature) + ")"; })
	      .attr("x", 3)
	      .attr("dy", "0.35em")
	      .style("font", "10px sans-serif")
	      .text(function(d) { return d.id; });
	});

	function type(d, _, columns) {
	  d.date = parseTime(d.date);
	  for (var i = 1, n = columns.length, c; i < n; ++i) d[c = columns[i]] = +d[c];
	  return d;
	}
	</script>
</body>
</html>