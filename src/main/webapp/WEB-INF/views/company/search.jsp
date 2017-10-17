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
<!-- ace settings handler -->
<script src="${context}/resources/assets/js/ace-extra.min.js"></script>
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="${context}/resources/assets/css/jquery-ui.min.css" />
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
				<div class="page-header">
					<h1>
						<span id="newsTitle"></span>
						<button class="btn btn-white btn-info btn-bold" onclick="addFavorite('${name}')" id="favorite">
							<i class="ace-icon fa fa-plus bigger-120 blue"></i> 관심기업등록
						</button>
						<div class="form-group pull-right">
							<div class="pos-rel">
								<input class="typeahead scrollable" type="text"
									placeholder="기업검색" />
							</div>
						</div>
					</h1>
				</div><!-- /.page-header -->
				<div class="row">
					<div class="col-sm-8">
						<div class="row" id="stockChart">
							<iframe src="${context}/company/chart/stock.do?name=${name}&draw=true"
								width="100%" height="500px" frameBorder="0"> </iframe>
						</div>
						<div class="row" id="news">
						</div>
						<div class="row" id="relNewsChart">
							<iframe
							src="${context}/company/chart/reliability.do?name=${name}&option=newsCode"
							width="100%" height="700px" frameBorder="0"> </iframe>
						</div>
					</div>
					<%-- <div class="col-sm-4" id="newsChart">
						<iframe src="${context}/company/chart/newsCount.do"
							width="100%" height="400px" frameBorder="0"> </iframe>
					</div> --%>
					<div class="col-sm-4" id="RTAChartPie">
						<iframe src="${context}/company/chart/RTA.do?name=${name}&option=pie"
							width="100%" height="550px" frameBorder="0"> </iframe>
					</div>
					<div class="col-sm-4" id="RTAChartTable">
						<iframe src="${context}/company/chart/RTA.do?name=${name}&option=table"
							width="100%" height="800px" frameBorder="0"> </iframe>
					</div>
					
				</div>
				<div class="row">
					
					
				</div>
				<div class="row">
					
					<%-- <div class="col-sm-6" id="dTreeChart">
						<iframe src="${context}/company/chart/dTree.do?name=${name}"
							width="100%" height="500px" frameBorder="0"> </iframe>
					</div> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div id="dialog-confirm" class="hide">
						<div class="alert alert-info bigger-110">
							<div class="clearfix center">
								<input type="text" id="groupNameInput" size="30" maxlength="10" placeholder="그룹추가" />
							</div>
						</div>
						<div class="control-group col-xs-10 col-xs-offset-1" id="groupNameList">
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

		<script src="${context}/resources/assets/js/jquery-ui.min.js"></script>
		<script src="${context}/resources/assets/js/jquery.ui.touch-punch.min.js"></script>

<script>
	getNews('${name}');
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
				+ '&draw=true" width="100%" height="500px" frameBorder="0"></iframe>'
		var tag2 = '<iframe src="${context}/company/chart/newsCount.do" width="100%" height="300px" frameBorder="0"> </iframe>'
		var tag3 = '<iframe src="${context}/company/chart/RTA.do?name='
				+ comName
				+ '&option=pie" width="100%" height="550px" frameBorder="0"></iframe>'
		var tag4 = '<iframe src="${context}/company/chart/reliability.do?name='
				+ comName
				+ '&option=newsCode" width="100%" height="700px" frameBorder="0"></iframe>'
		var tag5  = '<iframe src="${context}/company/chart/RTA.do?name='
			+ comName
			+ '&option=table" width="100%" height="800px" frameBorder="0"></iframe>'
			
		$('#stockChart').html(tag1);
		$('#newsChart').html(tag2);
		$('#RTAChartPie').html(tag3);
		$('#relNewsChart').html(tag4);
		$('#RTAChartTable').html(tag5);
		$('#favorite').attr('onclick','addFavorite("'+comName+'")');
		getNews(comName);
	}

	function getNews(comName) {
		$.ajax({
			url : "${context}/crawler/comNews.json?name=" + comName+"&num=10",
			success : function(data) {
				var obj = []
				obj = JSON.parse(data);
				$('#news').empty();
				$('#newsTitle').text(' '+comName);
				var str = '<div class="col-sm-5 col-sm-offset-1">'
				for (var i = 0; i < obj.length; i++) {
					str += '<p><a href="'+obj[i].link+'" target="_blank">' + obj[i].title + "</a><br/></p>";
					if(i==4)
						str+='</div><div class="col-sm-5 col-sm-offset-1">'
				}
				str+='</div>'
				$('#news').append(str);
			},
			error : function(e) {
				console.log("error : " + e);
			}
		});
	}
	
	function reName(groupName){
		$('#groupNameInput').val(groupName);
	}
	function addFavorite(comName){
		if('${loginUser.no}' == ''){
			if(confirm('로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?'))
				location.href="${context }/login.do";
		}else{
			$.ajax({
				url : '${context}/my/selectFavoriteGroup.json',
				type : 'get',
				async:false,
				data : {
					'userNo' : '${loginUser.no}'
				},
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data){
					var obj = JSON.parse(data);
					$('#groupNameList').empty();
					for(var i in obj){

						$('#groupNameList').append('<div class="radio" onclick="reName(\''
								+obj[i].groupName+'\')"><label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">'
								+obj[i].groupName+'</span></label></div>');
					}
				}
			});
			$( "#dialog-confirm" ).removeClass('hide').dialog({
				resizable: false,
				width: '320',
				modal: true,
				title: "관심기업 등록",
				title_html: true,
				buttons: [
					{
						html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; Cancel",
						"class" : "btn btn-minier",
						click: function() {
							$( this ).dialog( "close" );
						}
					},
					{
						text: "OK",
						"class" : "btn btn-primary btn-minier",
						click: function() {
							var groupName = $('#groupNameInput').val();
							if(groupName != ''){
								$.ajax({
									url : '${context}/my/insertFavorite.json',
									type : 'get',
									data : {
										'userNo' : '${loginUser.no}',
										'comName' : comName,
										'groupName' : groupName
									},
									contentType : 'application/x-www-form-urlencoded; charset=utf-8',
									success : function(data){
										alert(data);
									}
								});
							}
							$( this ).dialog( "close" );
						} 
					}
				]
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