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
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/serial.js" type="text/javascript"></script>
<script>
	var RTA = ${RTA};
</script>
</head>
<body>
	<div class="row">
		<div id="chart" class="col-sm-12" style="height:350px;"></div>
	</div>
	<script>
	respons('${option}');
	function respons(option){
		var chart;
		//카테고리별 오늘 상승/하락/동결 - 카테고리별 내일 상승/하락/동결
		var map = new Map();
		var chartData1 = [];
		var chartData2 = [];
		if(option == 'newsCode'){
			for(var i in RTA){
				var newsCode = RTA[i].newsCode;
				if(map.has(newsCode)){
					var updateList = map.get(newsCode);
					if(RTA[i].todayFluc == 'p')
						updateList[0]++;
					else if(RTA[i].todayFluc == 'm')
						updateList[1]++;
					else
						updateList[2]++;
					if(RTA[i].tomorrowFluc == 'p')
						updateList[3]++;
					else if(RTA[i].tomorrowFluc == 'm')
						updateList[4]++;
					else
						updateList[5]++;
					map.set(newsCode,updateList);
				}else{
					var list = [0,0,0,0,0,0];
					if(RTA[i].todayFluc == 'p')
						list[0]++;
					else if(RTA[i].todayFluc == 'm')
						list[1]++;
					else
						list[2]++;
					if(RTA[i].tomorrowFluc == 'p')
						list[3]++;
					else if(RTA[i].tomorrowFluc == 'm')
						list[4]++;
					else
						list[5]++;
					map.set(newsCode,list);
				}
			}
			console.log(map);
			var types = ['감정분석1','감정분석2','확률분석1','확률분석2','필터분석1','필터분석2','통합분석1','통합분석2'];
			for(var i=0; i<types.length; i++){
				chartData1.push({
					type : types[i],
					economic : (map.get('economic')[i]/8*100).toFixed(1),
					digital : (map.get('digital')[i]/8*100).toFixed(1),
					culture : (map.get('culture')[i]/8*100).toFixed(1),
					politics : (map.get('politics')[i]/8*100).toFixed(1),
					foreign : (map.get('foreign')[i]/8*100).toFixed(1),
				});
			}
			for(var i=3; i<types.length; i++){
				chartData2.push({
					type : types[i],
					economic : (map.get('economic')[i]/8*100).toFixed(1),
					digital : (map.get('digital')[i]/8*100).toFixed(1),
					culture : (map.get('culture')[i]/8*100).toFixed(1),
					politics : (map.get('politics')[i]/8*100).toFixed(1),
					foreign : (map.get('foreign')[i]/8*100).toFixed(1),
				});
			}
			makeChart(chartData1,"chart");
			//makeChart(chartData2,"newsTomorrowChart");
			function makeChart(chartData,div){
				chart = new AmCharts.AmSerialChart();
				chart.addTitle("뉴스 - 분석방법 신뢰도", 14);
	            chart.dataProvider = chartData;
	            chart.categoryField = "type";
	            chart.startDuration = 0.5;
	            chart.balloon.color = "#000000";

	            // AXES
	            // category
	            var categoryAxis = chart.categoryAxis;
	            categoryAxis.fillAlpha = 1;
	            categoryAxis.fillColor = "#FAFAFA";
	            categoryAxis.gridAlpha = 0;
	            categoryAxis.axisAlpha = 0;
	            categoryAxis.gridPosition = "start";
	            categoryAxis.position = "bottom";

	            // value
	            var valueAxis = new AmCharts.ValueAxis();
	            valueAxis.title = "예측확률(%)";
	            valueAxis.dashLength = 5;
	            valueAxis.axisAlpha = 0;
	            valueAxis.minimum = 0;
	            valueAxis.maximum = 100;
	            valueAxis.integersOnly = true;
	            valueAxis.gridCount = 10;
	            valueAxis.reversed = false; // this line makes the value axis reversed
	            chart.addValueAxis(valueAxis);

	            // GRAPHS
	            var graph = new AmCharts.AmGraph();
	            graph.title = "경제";
	            graph.valueField = "economic";
	            graph.balloonText = "경제뉴스의 [[category]]: [[value]]";
	            graph.lineAlpha = 1;
	            graph.bullet = "round";
	            chart.addGraph(graph);

	            var graph = new AmCharts.AmGraph();
	            graph.title = "정치";
	            graph.valueField = "politics";
	            graph.balloonText = "정치뉴스의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);

	            var graph = new AmCharts.AmGraph();
	            graph.title = "사회";
	            graph.valueField = "foreign";
	            graph.balloonText = "IT뉴스의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "문화";
	            graph.valueField = "culture";
	            graph.balloonText = "문화뉴스의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "IT";
	            graph.valueField = "digital";
	            graph.balloonText = "IT뉴스의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            

	            // CURSOR
	            var chartCursor = new AmCharts.ChartCursor();
	            chartCursor.cursorPosition = "mouse";
	            chartCursor.zoomable = false;
	            chartCursor.cursorAlpha = 0;
	            chart.addChartCursor(chartCursor);

	            // LEGEND
	            var legend = new AmCharts.AmLegend();
	            legend.useGraphSettings = true;
	            chart.addLegend(legend);

	            // WRITE
	            chart.write(div);
	            $('a').remove();
			}
		}else if(option == 'anaCode'){
			for(var i in RTA){
				var anaCode = RTA[i].anaCode;
				if(map.has(anaCode)){
					var updateList = map.get(anaCode);
					if(RTA[i].todayFluc == 'p')
						updateList[0]++;
					else if(RTA[i].todayFluc == 'm')
						updateList[1]++;
					else
						updateList[2]++;
					if(RTA[i].tomorrowFluc == 'p')
						updateList[3]++;
					else if(RTA[i].tomorrowFluc == 'm')
						updateList[4]++;
					else
						updateList[5]++;
					map.set(anaCode,updateList);
				}else{
					var list = [0,0,0,0,0,0];
					if(RTA[i].todayFluc == 'p')
						list[0]++;
					else if(RTA[i].todayFluc == 'm')
						list[1]++;
					else
						list[2]++;
					if(RTA[i].tomorrowFluc == 'p')
						list[3]++;
					else if(RTA[i].tomorrowFluc == 'm')
						list[4]++;
					else
						list[5]++;
					map.set(anaCode,list);
				}
			}
			var types = ['정치','경제','사회','문화','연예','IT']
			for(var i=0; i<types.length; i++){
				chartData1.push({
					type : types[i],
					opi1 : (map.get('opi1')[i]/5*100).toFixed(1), 
					opi2 : (map.get('opi2')[i]/5*100).toFixed(1), 
					pro1 : (map.get('pro1')[i]/5*100).toFixed(1), 
					pro2 : (map.get('pro2')[i]/5*100).toFixed(1), 
					fit1 : (map.get('fit1')[i]/5*100).toFixed(1), 
					fit2 : (map.get('fit2')[i]/5*100).toFixed(1), 
					meg1 : (map.get('meg1')[i]/5*100).toFixed(1), 
					meg2 : (map.get('meg2')[i]/5*100).toFixed(1), 
				});
			}
			/* for(var i=3; i<types.length; i++){
				chartData2.push({
					type : types[i],
					opi1 : (map.get('opi1')[i]/5*100).toFixed(1), 
					opi2 : (map.get('opi2')[i]/5*100).toFixed(1), 
					pro1 : (map.get('pro1')[i]/5*100).toFixed(1), 
					pro2 : (map.get('pro2')[i]/5*100).toFixed(1), 
					fit1 : (map.get('fit1')[i]/5*100).toFixed(1), 
					fit2 : (map.get('fit2')[i]/5*100).toFixed(1), 
					meg1 : (map.get('meg1')[i]/5*100).toFixed(1), 
					meg2 : (map.get('meg2')[i]/5*100).toFixed(1), 
				});
			} */
			makeChart(chartData1,"chart");
			//makeChart(chartData2,"anaTomorrowChart");
			function makeChart(chartData,div){
	            chart = new AmCharts.AmSerialChart();
	            chart.dataProvider = chartData;
	            chart.addTitle("분석방법 - 뉴스 신뢰도", 14);
	            chart.categoryField = "type";
	            chart.startDuration = 0.5;
	            chart.balloon.color = "#000000";
	
	            // AXES
	            // category
	            var categoryAxis = chart.categoryAxis;
	            categoryAxis.fillAlpha = 1;
	            categoryAxis.fillColor = "#FAFAFA";
	            categoryAxis.gridAlpha = 0;
	            categoryAxis.axisAlpha = 0;
	            categoryAxis.gridPosition = "start";
	            categoryAxis.position = "bottom";
	
	            // value
	            var valueAxis = new AmCharts.ValueAxis();
	            valueAxis.title = "예측확률(%)";
	            valueAxis.dashLength = 5;
	            valueAxis.axisAlpha = 0;
	            valueAxis.minimum = 0;
	            valueAxis.maximum = 100;
	            valueAxis.integersOnly = true;
	            valueAxis.gridCount = 10;
	            valueAxis.reversed = false; // this line makes the value axis reversed
	            chart.addValueAxis(valueAxis);
	
	            // GRAPHS
	            var graph = new AmCharts.AmGraph();
	            graph.title = "감정분석1";
	            graph.valueField = "opi1";
	            graph.balloonText = "감정분석 1의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "감정분석2";
	            graph.valueField = "opi2";
	            graph.balloonText = "감정분석2의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "확률분석1";
	            graph.valueField = "pro1";
	            graph.balloonText = "확률분석 1의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "확률분석2";
	            graph.valueField = "pro2";
	            graph.balloonText = "확률분석2의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "필터분석1";
	            graph.valueField = "fit1";
	            graph.balloonText = "필터분석 1의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "필터분석2";
	            graph.valueField = "fit2";
	            graph.balloonText = "필터분석2의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "통합분석1";
	            graph.valueField = "meg1";
	            graph.balloonText = "통합분석 1의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "통합분석2";
	            graph.valueField = "meg2";
	            graph.balloonText = "통합분석2의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	
	
	            // CURSOR
	            var chartCursor = new AmCharts.ChartCursor();
	            chartCursor.cursorPosition = "mouse";
	            chartCursor.zoomable = false;
	            chartCursor.cursorAlpha = 0;
	            chart.addChartCursor(chartCursor);
	
	            // LEGEND
	            var legend = new AmCharts.AmLegend();
	            legend.useGraphSettings = true;
	            chart.addLegend(legend);
	
	            // WRITE
	            chart.write(div);
	            $('a').remove();
			}
		}
    }
	</script>
</body>
</html>

