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
<!-- text fonts -->
<link rel="stylesheet" href="${context}/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
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

<!------------------------------------------------------------------------------------------------------------------------------------>
<link rel="stylesheet" href="${context}/assets/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="${context}/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${context}/assets/css/ace-rtl.min.css" />
<script src="${context}/assets/js/ace-extra.min.js"></script>
</head>
<body>
	<div class="row projects">
		<div id="loader">
			<div class="loader-icon"></div>
		</div>
		<div class="col-md-12" id="portfolio-list">
			<div class="row">
				<input class="typeahead scrollable" type="text"placeholder="기업선택" />
				<select id="newsCode">
					<option value="politics">정치
					<option value="economic">경제
					<option value="digital">IT
				</select>
			</div>
			<div class="row">
				<a href="" class="more"> 
					<button>Next Step</button>
				</a>
			</div>
		</div>
	</div>
	
	<!-- PROJECT DETAILS WILL BE LOADED HERE -->
	<div id="loaded-content"></div>

	<a id="back-button" class="red-btn" href="#"><i
		class="icon-fontawesome-webfont-27"></i> Go Back</a>
<script>
	var comName;
	var newsCode = $('#newsCode').val();
	$(document).on("click",".tt-suggestion.tt-selectable",function(){
		change();
	});
	$("input.typeahead").keydown(function (key) {
	    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	    	change();
	    }
	});
	function change(){
		if($('input.typeahead')[1].value != $('input.typeahead')[0].value && $('input.typeahead')[0].value != ''){
			comName = $('input.typeahead')[0].value;
		}else{
			comName = $('input.typeahead')[1].value;
		}
		console.log($('.more'));
		$('.more').attr('href','${context }/my/analysis/second.do?name='+comName+'&newsCode='+newsCode);
	}
	$('#newsCode').change(function(){
		newsCode = this.value;
		$('.more').attr('href','${context }/my/analysis/second.do?name='+comName+'&newsCode='+newsCode);
		console.log($('.more'));
	});
	
</script>
<script>
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
	<!-- page specific plugin scripts -->
<script src="${context}/assets/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="${context}/assets/js/jquery-typeahead.js"></script>

<!-- ace scripts -->
<script src="${context}/assets/js/ace-elements.min.js"></script>
<script src="${context}/assets/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/jquery.nav.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/owl.carousel.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/menu/smoothscroll.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/zerif/js/jquery.vegas.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/zerif.js"></script>
</body>
</html>