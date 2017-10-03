<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap.min.css" />
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
<script src="${context}/resources/assets/js/bootstrap.min.js"></script>
<!-- inline styles related to this page -->
<!-- chart -->
<link rel="stylesheet" href="${context }/resources/amcharts_3.21.6.free/images/style.css" type="text/css">
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/pie.js" type="text/javascript"></script>
</head>
<body style="margin:20">
	<div class="row">
		<div class="col-sm-12">
			<div id="todayChart" class="col-sm-6" style="height: 350px;"></div>
			<div id="tomorrowChart" class="col-sm-6" style="height: 350px;"></div>
		</div>
	</div>
	<script>
		var RTA = ${RTA};
		var chart;
		//카테고리별 오늘 상승/하락/동결 - 카테고리별 내일 상승/하락/동결
		var map = new Map();
		for ( var i in RTA) {
			var newsCode = RTA[i].newsCode;
			if (map.has(newsCode)) {
				var updateList = map.get(newsCode);
				if (RTA[i].todayFluc == 'p')
					updateList[0]++;
				else if (RTA[i].todayFluc == 'm')
					updateList[1]++;
				else
					updateList[2]++;
				if (RTA[i].tomorrowFluc == 'p')
					updateList[3]++;
				else if (RTA[i].tomorrowFluc == 'm')
					updateList[4]++;
				else
					updateList[5]++;
				map.set(newsCode, updateList);
			} else {
				var list = [ 0, 0, 0, 0, 0, 0 ];
				if (RTA[i].todayFluc == 'p')
					list[0]++;
				else if (RTA[i].todayFluc == 'm')
					list[1]++;
				else
					list[2]++;
				if (RTA[i].tomorrowFluc == 'p')
					list[3]++;
				else if (RTA[i].tomorrowFluc == 'm')
					list[4]++;
				else
					list[5]++;
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
		console.log(chartData1);
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
			chart.outlineThickness = 1;

			// WRITE
			chart.write(div);
		}
	</script>
</body>
</html>

