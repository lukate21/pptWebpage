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
<script>
//그리드 - 리스트
var favoriteList = [];
	<c:forEach items="${favoriteList }" var="favoriteVO">
		favoriteList.push({
			no : '${favoriteVO.no }',
			name : '${favoriteVO.comName }'
		});
	</c:forEach>
function changeView(viewType){
	if(viewType == 'grid'){
		$('#main-widget-container').empty();
		for(var i in favoriteList){
			var gridDiv = '<div class="col-xs-12 col-sm-6 widget-container-col" id="widget-container-col-'+favoriteList[i].no+'">'
				+'<div class="widget-box" id="widget-box-'+favoriteList[i].no+'">'
				+'<div class="widget-header">'
				+'<h5 class="widget-title">'+favoriteList[i].name+'</h5>'
				+'<div class="widget-toolbar">'
				+'<div class="widget-menu">'
				+'<a href="#" data-action="settings" data-toggle="dropdown">'
				+'<i class="ace-icon fa fa-bars"></i></a>'
				+'<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">'
				+'<li><a style="cursor:pointer" onclick="changeChart(\'#widget-main-'+favoriteList[i].no+'\',\'stock.do?name='+favoriteList[i].name+'&draw=true\',500)">실시간 주가 차트</a>'
				+'</li>'
				+'<li><a style="cursor:pointer" onclick="changeChart(\'#widget-main-'+favoriteList[i].no+'\',\'RTA.do?name='+favoriteList[i].name+'&option=pie\',500)">주가 예측 차트</a>'
				+'</li>'
				+'<li><a style="cursor:pointer" onclick="changeChart(\'#widget-main-'+favoriteList[i].no+'\',\'RTA.do?name='+favoriteList[i].name+'&option=table\',500)">주가 예측 테이블</a>'
				+'</li>'
				+'<li><a style="cursor:pointer" onclick="changeChart(\'#widget-main-'+favoriteList[i].no+'\',\'reliability.do?name='+favoriteList[i].name+'&option=newsCode\',700)">신뢰도 차트</a>'
				+'</li></ul></div>'
				+'<a href="#" data-action="fullscreen" class="orange2"> <i class="ace-icon fa fa-expand"></i>'
				+'</a> <a href="#" data-action="collapse"> <i class="ace-icon fa fa-chevron-up"></i>'
				+'</a> <a href="" data-action="" onclick="deleteFavorite(\''+favoriteList[i].no+'\')"><i class="ace-icon fa fa-times"></i></a></div></div>'
				+'<div class="widget-body"><div class="widget-main" id="widget-main-'+favoriteList[i].no+'">'
				+'<iframe src="${context}/company/chart/stock.do?name='+favoriteList[i].name+'&draw=true"'
				+'width="100%" height="500px" frameBorder="0"></iframe>'
				+'</div></div></div></div>';
			$('#main-widget-container').append(gridDiv);
		}
	}else if(viewType == 'list'){
		$('#main-widget-container').empty();
		for(var i in favoriteList){
			var gridDiv = '<div class="col-xs-12 col-sm-6 col-lg-4 widget-container-col" id="widget-container-col-'+favoriteList[i].no+'">'
				+'<div class="widget-box" id="widget-box-'+favoriteList[i].no+'">'
				+'<div class="widget-header">'
				+'<h5 class="widget-title">'+favoriteList[i].name+'</h5>'
				+'<div class="widget-toolbar">'
				+'<a href="#" data-action="collapse"> <i class="ace-icon fa fa-chevron-up"></i>'
				+'</a> <a href="" data-action="" onclick="deleteFavorite(\''+favoriteList[i].no+'\')"><i class="ace-icon fa fa-times"></i></a></div></div>'
				+'<div class="widget-body"><div class="widget-main" id="widget-main-'+favoriteList[i].no+'">'
				+'<iframe src="${context}/company/chart/stock.do?name='+favoriteList[i].name+'&draw=false"'
				+'width="100%" height="100px" frameBorder="0"></iframe>'
				+'</div></div></div></div>';
			$('#main-widget-container').append(gridDiv);
		}
	}
	widgetConfig();
}
function widgetConfig(){
	$('#simple-colorpicker-1').ace_colorpicker({
		pull_right : true
	}).on('change',function() {
		var color_class = $(this).find('option:selected').data('class');
		var new_class = 'widget-box';
		if (color_class != 'default')
			new_class += ' widget-color-' + color_class;
		$(this).closest('.widget-box').attr('class',new_class);
	});

	// scrollables
	$('.scrollable').each(function() {
		var $this = $(this);
		$(this).ace_scroll({
			size : $this.attr('data-size') || 100,
		//styleClass: 'scroll-left scroll-margin scroll-thin scroll-dark scroll-light no-track scroll-visible'
		});
	});
	
	$('.scrollable-horizontal').each(function() {
		var $this = $(this);
		$(this).ace_scroll({
			horizontal : true,
			styleClass : 'scroll-top',//show the scrollbars on top(default is bottom)
			size : $this.attr('data-size') || 500,
			mouseWheelLock : true
		}).css({
			'padding-top' : 12
		});
	});

	$(window).on('resize.scroll_reset', function() {
		$('.scrollable-horizontal').ace_scroll('reset');
	});

	$('#id-checkbox-vertical').prop('checked', false).on(
			'click',
			function() {
				$('#widget-toolbox-1').toggleClass('toolbox-vertical')
						.find('.btn-group').toggleClass(
								'btn-group-vertical').filter(':first')
						.toggleClass('hidden').parent().toggleClass(
								'btn-toolbar')
			});

	// widget boxes
	// widget box drag & drop example
	$('.widget-container-col').sortable(
			{
				connectWith : '.widget-container-col',
				items : '> .widget-box',
				handle : ace.vars['touch'] ? '.widget-title' : false,
				cancel : '.fullscreen',
				opacity : 0.8,
				revert : true,
				forceHelperSize : true,
				placeholder : 'widget-placeholder',
				forcePlaceholderSize : true,
				tolerance : 'pointer',
				start : function(event, ui) {
					//when an element is moved, it's parent becomes empty with almost zero height.
					//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
					ui.item.parent().css({
						'min-height' : ui.item.height()
					})
					//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
				},
				update : function(event, ui) {
					ui.item.parent({
						'min-height' : ''
					})
					//p.style.removeProperty('background-color');

					//save widget positions
					var widget_order = {}
					$('.widget-container-col').each(function() {
						var container_id = $(this).attr('id');
						widget_order[container_id] = []

						$(this).find('> .widget-box').each(function() {
							var widget_id = $(this).attr('id');
							widget_order[container_id].push(widget_id);
							//now we know each container contains which widgets
						});
					});

					ace.data.set('demo', 'widget-order', widget_order,
							null, true);
				}
			});

	///////////////////////

	//when a widget is shown/hidden/closed, we save its state for later retrieval
	$(document).on(
			'shown.ace.widget hidden.ace.widget closed.ace.widget',
			'.widget-box',
			function(event) {
				var widgets = ace.data
						.get('demo', 'widget-state', true);
				if (widgets == null)
					widgets = {}
				var id = $(this).attr('id');
				widgets[id] = event.type;
				ace.data.set('demo', 'widget-state', widgets, null,
						true);
			});

	(function() {
		//restore widget order
		var container_list = ace.data.get('demo', 'widget-order', true);
		if (container_list) {
			for ( var container_id in container_list)
				if (container_list.hasOwnProperty(container_id)) {

					var widgets_inside_container = container_list[container_id];
					if (widgets_inside_container.length == 0)
						continue;

					for (var i = 0; i < widgets_inside_container.length; i++) {
						var widget = widgets_inside_container[i];
						$('#' + widget).appendTo('#' + container_id);
					}

				}
		}

		//restore widget state
		var widgets = ace.data.get('demo', 'widget-state', true);
		if (widgets != null) {
			for ( var id in widgets)
				if (widgets.hasOwnProperty(id)) {
					var state = widgets[id];
					var widget = $('#' + id);
					if ((state == 'shown' && widget
							.hasClass('collapsed'))
							|| (state == 'hidden' && !widget
									.hasClass('collapsed'))) {
						widget.widget_box('toggleFast');
					} else if (state == 'closed') {
						widget.widget_box('closeFast');
					}
				}
		}

		$('#main-widget-container').removeClass('invisible');

		//reset saved positions and states
		$('#reset-widgets').on('click', function() {
			ace.data.remove('demo', 'widget-state');
			ace.data.remove('demo', 'widget-order');
			document.location.reload();
		});

	})();
}
</script>
</head>
<body class="no-skin">
	<jsp:include page="../include/top-menu.jsp"></jsp:include>
	<jsp:include page="../include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed"
				id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a
						href="${context }">Home</a></li>
					<li><a href="#">company</a></li>
					<li class="active">관심기업</li>
				</ul>
				<!-- /.breadcrumb -->
				<div class="pull-right">
					<button type="reset" id="reset-widgets" class="btn btn-danger btn-white btn-bold btn-round">설정 초기화</button>
				</div>
			</div>

			<div class="page-content">
				<div class="page-header">
					<h1>
						관심기업 리스트
						<c:if test="${favoriteList != null}">
							<small>
								<i class="ace-icon fa fa-angle-double-right"></i>
								<span id="updateGroupName" style="cursor:pointer">${groupName }<i class="ace-icon fa fa-pencil bigger-100" ></i></span>
							</small>
						</c:if>
						<span class="pull-right">
							<button class="btn btn-info btn-sm" onclick="changeView('list')">
								<i class="ace-icon fa fa-th icon-only bigger-150"></i>
							</button>
							<button class="btn btn-info btn-sm" onclick="changeView('grid')">
								<i class="ace-icon fa fa-th-large icon-only bigger-150"></i>
							</button>
						</span>
						<span class="form-group pull-right">
							<form method="post" action="${context }/my/favorite.do" id="gorupForm">
								<input name="groupName" class="typeahead scrollable" type="text" placeholder="그룹명" />
								&nbsp;
							</form>
						</span>
					</h1>
				</div><!-- /.page-header -->
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="invisible" id="main-widget-container">
							<%-- <c:forEach items="${favoriteList }" var="favoriteVO">
								<div class="col-xs-12 col-sm-6 widget-container-col"
									id="widget-container-col-${favoriteVO.no }">
									<div class="widget-box" id="widget-box-${favoriteVO.no}">
										<div class="widget-header">
											<h5 class="widget-title">${favoriteVO.comName }</h5>
											<div class="widget-toolbar">
												<div class="widget-menu">
													<a href="#" data-action="settings" data-toggle="dropdown">
														<i class="ace-icon fa fa-bars"></i>
													</a>
													<ul class="dropdown-menu dropdown-menu-right dropdown-light-blue dropdown-caret dropdown-closer">
														<li><a style="cursor:pointer" onclick="changeChart('#widget-main-${favoriteVO.no }','stock.do?name=${favoriteVO.comName}&draw=true')">실시간 주가 차트</a>
														</li>
														<li><a style="cursor:pointer" onclick="changeChart('#widget-main-${favoriteVO.no}','RTA.do?name=${favoriteVO.comName}&option=pie')">주가 예측 차트</a>
														</li>
														<li><a style="cursor:pointer" onclick="changeChart('#widget-main-${favoriteVO.no}','RTA.do?name=${favoriteVO.comName}&option=table')">주가 예측 테이블</a>
														</li>
														<li><a style="cursor:pointer" onclick="changeChart('#widget-main-${favoriteVO.no}','reliability.do?name=${favoriteVO.comName}&option=newsCode')">신뢰도 차트</a>
														</li>
													</ul>
												</div>

												<a href="#" data-action="fullscreen" class="orange2"> <i
													class="ace-icon fa fa-expand"></i>
												</a> <a href="#" data-action="collapse"> <i
													class="ace-icon fa fa-chevron-up"></i>
												</a> <a href="#" data-action="close"> <i
													class="ace-icon fa fa-times"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main" id="widget-main-${favoriteVO.no }">
											<iframe src="${context}/company/chart/stock.do?name=${favoriteVO.comName }&draw=true"
												width="100%" height="500px" frameBorder="0"> </iframe>
											</div>
										</div>
									</div>
								</div>
							</c:forEach> --%>
							<div class="row">
								<div class="text-center">
									
								</div>
							</div>

							<!-- /.row -->
						</div>
						<!-- PAGE CONTENT ENDS -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->

	</div>
	<footer>
		<jsp:include page="../include/bottom.jsp"></jsp:include>
	</footer>
	<script src="${context }/resources/assets/js/jquery-ui.custom.min.js"></script>
	<script src="${context }/resources/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="${context}/resources/assets/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="${context}/resources/assets/js/jquery-typeahead.js"></script>
	<script type="text/javascript">
		changeView('list');
		//검색
		$(document).on("click", ".tt-suggestion.tt-selectable", function() {
			$('#gorupForm').submit();
		});
	
		$("input.typeahead").keydown(function(key) {
			if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
				$('#gorupForm').submit();
			}
		});
		
		//즐겨찾기
		function deleteFavorite(groupNo) {
			if(confirm('관심기업에서 삭제합니다.')){
				$.ajax({
					url : '${context}/my/deleteFavorite.json',
					type : 'get',
					data : {
						'userNo' : '${loginUser.no}',
						'no' : groupNo
					},
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					success : function(data) {
							alert(data);
							$('#gorupForm input').val('${groupName }');
							$('#gorupForm').submit();
					}
				});
			}
		}
		function updateGroupName(newGroupName) {
				if(newGroupName != '${groupName }'){
					$.ajax({
						url : '${context}/my/updateGroupName.json',
						type : 'get',
						data : {
							'userNo' : '${loginUser.no}',
							'groupName' : '${groupName }',
							'newGroupName' : newGroupName
						},
						contentType : 'application/x-www-form-urlencoded; charset=utf-8',
						success : function(data) {
								alert(newGroupName +'으로 변경합니다.');
								$('#gorupForm input').val(newGroupName);
								$('#gorupForm').submit();
						}
					});
				}else{
					$('#updateGroupName').empty();
					$('#updateGroupName').append('${groupName }<i class="ace-icon fa fa-pencil bigger-100"></i>');
				}
		}
		
		$(document).on("click", "#updateGroupName .fa-pencil", function() {
			$('#updateGroupName').empty();
			$('#updateGroupName').append('<input type="text" maxlength="10" value="${groupName }"/>'
					+'<a class="green"><i class="ace-icon fa fa-check bigger-150"></i></a><a class="red"><i class="ace-icon fa fa-close bigger-150"></i></a>');
		});
		$(document).on("click", "#updateGroupName .fa-check", function() {
			var newGroupName = $('#updateGroupName input').val();
			updateGroupName(newGroupName);
		});
		
		$(document).on("click", "#updateGroupName .fa-close", function() {
			$('#updateGroupName').empty();
			$('#updateGroupName').append('${groupName }<i class="ace-icon fa fa-pencil bigger-100"></i>');
		});
		
		//차트
		function changeChart(divId, chart, height) {
			var tag1 = '<iframe src="${context}/company/chart/' + chart
					+ '" width="100%" height="'+height+'px" frameBorder="0"></iframe>'
			$(divId).html(tag1);
		}
		
		jQuery(function($) {
			
			var demo1 = $('select[name="duallistbox_demo1[]"]')
			.bootstrapDualListbox(
					{
						infoTextFiltered : '<span class="label label-purple label-lg">Filtered</span>'
					});
	var container1 = demo1.bootstrapDualListbox('getContainer');
	container1.find('.btn').addClass('btn-white btn-info btn-bold');
	var groupList = [];
	<c:forEach items="${groupList}" var="group">
		groupList.push('${group.groupName}');
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
		source : substringMatcher(groupList),
		limit : 20
	});
		});
	</script>