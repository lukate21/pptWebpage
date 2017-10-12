<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap.min.css" />
<!-- page specific plugin styles -->
<!-- text fonts -->
<link rel="stylesheet" href="${context}/resources/assets/css/fonts.googleapis.com.css" />
<link rel="stylesheet" href="${context}/resources/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
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
<script>
var option = '${param.option}';
var RTA = ${RTA};
</script>
</head>
<body style="margin:auto">
	<div class="row">
		<div class="col-xs-12" id="chart">
		</div>
		<c:if test="${param.option =='table'}">
		<div class="col-xs-12">
			<table id="dynamic-table" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>뉴스</th>
						<th>분석방법</th>
						<th>금일 예측</th>
						<th>익일 예측</th>
						<th>예측시간</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		</c:if>
	</div>
<script src="${context}/resources/assets/js/jquery.dataTables.min.js"></script>
<script src="${context}/resources/assets/js/jquery.dataTables.bootstrap.min.js"></script>
<script src="${context}/resources/assets/js/dataTables.buttons.min.js"></script>
<script src="${context}/resources/assets/js/buttons.flash.min.js"></script>
<script src="${context}/resources/assets/js/buttons.html5.min.js"></script>
<script src="${context}/resources/assets/js/buttons.colVis.min.js"></script>
<script src="${context}/resources/assets/js/dataTables.select.min.js"></script>
	<script>
	if(option == 'pie'){
		var reliability = [];
		<c:forEach items="${reliability}" var="reliabilityVO">
			reliability.push({
				anaCode : '${reliabilityVO.anaCode }',
				newsCode : '${reliabilityVO.newsCode }',
				value : '${reliabilityVO.value }'
			});
		</c:forEach>
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
				else if(RTA[i].todayFluc == '-')
					updateList[2] += add;
				if (RTA[i].tomorrowFluc == 'p')
					updateList[3] += add;
				else if (RTA[i].tomorrowFluc == 'm')
					updateList[4] += add;
				else if(RTA[i].tomorrowFluc == '-')
					updateList[5] += add;
				map.set(newsCode, updateList);
			} else {
				var list = [ 0, 0, 0, 0, 0, 0 ];
				if (RTA[i].todayFluc == 'p')
					list[0] += add;
				else if (RTA[i].todayFluc == 'm')
					list[1] += add;
				else if (RTA[i].todayFluc == '-')
					list[2] += add;
				if (RTA[i].tomorrowFluc == 'p')
					list[3] += add;
				else if (RTA[i].tomorrowFluc == 'm')
					list[4] += add;
				else if (RTA[i].tomorrowFluc == '-')
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
		$('#chart').append('<div class="row"><div class="space-12"></div><div id="todayChart" class="col-sm-6" style="height: 250px;"></div>'
							+'<div id="tomorrowChart" class="col-sm-6" style="height: 250px;"></div></div>')
		
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
			
		$('#dynamic-table tbody').append('<tr><td>'+RTA[i].newsCode+'</td><td>'+RTA[i].anaCode
											+'</td><td>'+RTA[i].todayFluc+'</td><td>'+RTA[i].tomorrowFluc
											+'</td><td>'+RTA[i].regDate+'</td></tr>');
		}
		jQuery(function($) {
			//initiate dataTables plugin
			var myTable = 
			$('#dynamic-table')
			//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
			.DataTable( {
				bAutoWidth: false,
				"aoColumns": [
				  null, null, null, null, null
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
		
		});	
	}
</script>
		

</body>
</html>

