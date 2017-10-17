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

<!-- page specific plugin styles -->
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap-duallistbox.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/ui.jqgrid.min.css" />
</head>
<body class="no-skin">
<jsp:include page="../include/top-menu.jsp"></jsp:include>
<jsp:include page="../include/side-menu.jsp"></jsp:include>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state breadcrumbs-fixed" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="${context}/hello.do">Home</a></li>
					<li>마이페이지</li>
					<li class="active">주식현황</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="page-header">
					<h1>
						${sessionScope.loginUser.name}님
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							보유 주식 현황
						</small>
					</h1>
				</div><!-- /.page-header -->
				<div class="row">
					<div class="row">
						<!-- div.dataTables_borderWrap -->
						<div class="col-xs-12">
							<div>
								<table id="dynamic-table" class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th style="display:none"></th>
											<th>기업명</th>
											<th>매수가(원)</th>
											<th class="hidden-480">매수량(주)</th>
											<th class="hidden-480">총매수금액(원)</th>
											<th class="hidden-480">현재가(원)</th>
											<th class="hidden-480">평가손익</th>
	
											<th>
												<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
												구매일
											</th>
	
											<th></th>
										</tr>
									</thead>
	
									<tbody>
										<c:choose>
											<c:when test="${empty myStockList }">
												
											</c:when>
											<c:otherwise>
												<c:forEach items="${myStockList}" var="myStock" varStatus="status">
													<tr id="row">
											<td class="hidden-480" style="display:none">${myStock.no}</td>
											<td id="comName">
												<a href="#">${myStock.comName}</a>
											</td>
											<td id="buyPrice">${myStock.buyPrice}</td>
											<td id="volume" class="hidden-480" id="volume">${myStock.volume}</td>
											<td class="hidden-480" id="base">${myStock.volume*myStock.buyPrice}</td>
											<td class="hidden-480" id="volume">${myStock.nowPrice}</td>
											<c:choose>
												<c:when test="${myStock.buyPrice > myStock.nowPrice}">
													<td class="hidden-480" style="color:blue;">
														<i class="ace-icon fa fa-caret-down blue"></i>
														${myStock.volume*(myStock.buyPrice-myStock.nowPrice)}
													</td>
												</c:when>
												<c:otherwise>
													<td class="hidden-480" style="color:red;">
													<i class="ace-icon fa fa-caret-up red"></i>
														${myStock.volume*(myStock.nowPrice-myStock.buyPrice)}
													</td>
												</c:otherwise>
											</c:choose>
											<td id="buyDate">${myStock.buyDate}</td>
											<td>
												<div class="hidden-sm hidden-xs action-buttons">
	
													<a class="green" href="#modal-modify" data-toggle="modal" >
														<i class="ace-icon fa fa-pencil bigger-130"></i>
													</a>
	
													<a class="red" href="#modal-delete" data-toggle="modal">
														<i class="ace-icon fa fa-trash-o bigger-130"></i>
													</a>
												</div>
	
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
														</button>
	
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
	
															<li>
																<a href="#modal-modify" data-toggle="modal" class="tooltip-success" data-rel="tooltip" title="Edit">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
	
															<li>
																<a href="#modal-delete" data-toggle="modal" class="tooltip-error" data-rel="tooltip" title="Delete">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
														</ul>
													</div>
												</div>
											</td>
										</tr>
												</c:forEach>
											</c:otherwise>
										
										</c:choose>
									</tbody>
								</table>
							</div>
							<h4 class="pink">
								<i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer blue"></i>
								<a href="#modal-table" role="button" class="green" data-toggle="modal"> 등록 </a>
							</h4>
						</div>
						<form id="formDelete" action="${context}/myPage/deleteMyStock.do" method="post">
							<input type="hidden" id="deleteNo" name="no" value="" />
						</form>	
						
						<div id="modal-table" class="modal fade" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header no-padding">
										<div class="table-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												<span class="white">&times;</span>
											</button>
											보유 주식 등록
										</div>
									</div>

									<div class="modal-body no-padding">
										<div class="row">
											<div class="col-xs-12">
												
											</div>
										</div>
										<div class="space-4"></div>
										<div class="row">
											<div class="col-xs-12">
												<!-- PAGE CONTENT BEGINS -->
												<form id="frmStock" name="frmStock" class="form-horizontal" role="form" action="${context}/myPage/myStock.do" method="post" onSubmit="return checkEle()">
													<input type="hidden" id="comName" name="comName" value=""/>
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 기업명 </label>
														<div class="col-sm-9">
															<input class="col-xs-10 col-sm-5 typeahead scrollable" type="text"	placeholder="기업검색" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 구매 가격 </label>
							
														<div class="col-sm-9">
															<input type="number" id="buyPrice" name="buyPrice" class="col-xs-10 col-sm-5" />
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 보유량 </label>
							
														<div class="col-sm-9">
															<input type="number" id="volume" name="volume" class="col-xs-10 col-sm-5" />
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 구매일 </label>
							
														<div class="col-sm-9">
															<input type="date" id="buyDate" name="buyDate" class="col-xs-10 col-sm-5" />
														</div>
													</div>
												</form>
											</div><!-- /.row -->
										</div><!-- /.row -->
									</div>

									<div class="modal-footer no-margin-top">
										<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal">
											<i class="ace-icon fa fa-times"></i>
											취소
										</button>

										<button class="btn btn-sm btn-primary pull-right" id="btnReg" data-dismiss="modal">
											<i class="ace-icon fa fa-check"></i>
											등록
										</button>

									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div>
						
						<div id="modal-modify" class="modal fade" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header no-padding">
										<div class="table-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												<span class="white">&times;</span>
											</button>
											수정하기
										</div>
									</div>

									<div class="modal-body no-padding">
										<div class="row">
											<div class="col-xs-12">
												
											</div>
										</div>
										<div class="space-4"></div>
										<div class="row">
											<div class="col-xs-12">
												<!-- PAGE CONTENT BEGINS -->
												<form id="frmUpdate" name="frmUpdate" class="form-horizontal" role="form" action="${context}/myPage/myModify.do" method="post" onSubmit="return checkUpdate()">
													<input type="hidden" id="editNo" name="no" value="" />
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 기업명 </label>
														<div class="col-sm-9">
															<input class="col-xs-10 col-sm-5 typeahead scrollable" type="text" id="editName" name="comName" value="${myStock.comName}" />
														</div>
													</div>
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 구매 가격 </label>
							
														<div class="col-sm-9">
															<input type="number" id="editBuyPrice" name="buyPrice" class="col-xs-10 col-sm-5" />
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 보유량 </label>
							
														<div class="col-sm-9">
															<input type="number" id="editVolume" name="volume" class="col-xs-10 col-sm-5" />
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 구매일 </label>
							
														<div class="col-sm-9">
															<input type="date" id="editBuyDate" name="buyDate" class="col-xs-10 col-sm-5" />
														</div>
													</div>
												</form>
											</div><!-- /.row -->
										</div><!-- /.row -->
									</div>

									<div class="modal-footer no-margin-top">
										<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal">
											<i class="ace-icon fa fa-times"></i>
											취소
										</button>

										<button class="btn btn-sm btn-primary pull-right" id="btnUpdate" data-dismiss="modal">
											<i class="ace-icon fa fa-check"></i>
											등록
										</button>

									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div>
						
						<div id="modal-delete" class="modal fade" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header no-padding">
										<div class="table-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												<span class="white">&times;</span>
											</button>
											항목 삭제
										</div>
									</div>

									<div class="modal-body no-padding">
										<div class="space-4"></div>
										<div class="row">
											<div class="col-xs-12">
												<!-- PAGE CONTENT BEGINS -->
												<sapn class="col-sm-4"> 정말로 삭제하시겠습니까?</sapn>
											</div><!-- /.row -->
										</div><!-- /.row -->
										<div class="space-4"></div>
									</div>

									<div class="modal-footer no-margin-top">
										<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal">
											<i class="ace-icon fa fa-times"></i>
											취소
										</button>

										<button class="btn btn-sm btn-primary pull-right" id="btnDelete" data-dismiss="modal">
											<i class="ace-icon fa fa-check"></i>
											확인
										</button>

									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<footer class="footer">
	<jsp:include page="../include/bottom.jsp"></jsp:include>
</footer>
<!-- page specific plugin scripts -->
<script src="${context}/resources/assets/js/jquery.bootstrap-duallistbox.min.js"></script>
<script src="${context}/resources/assets/js/jquery-typeahead.js"></script>
<script src="${context}/resources/assets/js/jquery.dataTables.min.js"></script>
<script src="${context}/resources/assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="${context}/resources/assets/js/dataTables.buttons.min.js"></script>
<script src="${context}/resources/assets/js/buttons.flash.min.js"></script>
<script src="${context}/resources/assets/js/buttons.html5.min.js"></script>
<script src="${context}/resources/assets/js/buttons.colVis.min.js"></script>
<script src="${context}/resources/assets/js/dataTables.select.min.js"></script>
<!-- page specific plugin scripts -->
<script>

	$(document).on("click", ".fa-pencil", function() {
		var tr = $(this).closest('tr');
		var no = $(tr)[0].cells[0].innerText;
		var comName = $(tr)[0].cells[1].innerText;
		var buyPrice = $(tr)[0].cells[2].innerText;
		var volume = $(tr)[0].cells[3].innerText;
		var buyDate = $(tr)[0].cells[7].innerText;
	
		$('#editNo').attr("value", no);
		$('#editName').attr("value", comName);
		$('#editBuyPrice').attr("value", buyPrice);
		$('#editVolume').attr("value", volume);
		$('#editBuyDate').attr("value", buyDate);
	});
	
	$(document).on("click", ".fa-trash-o", function(){
		var tr = $(this).closest('tr');
		var no = $(tr)[0].cells[0].innerText;

		$('#deleteNo').attr("value", no);
	});
	
	$(document).on("click", ".tt-suggestion.tt-selectable", function() {
		change();
	});
	
	$("input.typeahead").keydown(function(key) {
		if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
			change();
		}
	});
	
	$(document).ready(function(){
		$('#btnReg').click(function(){
			$('#frmStock').submit();
		});
		
		$('#btnUpdate').click(function(){
			$('#frmUpdate').submit();
		});
		$('#btnDelete').click(function(){
			$('#formDelete').submit();
		});
	});
	
	function change() {
		var comName;
		if ($('input.typeahead')[1].value != $('input.typeahead')[0].value
				&& $('input.typeahead')[0].value != '') {
			comName = $('input.typeahead')[0].value;
		} else {
			comName = $('input.typeahead')[1].value;
		}
		console.log(comName)
		$('#comName').attr("value", comName);
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

	/* });
	
	jQuery(function($) { */
		//initiate dataTables plugin
		var myTable = 
		$('#dynamic-table')
		//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
		.DataTable( {
			bAutoWidth: false,
			"aoColumns": [
			  { "bSortable": false },
			   null, null, null, null, null, null, null,
			  { "bSortable": false }
			],
			"aaSorting": [],
	
			select: {
				style: 'multi'
			}
	    } );
	
		
		$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
		
		
		myTable.buttons().container().appendTo( $('.tableTools-container') );
		
		//style the message box
		var defaultCopyAction = myTable.button(1).action();
		myTable.button(1).action(function (e, dt, button, config) {
			defaultCopyAction(e, dt, button, config);
			$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
		});
		
		
		var defaultColvisAction = myTable.button(0).action();
		myTable.button(0).action(function (e, dt, button, config) {
			
			defaultColvisAction(e, dt, button, config);
			
			
			if($('.dt-button-collection > .dropdown-menu').length == 0) {
				$('.dt-button-collection')
				.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
				.find('a').attr('href', '#').wrap("<li />")
			}
			$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
		});
	
		////
	
		setTimeout(function() {
			$($('.tableTools-container')).find('a.dt-button').each(function() {
				var div = $(this).find(' > div').first();
				if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
				else $(this).tooltip({container: 'body', title: $(this).text()});
			});
		}, 500);
		
		myTable.on( 'select', function ( e, dt, type, index ) {
			if ( type === 'row' ) {
				$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
			}
		} );
		myTable.on( 'deselect', function ( e, dt, type, index ) {
			if ( type === 'row' ) {
				$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
			}
		} );
	
	
		/////////////////////////////////
		//table checkboxes
		$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
		
		//select/deselect all rows according to table header checkbox
		$('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function(){
			var th_checked = this.checked;//checkbox inside "TH" table header
			
			$('#dynamic-table').find('tbody > tr').each(function(){
				var row = this;
				if(th_checked) myTable.row(row).select();
				else  myTable.row(row).deselect();
			});
		});
		
		//select/deselect a row when the checkbox is checked/unchecked
		$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
			var row = $(this).closest('tr').get(0);
			if(this.checked) myTable.row(row).deselect();
			else myTable.row(row).select();
		});
	
	
	
		$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
			e.stopImmediatePropagation();
			e.stopPropagation();
			e.preventDefault();
		});
	
		/********************************/
		//add tooltip for small view action buttons in dropdown menu
		$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
		
		//tooltip placement on right or left
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table')
			var off1 = $parent.offset();
			var w1 = $parent.width();
	
			var off2 = $source.offset();
			//var w2 = $source.width();
	
			if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
			return 'left';
		}
	
	});	
	
	function checkEle(){
		var form = document.frmStock;
		var comName = form.comName;
		var buyPrice = form.buyPrice;
		var volume = form.volume;
		var buyDate = form.buyDate;
		
		alert(typeof(comName.value)+typeof(buyPrice.value)+typeof(volume.value)+typeof(buyDate.value))
		
		if(comName.value == "" || buyPrice.value == "" || volume.value == "" || buyDate.value == ""){
			alert("모든 항목을 입력하셔야 합니다.")
			return false;
		}
		return true;
	}
	
	function checkUpdate(){
		var form = document.frmUpdate;
		var comName = form.comName;
		var buyPrice = form.buyPrice;
		var volume = form.volume;
		var buyDate = form.buyDate;
		
		console.log("checkUpdate")
		return true;
	}
</script>
</body>
</html>