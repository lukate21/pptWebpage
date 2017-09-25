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

.node circle {
  cursor: pointer;
  stroke: #3182bd;
  stroke-width: 1.5px;
}

.node text {
  font: 10px sans-serif;
  pointer-events: none;
  text-anchor: middle;
}

line.link {
  fill: none;
  stroke: #9ecae1;
  stroke-width: 1.5px;
}

</style>
<style>
    body {
        font-family:"Lucida Grande","Droid Sans",Arial,Helvetica,sans-serif;
    }
    .legend {
        border: 1px solid #555555;
        border-radius: 5px 5px 5px 5px;
        font-size: 0.8em;
        margin: 10px;
        padding: 8px;
    }
    .bld {
        font-weight: bold;
    }
</style>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="${context }/resources/d3.layout.cloud.js"></script>
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
	<!-- End About -->
 	<div id="experience">
		<div class="row">
			<div class="container">
			<div class="row projects">
					<div id="loader">
						<div class="loader-icon"></div>
					</div>
					<div class="section-header">

						<!-- SECTION TITLE -->
						<h2 class="dark-text">Portfolio</h2>

						<!-- SHORT DESCRIPTION ABOUT THE SECTION -->
						<h6>We have designed and developed many awesome products.
							Just take a look.</h6>
					</div>
					<!-- / END SECTION HEADER -->
					<div class="row projects">
						<div id="loader">
							<div class="loader-icon"></div>
						</div>
						<div class="col-md-12" id="portfolio-list">
							<!-- PORTFOLIO ITEMS-->
							<ul class="cbp-rfgrid">
								<!-- Pension -->
								<li class="wow fadeInLeft animated" data-wow-offset="30"
									data-wow-duration="1.5s" data-wow-delay="0.15s"><a
									href="project.html" class="more"><img
										src="images/portfolio/1.jpg" alt="project" />
										<div class="project-info">
											<div class="project-details">
												<h5 class="white-text red-border-bottom">Project Title
												</h5>
												<div class="details white-text">Web Design</div>
											</div>
										</div> </a></li>
								<!-- / Pension -->

							</ul>
						</div>
						<!-- END OF PORTFOLIO ITEMS-->
					</div>
					<div id="loaded-content"></div>
				<div class="row">
					<div class="col-sm-3 col-sm-offset-3">
						<a id="back-button" class="red-btn" href="#"><i class="icon-fontawesome-webfont-27"></i> Go Back</a>
					</div>
					<div class="col-sm-3">
						<a id="detail-button" class="green-btn" href="#"><i class="icon-fontawesome-webfont-27"></i> More Detail</a>
					</div>
				</div>
				<div class="col-sm-12 sm-margin-b-60">
					<div>
						<div class="tabbable">
							<ul class="nav nav-tabs nav-justified" id="myTab">
								<li class="active">
									<a data-toggle="tab" href="#kospi" aria-expanded="true">
										<h3>Link Chart</h3>
									</a>
								</li>

								<li class="">
									<a data-toggle="tab" href="#kosdaq" aria-expanded="true">
										<h3>Word Cloud</h3>
									</a>
								</li>
							</ul>

							<div class="tab-content">
								<div id="kospi" class="tab-pane fade active in">
									<svg id="svg1" width="1000" height="600"></svg>
								</div>

								<div id="kosdaq" class="tab-pane fade">
									<div id="vis"></div>
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


	<!-- javascript file -->
	
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
	
	///////////////////////////////Link chart///////////////////////////////////////
	var width = 960,
    height = 500,
    root;

	var force = d3.layout.force()
	    .linkDistance(80)
	    .charge(-120)
	    .gravity(.05)
	    .size([width, height])
	    .on("tick", tick);
	
	var svg = d3.select("#svg1")
	    .attr("width", width)
	    .attr("height", height);
	
	var link = svg.selectAll(".link"),
	    node = svg.selectAll(".node");
	
	//d3.json("${context}/graph.json", function(error, json) {
	$.ajax({
		url : 'http://localhost:8080/PPTAnalysisServer/chart.do',
		success : function(data){
			root = JSON.parse(data);
			linkUpdate();
		}
	});
		
	/* d3.json("http://localhost:8080/PPTAnalysisServer/chart.do", function(error, json) {
	  if (error) throw error;
	
	  root = json;
	  linkUpdate();
	}); */
	
	function linkUpdate() {
	  var nodes = flatten(root),
	      links = d3.layout.tree().links(nodes);
	
	  // Restart the force layout.
	  force
	      .nodes(nodes)
	      .links(links)
	      .start();
	
	  // Update links.
	  link = link.data(links, function(d) { return d.target.id; });
	
	  link.exit().remove();
	
	  link.enter().insert("line", ".node")
	      .attr("class", "link");
	
	  // Update nodes.
	  node = node.data(nodes, function(d) { return d.id; });
	
	  node.exit().remove();
	
	  var nodeEnter = node.enter().append("g")
	      .attr("class", "node")
	      .on("click", click)
	      .call(force.drag);
	
	  nodeEnter.append("circle")
	      .attr("r", function(d) { return Math.sqrt(d.size) / 10 || 4.5; });
	
	  nodeEnter.append("text")
	      .attr("dy", ".35em")
	      .text(function(d) { return d.name; });
	
	  node.select("circle")
	      .style("fill", color);
	}
	
	function tick() {
	  link.attr("x1", function(d) { return d.source.x; })
	      .attr("y1", function(d) { return d.source.y; })
	      .attr("x2", function(d) { return d.target.x; })
	      .attr("y2", function(d) { return d.target.y; });
	
	  node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
	}
	
	function color(d) {
	  return d._children ? "#3182bd" // collapsed package
	      : d.children ? "#c6dbef" // expanded package
	      : "#fd8d3c"; // leaf node
	}
	
	// Toggle children on click.
	function click(d) {
	  if (d3.event.defaultPrevented) return; // ignore drag
	  if (d.children) {
	    d._children = d.children;
	    d.children = null;
	  } else {
	    d.children = d._children;
	    d._children = null;
	  }
	  linkUpdate();
	}
	
	// Returns a list of all nodes under the root.
	function flatten(root) {
	  var nodes = [], i = 0;
	
	  function recurse(node) {
	    if (node.children) node.children.forEach(recurse);
	    if (!node.id) node.id = ++i;
	    nodes.push(node);
	  }
	
	  recurse(root);
	  return nodes;
	}
	
	/////////////////////////////////////////////Word Cloud//////////////////////////////////////////
	
	$.ajax({
		url : 'http://localhost:8080/PPTAnalysisServer/morp/reqMorp.do?type=news&data=http://v.media.daum.net/v/20170915154606111',
		success : function(data){
			var tags = JSON.parse(data);
			update(tags);
			console.log(tags);
			window.onresize = function(event) {
				update(tags);
			}
		}
	});
	
	/* $.ajax({
		url : 'http://localhost:8080/PPTAnalysisServer/morp/reqMorp.do?type=news&data=http://v.media.daum.net/v/20170915154606111',
		success : function(data){
			var frequency_list = [];
			//	[{"text":"study","size":40},{"text":"motion","size":15},{"text":"forces","size":10},{"text":"electricity","size":15},{"text":"movement","size":10},{"text":"relation","size":5},{"text":"things","size":10},{"text":"force","size":5},{"text":"ad","size":5},{"text":"energy","size":85},{"text":"living","size":5},{"text":"nonliving","size":5},{"text":"laws","size":15},{"text":"speed","size":45},{"text":"velocity","size":30},{"text":"define","size":5},{"text":"constraints","size":5},{"text":"universe","size":10},{"text":"physics","size":120},{"text":"describing","size":5},{"text":"matter","size":90},{"text":"physics-the","size":5},{"text":"world","size":10},{"text":"works","size":10},{"text":"science","size":70},{"text":"interactions","size":30},{"text":"studies","size":5},{"text":"properties","size":45},{"text":"nature","size":40},{"text":"branch","size":30},{"text":"concerned","size":25},{"text":"source","size":40},{"text":"google","size":10},{"text":"defintions","size":5},{"text":"two","size":15},{"text":"grouped","size":15},{"text":"traditional","size":15},{"text":"fields","size":15},{"text":"acoustics","size":15},{"text":"optics","size":15},{"text":"mechanics","size":20},{"text":"thermodynamics","size":15},{"text":"electromagnetism","size":15},{"text":"modern","size":15},{"text":"extensions","size":15},{"text":"thefreedictionary","size":15},{"text":"interaction","size":15},{"text":"org","size":25},{"text":"answers","size":5},{"text":"natural","size":15},{"text":"objects","size":5},{"text":"treats","size":10},{"text":"acting","size":5},{"text":"department","size":5},{"text":"gravitation","size":5},{"text":"heat","size":10},{"text":"light","size":10},{"text":"magnetism","size":10},{"text":"modify","size":5},{"text":"general","size":10},{"text":"bodies","size":5},{"text":"philosophy","size":5},{"text":"brainyquote","size":5},{"text":"words","size":5},{"text":"ph","size":5},{"text":"html","size":5},{"text":"lrl","size":5},{"text":"zgzmeylfwuy","size":5},{"text":"subject","size":5},{"text":"distinguished","size":5},{"text":"chemistry","size":5},{"text":"biology","size":5},{"text":"includes","size":5},{"text":"radiation","size":5},{"text":"sound","size":5},{"text":"structure","size":5},{"text":"atoms","size":5},{"text":"including","size":10},{"text":"atomic","size":10},{"text":"nuclear","size":10},{"text":"cryogenics","size":10},{"text":"solid-state","size":10},{"text":"particle","size":10},{"text":"plasma","size":10},{"text":"deals","size":5},{"text":"merriam-webster","size":5},{"text":"dictionary","size":10},{"text":"analysis","size":5},{"text":"conducted","size":5},{"text":"order","size":5},{"text":"understand","size":5},{"text":"behaves","size":5},{"text":"en","size":5},{"text":"wikipedia","size":5},{"text":"wiki","size":5},{"text":"physics-","size":5},{"text":"physical","size":5},{"text":"behaviour","size":5},{"text":"collinsdictionary","size":5},{"text":"english","size":5},{"text":"time","size":35},{"text":"distance","size":35},{"text":"wheels","size":5},{"text":"revelations","size":5},{"text":"minute","size":5},{"text":"acceleration","size":20},{"text":"torque","size":5},{"text":"wheel","size":5},{"text":"rotations","size":5},{"text":"resistance","size":5},{"text":"momentum","size":5},{"text":"measure","size":10},{"text":"direction","size":10},{"text":"car","size":5},{"text":"add","size":5},{"text":"traveled","size":5},{"text":"weight","size":5},{"text":"electrical","size":5},{"text":"power","size":5}];
			var obj = JSON.parse(data);
			var color = d3.scale.linear()
            .domain([0,1,2,3,4,5,6,10,15,20,100])
            .range(["#ddd", "#ccc", "#bbb", "#aaa", "#999", "#888", "#777", "#666", "#555", "#444", "#333", "#222"]);

		    d3.layout.cloud().size([800, 300])
		            .words(obj)
		            .rotate(0)
		            .fontSize(function(d) { return d.size; })
		            .on("end", draw)
		            .start();
		
		    function draw(words) {
		        d3.select("#svg2")
		                .attr("class", "wordcloud")
		                .append("g")
		                // without the transform, words words would get cutoff to the left and top, they would
		                // appear outside of the SVG area
		                .attr("transform", "translate(300,300)")
		                .selectAll("text")
		                .data(words)
		                .enter().append("text")
		                .style("font-size", function(d) { return d.size + "px"; })
		                .style("fill", function(d, i) { return color(i); })
		                .attr("transform", function(d) {
		                    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
		                })
		                .text(function(d) { return d.text; });
		    }
		}
	}); */
    
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/word-cloud.js"></script>
</body>
</html>