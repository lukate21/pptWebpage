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
<link rel="stylesheet" href="${context}/resources/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

<!-- inline styles related to this page -->
<!-- chart -->
<link rel="stylesheet" href="${context }/resources/amcharts_3.21.6.free/images/style.css" type="text/css">
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/serial.js" type="text/javascript"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<style>
	.main-content, body, html {
	min-height: 90%;
	margin-top : 0;
	margin-bottom : 0;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-xs-12">
			<span class="pull-right">
			<input type="checkbox" class="ace ace-switch ace-switch-5 pull-right"
			checked data-toggle="toggle" data-on="뉴스" data-off="분석방법" 
			data-onstyle="success" data-offstyle="danger" id="toggleBtn">
			</span>
		</div>
		<div id="chart" class="col-sm-12" style="height:600px;"></div>
		<div class="pull-right"><i>2017-07-01 ~ 2017-08-31</i></div>
	</div>
	<script>
	$('#toggleBtn').change(function(){
		if( $(this).prop('checked')){
			respons('newsCode');
		}else{
			respons('anaCode');
		}
	});
	var bestAnaCode = '${bestAnalysis.anaCode}';
	var bestNewsCode = '${bestAnalysis.newsCode}';
	var bestValue = '${bestAnalysis.value}';
	var reliability = [];
	<c:forEach items="${reliability}" var="reliabilityVO">
		reliability.push({
			anaCode : '${reliabilityVO.anaCode }',
			newsCode : '${reliabilityVO.newsCode }',
			value : '${reliabilityVO.value }'
		});
	</c:forEach>
	var sum=0;
	var deviation=0;
	for(i in reliability){
		var value = Number(reliability[i].value);
		sum += value;
		deviation += (value*value);
	}
	var mean = sum/56;
	deviation = Math.sqrt((deviation/56 - (mean*mean)));
	var variance = deviation*deviation;
	console.log('평균 : ' + mean);
	console.log('표준편차 : '+ deviation);
	console.log('분산 : '+variance);
	
	respons('${option}');
	function respons(option){
		var chart;
		//카테고리별 오늘 상승/하락/동결 - 카테고리별 내일 상승/하락/동결
		var map = new Map();
		var chartData = [];
		if(option == 'newsCode'){
			var cultureList = [];
			var digitalList = [];
			var economicList = [];
			var entertainList = [];
			var foreignList = [];
			var politicsList = [];
			var societyList = [];
			for(var i in reliability){
				if(reliability[i].newsCode == 'culture')
					cultureList.push(reliability[i].value);
				else if(reliability[i].newsCode == 'digital')
					digitalList.push(reliability[i].value);
				else if(reliability[i].newsCode == 'economic')
					economicList.push(reliability[i].value);
				else if(reliability[i].newsCode == 'entertain')
					entertainList.push(reliability[i].value);
				else if(reliability[i].newsCode == 'foreign')
					foreignList.push(reliability[i].value);
				else if(reliability[i].newsCode == 'politics')
					politicsList.push(reliability[i].value);
				else if(reliability[i].newsCode == 'society')
					societyList.push(reliability[i].value);
			}
			var types = ['감정분석1','감정분석2','확률분석1','확률분석2','필터분석1','필터분석2','통합분석1','통합분석2'];
			for(var i=0; i<types.length; i++){
				chartData.push({
					type : types[i],
					culture : cultureList[i],
					digital : digitalList[i],
					economic : economicList[i],
					entertain : entertainList[i],
					foreign : foreignList[i],
					politics : politicsList[i],
					society : societyList[i]
				});
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
			
			bestTitle += ' : ' + bestValue + '%';
			
			makeChart(chartData,"chart");
			
			function makeChart(chartData,div){
				chart = new AmCharts.AmSerialChart();
				chart.addTitle("뉴스 - 분석방법 신뢰도 (" + bestTitle + ")", 14);
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
	            valueAxis.title = "예측확률";
	            valueAxis.dashLength = 5;
	            valueAxis.axisAlpha = 0;
	            valueAxis.minimum = 20;
	            valueAxis.maximum = 80;
	            valueAxis.integersOnly = true;
	            valueAxis.gridCount = 10;
	            valueAxis.reversed = false; // this line makes the value axis reversed
	            chart.addValueAxis(valueAxis);

	            
	            // GRAPHS
	            var graph = new AmCharts.AmGraph();
	            graph.title = "문화";
	            graph.valueField = "culture";
	            graph.balloonText = "문화뉴스의 [[category]]: [[value]]";
	            graph.lineAlpha = 1;
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "IT";
	            graph.valueField = "digital";
	            graph.balloonText = "IT뉴스의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "경제";
	            graph.valueField = "economic";
	            graph.balloonText = "경제뉴스의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "연예";
	            graph.valueField = "entertain";
	            graph.balloonText = "연예뉴스의 [[category]]: [[value]]";
	            graph.bullet = "round";
	            chart.addGraph(graph);
	            
	            var graph = new AmCharts.AmGraph();
	            graph.title = "국제";
	            graph.valueField = "foreign";
	            graph.balloonText = "국제뉴스의 [[category]]: [[value]]";
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
	            graph.balloonText = "사회뉴스의 [[category]]: [[value]]";
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
			var opi1List = [];
			var opi2List = [];
			var pro1List = [];
			var pro2List = [];
			var fit1List = [];
			var fit2List = [];
			var meg1List = [];
			var meg2List = [];
			for(var i in reliability){
				if(reliability[i].anaCode == 'opi1')
					opi1List.push(reliability[i].value);
				else if(reliability[i].anaCode == 'opi2')
					opi2List.push(reliability[i].value);
				else if(reliability[i].anaCode == 'pro1')
					pro1List.push(reliability[i].value);
				else if(reliability[i].anaCode == 'pro2')
					pro2List.push(reliability[i].value);
				else if(reliability[i].anaCode == 'fit1')
					fit1List.push(reliability[i].value);
				else if(reliability[i].anaCode == 'fit2')
					fit2List.push(reliability[i].value);
				else if(reliability[i].anaCode == 'meg1')
					meg1List.push(reliability[i].value);
				else if(reliability[i].anaCode == 'meg2')
					meg2List.push(reliability[i].value);
			}
			var types = ['문화','IT','경제','연예','국제','정치','사회'];
			for(var i=0; i<types.length; i++){
				chartData.push({
					type : types[i],
					opi1 : opi1List[i],
					opi2 : opi2List[i],
					pro1 : pro1List[i],
					pro2 : pro2List[i],
					fit1 : fit1List[i],
					fit2 : fit2List[i],
					meg1 : meg1List[i],
					meg2 : meg2List[i]
				});
			}
			var bestTitle = '';
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
			
			bestTitle += ' - ';
			
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
			
			bestTitle += ' : ' + bestValue + '%';
			makeChart(chartData,"chart");
			function makeChart(chartData,div){
	            chart = new AmCharts.AmSerialChart();
	            chart.dataProvider = chartData;
	            chart.addTitle("분석방법 - 뉴스 신뢰도 (" + bestTitle + ")", 14);
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
	            valueAxis.title = "예측확률";
	            valueAxis.dashLength = 5;
	            valueAxis.axisAlpha = 0;
	            valueAxis.minimum = 20;
	            valueAxis.maximum = 80;
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

