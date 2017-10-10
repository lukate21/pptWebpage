<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<link rel="stylesheet" href="${context}/resources/assets/css/jquery-ui.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/ui.jqgrid.min.css" />
<!-- text fonts -->
<link rel="stylesheet" href="${context}/resources/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context}/resources/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="${context}/resources/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/css/ace-rtl.min.css" />
<script src="${context}/resources/assets/js/ace-extra.min.js"></script>
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="${context}/resources/assets/js/bootstrap.min.js"></script>
<!-- inline styles related to this page -->
<!-- chart -->
<link rel="stylesheet" href="${context }/resources/amcharts_3.21.6.free/images/style.css" type="text/css">
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/pie.js" type="text/javascript"></script>
<style>
	.main-content, body, html {
	min-height: 95%
}
</style>
</head>
<body style="margin:auto">
	<div class="row">
		<div class="col-xs-12" id="chart">
			
		</div>
	</div>
	<script src="${context }/resources/assets/js/jquery.jqGrid.min.js"></script>
	<script src="${context }/resources/assets/js/grid.locale-en.js"></script>
	<script>
	var option = '${param.option}';
	var bestAnaCode = '${bestAnalysis.anaCode}';
	var bestNewsCode = '${bestAnalysis.newsCode}';
	var RTA = ${RTA};
	var reliability = [];
	<c:forEach items="${reliability}" var="reliabilityVO">
		reliability.push({
			anaCode : '${reliabilityVO.anaCode }',
			newsCode : '${reliabilityVO.newsCode }',
			value : '${reliabilityVO.value }'
		});
	</c:forEach>
	if(option == 'pie'){
		var chart;
		//카테고리별 오늘 상승/하락/동결 - 카테고리별 내일 상승/하락/동결
		var map = new Map();
		for ( var i in RTA) {
			var newsCode = RTA[i].newsCode;
			var anaCode = RTA[i].anaCode;
			var add;
			for(var j in reliability){
				if(reliability[j].anaCode == anaCode && reliability[j].newsCode == newsCode){
					add = Number(reliability[j].value)/100;
					break;
				}
			}
			if (map.has(newsCode)) {
				var updateList = map.get(newsCode);
				if (RTA[i].todayFluc == 'p')
					updateList[0] += add;
				else if (RTA[i].todayFluc == 'm')
					updateList[1] += add;
				else
					updateList[2] += add;
				if (RTA[i].tomorrowFluc == 'p')
					updateList[3] += add;
				else if (RTA[i].tomorrowFluc == 'm')
					updateList[4] += add;
				else
					updateList[5] += add;
				map.set(newsCode, updateList);
			} else {
				var list = [ 0, 0, 0, 0, 0, 0 ];
				if (RTA[i].todayFluc == 'p')
					list[0] += add;
				else if (RTA[i].todayFluc == 'm')
					list[1] += add;
				else
					list[2] += add;
				if (RTA[i].tomorrowFluc == 'p')
					list[3] += add;
				else if (RTA[i].tomorrowFluc == 'm')
					list[4] += add;
				else
					list[5] += add;
				map.set(newsCode, list);
			}
		}
		console.log(map);
		var types = [ '상승', '하락', '동결', '상승', '하락', '동결' ]
		var newsCodes = [ 'culture', 'digital', 'economic', 'entertain', 'foreign', 'politics', 'society'];
		var chartData1 = [];
		var chartData2 = [];
		for (var i = 0; i < 3; i++) {
			var value1 = 0;
			for (var j = 0; j < newsCodes.length; j++) {
				value1 += map.get(newsCodes[j])[i];
			}
			chartData1.push({
				type : types[i],
				value : value1
			});
		}
		for (var i = 3; i < 6; i++) {
			var value1 = 0;
			for (var j = 0; j < newsCodes.length; j++) {
				value1 += map.get(newsCodes[j])[i];
			}
			chartData2.push({
				type : types[i],
				value : value1
			});
		}
		$('#chart').append('<div class="row"><div class="space-12"></div><div id="todayChart" class="col-sm-6" style="height: 400px;"></div>'
							+'<div id="tomorrowChart" class="col-sm-6" style="height: 400px;"></div></div>')
		
		makeChart(chartData1, "todayChart", "금일 주가 예측");
		makeChart(chartData2, "tomorrowChart", "익일 주가 예측");

		function makeChart(chartData, div, title) {
			chart = new AmCharts.AmPieChart();
			chart.addTitle(title, 14);
			chart.dataProvider = chartData;
			chart.titleField = "type";
			chart.valueField = "value";
			chart.outlineColor = "#FFFFFF";
			chart.outlineAlpha = 0.8;
			chart.outlineThickness = 2;
			chart.labelRadius = 10;
			chart.labelText = "[[title]]: [[percents]]%";
			// WRITE
			chart.write(div);
		}
		$('a').remove();
	}else if(option== 'table'){
		$('#chart').append('<table id="grid-table"></table>');
		$('#chart').append('<div id="grid-pager"></div>');
		for(var i in RTA){
			if(RTA[i].newsCode == 'culture')
				RTA[i].newsCode = '문화';
			else if(RTA[i].newsCode == 'digital')
				RTA[i].newsCode = 'IT';
			else if(RTA[i].newsCode == 'economic')
				RTA[i].newsCode = '경제';
			else if(RTA[i].newsCode == 'entertain')
				RTA[i].newsCode = '연예';
			else if(RTA[i].newsCode == 'foreign')
				RTA[i].newsCode = '국제';
			else if(RTA[i].newsCode == 'politics')
				RTA[i].newsCode = '정치';
			else if(RTA[i].newsCode == 'society')
				RTA[i].newsCode = '사회';
			
			if(RTA[i].anaCode == 'opi1')
				RTA[i].anaCode = '감정분석1';
			else if(RTA[i].anaCode == 'opi2')
				RTA[i].anaCode = '감정분석2';
			else if(RTA[i].anaCode == 'pro1')
				RTA[i].anaCode = '확률분석1';
			else if(RTA[i].anaCode == 'pro2')
				RTA[i].anaCode = '확률분석2';
			else if(RTA[i].anaCode == 'fit1')
				RTA[i].anaCode = '필터분석1';
			else if(RTA[i].anaCode == 'fit2')
				RTA[i].anaCode = '필터분석2';
			else if(RTA[i].anaCode == 'meg1')
				RTA[i].anaCode = '통합분석1';
			else if(RTA[i].anaCode == 'meg2')
				RTA[i].anaCode = '통합분석2';
			
			if(RTA[i].todayFluc == 'p')
				RTA[i].todayFluc = '상승';
			else if(RTA[i].todayFluc == 'm')
				RTA[i].todayFluc = '하락';
			else if(RTA[i].todayFluc == '-')
				RTA[i].todayFluc = '동결';
			else if(RTA[i].todayFluc == 'x')
				RTA[i].todayFluc = '데이터부족';
			
			if(RTA[i].tomorrowFluc == 'p')
				RTA[i].tomorrowFluc = '상승';
			else if(RTA[i].tomorrowFluc == 'm')
				RTA[i].tomorrowFluc = '하락';
			else if(RTA[i].tomorrowFluc == '-')
				RTA[i].tomorrowFluc = '동결';
			else if(RTA[i].tomorrowFluc == 'x')
				RTA[i].tomorrowFluc = '데이터부족';
			
		}
		var bestTitle = '';
		if(bestNewsCode == 'culture')
			bestTitle += '문화';
		else if(bestNewsCode == 'digital')
			bestTitle += 'IT';
		else if(bestNewsCode == 'economic')
			bestTitle += '경제';
		else if(bestNewsCode == 'entertain')
			bestTitle += '연예';
		else if(bestNewsCode == 'foreign')
			bestTitle += '국제';
		else if(bestNewsCode == 'politics')
			bestTitle += '정치';
		else if(bestNewsCode == 'society')
			bestTitle += '사회';
		
		bestTitle += ' - ';
		
		if(bestAnaCode == 'opi1')
			bestTitle += '감정분석1';
		else if(bestAnaCode == 'opi2')
			bestTitle += '감정분석2';
		else if(bestAnaCode == 'pro1')
			bestTitle += '확률분석1';
		else if(bestAnaCode == 'pro2')
			bestTitle += '확률분석2';
		else if(bestAnaCode == 'fit1')
			bestTitle += '필터분석1';
		else if(bestAnaCode == 'fit2')
			bestTitle += '필터분석2';
		else if(bestAnaCode == 'meg1')
			bestTitle += '통합분석1';
		else if(bestAnaCode == 'meg2')
			bestTitle += '통합분석2';
		
		jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
			
			
			var parent_column = $(grid_selector).closest('[class*="col-"]');
			//resize to fit page size
			$(window).on('resize.jqGrid', function () {
				$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
		    })
			
			//resize on sidebar collapse/expand
			$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
				if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
					//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
					setTimeout(function() {
						$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
					}, 20);
				}
		    })
			
			jQuery(grid_selector).jqGrid({
				data: RTA,
				datatype: "local",
				height: 340,
				colNames:['뉴스 카테고리','분석방법', '금일 예측', '익일 예측','예측시간'],
				colModel:[
					{name:'newsCode',index:'newsCode',width:90, editable:true,unformat: pickDate},
					{name:'anaCode',index:'anaCode', width:150,editable: true,editoptions:{size:"20",maxlength:"30"}},
					{name:'todayFluc',index:'todayFluc', width:70, editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch},
					{name:'tomorrowFluc',index:'tomorrowFluc', width:90, editable: true,edittype:"select",editoptions:{value:"FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}},
					{name:'regDate',index:'regDate', width:150, sortable:"date",editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}} 
				], 
		
				viewrecords : true,
				rowNum:10,
				rowList:[10,30,56],
				pager : pager_selector,
				altRows: true,
				//toppager: true,
				
				multiselect: false,
				//multikey: "ctrlKey",
		        multiboxonly: true,
		
				loadComplete : function() {
					var table = this;
					setTimeout(function(){
						styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
				},
		
				editurl: "./dummy.php",//nothing is saved
				caption: "주가 예측 테이블 (베스트 예측 : " + bestTitle +")"
		
				//,autowidth: true,
		
		
				/**
				,
				grouping:true, 
				groupingView : { 
					 groupField : ['name'],
					 groupDataSorted : true,
					 plusicon : 'fa fa-chevron-down bigger-110',
					 minusicon : 'fa fa-chevron-up bigger-110'
				},
				caption: "Grouping"
				*/
		
			});
			$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
			
			//enable search/filter toolbar
			//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
			//jQuery(grid_selector).filterToolbar({});
		
			//switch element when editing inline
			function aceSwitch( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=checkbox]')
						.addClass('ace ace-switch ace-switch-5')
						.after('<span class="lbl"></span>');
				}, 0);
			}
			//enable datepicker
			function pickDate( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=text]')
						.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
				}, 0);
			}
		
		
			//navButtons
			
			function style_edit_form(form) {
				//enable datepicker on "sdate" field and switches for "stock" field
				form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
				
				form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
						   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
						  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
		
						
				//update buttons classes
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
				buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
				
				buttons = form.next().find('.navButton a');
				buttons.find('.ui-icon').hide();
				buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
				buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
			}
		
			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
				buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
			}
			
			function style_search_filters(form) {
				form.find('.delete-rule').val('X');
				form.find('.add-rule').addClass('btn btn-xs btn-primary');
				form.find('.add-group').addClass('btn btn-xs btn-success');
				form.find('.delete-group').addClass('btn btn-xs btn-danger');
			}
			function style_search_form(form) {
				var dialog = form.closest('.ui-jqdialog');
				var buttons = dialog.find('.EditTable')
				buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
				buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
				buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
			}
			
			function beforeDeleteCallback(e) {
				var form = $(e[0]);
				if(form.data('styled')) return false;
				
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				
				form.data('styled', true);
			}
			
			function beforeEditCallback(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		
			function styleCheckbox(table) {
			}
			
		
			function updateActionIcons(table) {
			}
			
			//replace icons with FontAwesome icons like above
			function updatePagerIcons(table) {
				var replacement = 
				{
					'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
					'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
					'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
					'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
				};
				$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
					var icon = $(this);
					var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
					
					if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
				})
			}
		
			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({container:'body'});
				$(table).find('.ui-pg-div').tooltip({container:'body'});
			}
		
			$(document).one('ajaxloadstart.page', function(e) {
				$.jgrid.gridDestroy(grid_selector);
				$('.ui-jqdialog').remove();
			});
		});
	}
</script>
		

</body>
</html>

