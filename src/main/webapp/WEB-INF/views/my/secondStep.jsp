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

<!-- page specific plugin styles -->
<link rel="stylesheet" href="${context}/assets/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="${context}/assets/css/bootstrap-multiselect.min.css" />
<link rel="stylesheet" href="${context}/assets/css/select2.min.css" />
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
			<div class="form-group">
				<div class="row">
					<label class="col-sm-12 control-label no-padding-top" for="duallist">
						단어 선택
					</label>
				</div>
				<div class="row">
					<label class="col-sm-3 control-label no-padding-top" for="duallist">
						단어 추가
					</label>
					<div class="col-sm-9">
						<input type="text" id="inputTerm">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<select multiple="multiple" size="10" name="duallistbox_demo1[]"
								id="duallist">
								
							</select>
						</div>
						<div class="col-sm-2 col-sm-offset-5">
							<button onclick="addAll()">추가</button>
						</div>
						<div class="hr hr-16 hr-dotted"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12"  style="max-height:300px">
						<ul id="selectedTerm">
						
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div id="loaded-content"></div>

	<a id="back-button" class="red-btn" href="#"><i
		class="icon-fontawesome-webfont-27"></i> Go Back</a>
		
<script type="text/javascript">
	var dictionary = ${dictionary};
	var cnt=0;
	for(term in dictionary){
		if(isNaN(parseInt(term)))
			$('#duallist').append('<option value="'+term+'">'+term+'</option>');
		cnt++;
		if(cnt == 1000)
			break;
	}
	$("#inputTerm").keydown(function (key) {
	    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	    	$('#selectedTerm').append('<li>'+this.value+'</li>');
	    	$("#inputTerm").text('');
	    }
	});
	function addAll(){
		var options = $('select')[1].options
		for(var i=0; i<options.length; i++){
			$('#selectedTerm').append('<li>'+options[i].value+'</li>');
		}
		var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
		var container1 = demo1.bootstrapDualListbox('getContainer');
		container1.find('.btn').addClass('btn-white btn-info btn-bold');
	}
	jQuery(function($){
	    var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox({infoTextFiltered: '<span class="label label-purple label-lg">Filtered</span>'});
		var container1 = demo1.bootstrapDualListbox('getContainer');
		container1.find('.btn').addClass('btn-white btn-info btn-bold');
			
		//typeahead.js
		//example taken from plugin's page at: https://twitter.github.io/typeahead.js/examples/
		var substringMatcher = function(strs) {
			return function findMatches(q, cb) {
				var matches, substringRegex;	 
					// an array that will be populated with substring matches
					matches = [];
					 
					// regex used to determine if a string contains the substring `q`
					substrRegex = new RegExp(q, 'i');
					 
					// iterate through the pool of strings and for any string that
						// contains the substring `q`, add it to the `matches` array
					$.each(strs, function(i, str) {
						if (substrRegex.test(str)) {
							// the typeahead jQuery plugin expects suggestions to a
							// JavaScript object, refer to typeahead docs for more info
							matches.push({ value: str });
						}
					});
		
					cb(matches);
				}
		};
				//in ajax mode, remove remaining elements before leaving page
		$(document).one('ajaxloadstart.page', function(e) {
			$('[class*=select2]').remove();
			$('select[name="duallistbox_demo1[]"]').bootstrapDualListbox('destroy');
			$('.rating').raty('destroy');
			$('.multiselect').multiselect('destroy');
		});
			
	});
</script>
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
