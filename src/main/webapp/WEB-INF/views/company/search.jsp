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

<!-- page specific plugin styles -->
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap-duallistbox.min.css" />
</head>
<body class="no-skin">
	<jsp:include page="../include/top-menu.jsp"></jsp:include>
	<jsp:include page="../include/side-menu.jsp"></jsp:include>
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
												<h3 id="newsTitle">${name} 뉴스</h3>
												<div id="news"></div>
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
	<footer>
			<jsp:include page="../include/bottom.jsp"></jsp:include>
	</footer>
	<!-- javascript file -->
<!-- page specific plugin scripts -->
<script src="${context}/resources/assets/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="${context}/resources/assets/js/jquery-typeahead.js"></script>
<script>
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
				$('#newsTitle').html(comName+' 뉴스');
				for(var i = 0;i<obj.length;i++){
					$('#news').append('<p><a href="'+obj[i].link+'">'+obj[i].title+"</a><br/></p>");
				}
			},
			error : function(e){
				console.log("error : "+ e);
			}
		});
	}
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