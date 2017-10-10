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
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context }">Home</a></li>
					<li class="active">기업검색</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="row">
					<div class="col-sm-12">
						<div class="col-sm-3">
							<h3><span id="newsTitle"></span>
								<button class="btn btn-white btn-xs no-border" onclick="addFavorite('${name}')" id="favorite">
									<i class="fa fa-star-o bigger-150" aria-hidden="true" ></i>
								</button>
							</h3>
						</div>
							<div class="form-group pull-right">
								<div class="pos-rel">
									
									<input class="typeahead scrollable" type="text"
										placeholder="기업검색" />
								</div>
							</div>
						</div>
					</div>
				<div class="row">
					<div class="col-sm-6" id="stockChart">
						<iframe src="${context}/company/chart/stock.do?name=${name}&draw=true"
							width="100%" height="400px" frameBorder="0"> </iframe>
					</div>
					<div class="col-sm-4" id="newsChart">
						<iframe src="${context}/company/chart/newsCount.do"
							width="100%" height="400px" frameBorder="0"> </iframe>
					</div>
					<div class="col-sm-2">
						<div id="news"></div>
					</div>
					
				</div>
				<div class="row">
					<div class="col-sm-6" id="RTAChartPie">
						<iframe src="${context}/company/chart/RTA.do?name=${name}&option=pie"
							width="100%" height="500px" frameBorder="0"> </iframe>
					</div>
					<div class="col-sm-6" id="RTAChartTable">
						<iframe src="${context}/company/chart/RTA.do?name=${name}&option=table"
							width="100%" height="500px" frameBorder="0"> </iframe>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6" id="relNewsChart">
						<iframe
							src="${context}/company/chart/reliability.do?name=${name}&option=newsCode"
							width="100%" height="500px" frameBorder="0"> </iframe>
					</div>
					<div class="col-sm-6" id="dTreeChart">
						<iframe src="${context}/company/chart/dTree.do?name=${name}"
							width="100%" height="500px" frameBorder="0"> </iframe>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div id="right-menu" class="modal aside" data-body-scroll="false"
						data-offset="true" data-placement="right" data-fixed="true"
						data-backdrop="false" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header no-padding">
									<div class="table-header" id="newsTitle">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="white">&times;</span>
										</button>
										${name} 뉴스
									</div>
								</div>

								<div class="modal-body">
									<div class="section-seperator margin-b-50">
										<div class="margin-b-50">
											<div class="margin-b-30">
												<!-- <div id="news"></div> -->
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->

							<button
								class="aside-trigger btn btn-info btn-app btn-xs ace-settings-btn"
								data-target="#right-menu" data-toggle="modal" type="button">
								<i data-icon1="fa-plus" data-icon2="fa-minus"
									class="ace-icon fa fa-plus bigger-110 icon-only"></i>
							</button>
						</div>
						<!-- /.modal-dialog -->
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
	getNews('${name}');
	checkFavorite('${name}');
	$(document).on("click", ".tt-suggestion.tt-selectable", function() {
		change();
	});

	$("input.typeahead").keydown(function(key) {
		if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
			change();
		}
	});

	function change() {
		var comName;
		if ($('input.typeahead')[1].value != $('input.typeahead')[0].value
				&& $('input.typeahead')[0].value != '') {
			comName = $('input.typeahead')[0].value;
		} else {
			comName = $('input.typeahead')[1].value;
		}
		var tag1 = '<iframe src="${context}/company/chart/stock.do?name='
				+ comName
				+ '&draw=true" width="100%" height="400px" frameBorder="0"></iframe>'
		var tag2 = '<iframe src="${context}/company/chart/newsCount.do" width="100%" height="400px" frameBorder="0"> </iframe>'
		var tag3 = '<iframe src="${context}/company/chart/RTA.do?name='
				+ comName
				+ '&option=pie" width="100%" height="500px" frameBorder="0"></iframe>'
		var tag4 = '<iframe src="${context}/company/chart/reliability.do?name='
				+ comName
				+ '&option=newsCode" width="100%" height="500px" frameBorder="0"></iframe>'
		var tag5  = '<iframe src="${context}/company/chart/RTA.do?name='
			+ comName
			+ '&option=table" width="100%" height="500px" frameBorder="0"></iframe>'
		var tag6  = '<iframe src="${context}/company/chart/dTree.do?name='
			+ comName
			+ '" width="100%" height="500px" frameBorder="0"></iframe>'
			
		$('#stockChart').html(tag1);
		$('#newsChart').html(tag2);
		$('#RTAChartPie').html(tag3);
		$('#relNewsChart').html(tag4);
		$('#RTAChartTable').html(tag5);
		$('#dTreeChart').html(tag6);
		$('#favorite').attr('onclick','addFavorite("'+comName+'")');
		getNews(comName);
		checkFavorite(comName);
	}

	function getNews(comName) {
		$.ajax({
			url : "${context}/crawler/comNews.json?name=" + comName,
			success : function(data) {
				var obj = []
				obj = JSON.parse(data);
				console.log(obj);
				$('#news').html('<div class="space-24"></div>');
				$('#newsTitle').text(comName);
				for (var i = 0; i < obj.length; i++) {
					$('#news').append(
							'<p><a href="'+obj[i].link+'" target="_blank">' + obj[i].title
									+ "</a><br/></p>");
				}
			},
			error : function(e) {
				console.log("error : " + e);
			}
		});
	}
	
	function checkFavorite(comName){
		var userNo = '${loginUser.no}'; 
		if(userNo == ''){
			userNo=0;
		}
		$.ajax({
			url : '${context}/my/favorite.json',
			type : 'get',
			data : {
				'userNo' : userNo,
				'comName' : comName
			},
			success : function(data){
				console.log(data);
				if(data == "able"){
					$('#favorite i').attr("class","fa fa-star-o bigger-150");
				}else if(data == 'disable'){
					$('#favorite i').attr("class","fa fa-star bigger-150");
				}
			}
		});
	}
	
	function addFavorite(comName){
		var method;
		if($('#favorite i')[0].className.split(" ")[1] == "fa-star"){
			if(confirm('이미 즐겨찾기에 등록되어 있습니다.\n목록에서 삭제하겠습니까?')){
				method = "delete";
			}else{
				return false;
			}
		}else{
			method = "insert";
		}
		if('${loginUser.no}' == ''){
			alert('로그인이 필요합니다.');
		}else{
			$.ajax({
				url : '${context}/my/favorite.json',
				type : 'post',
				data : {
					'userNo' : '${loginUser.no}',
					'comName' : comName,
					'method' : method
				},
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data){
					if(method =="delete"){
						$('#favorite i').attr("class","fa fa-star-o bigger-150");
					}else{
						$('#favorite i').attr("class","fa fa-star bigger-150");
					}
				}
			});
		}
	}
	
	//검색 필터링
	jQuery(function($) {
		var demo1 = $('select[name="duallistbox_demo1[]"]')
				.bootstrapDualListbox(
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
			limit : 20
		});

		///////////////
		$('.modal.aside').ace_aside();

		$('#aside-inside-modal').addClass('aside').ace_aside({
			container : '#my-modal > .modal-dialog'
		});

		//$('#top-menu').modal('show')

		$(document).one('ajaxloadstart.page', function(e) {
			//in ajax mode, remove before leaving page
			$('.modal.aside').remove();
			$(window).off('.aside')
		});

	});
</script>

</body>
</html>