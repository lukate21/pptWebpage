<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${context}/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${context}/resources/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
<!-- inline styles related to this page -->
<script src="${context}/resources/assets/js/jquery-2.1.4.min.js"></script>
<!-- chart -->
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/serial.js" type="text/javascript"></script>
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/amstock.js" type="text/javascript"></script>
<link rel="stylesheet" href="${context }/resources/amcharts_3.21.6.free/images/style.css" type="text/css">
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/serial.js" type="text/javascript"></script>
</head>
<body style="margin-top:0;margin-bottom:0">
			&nbsp;<span id="now"></span>
			금일 예측 : <span id="predict"></span>&nbsp;&nbsp;&nbsp;
			베스트 예측 : <span id="bestPredict"></span>
			<span style="cursor:pointer;" class="badge badge-success pull-right" onclick="drawChart2('1_YEAR')">1년</span>
			<span style="cursor:pointer;" class="badge badge-success pull-right" onclick="drawChart2('1_MONTH')">1개월</span>
			<span style="cursor:pointer;" class="badge badge-success pull-right" onclick="drawChart('1_DAY')">1일</span> 
	
	<div id="chartdiv" class="col-sm-12" style="height:300px;"></div>
	
	<script>
	var bestAnaCode = '${bestAnalysis.anaCode}';
	var bestNewsCode = '${bestAnalysis.newsCode}';
	var RTA = ${RTA};
	var pCnt = 0;
	var mCnt = 0;
	for(var i in RTA){
		if(RTA[i].todayFluc == "p")
			pCnt++;
		else if(RTA[i].todayFluc == "m")
			mCnt++;
		if(RTA[i].anaCode == bestAnaCode && RTA[i].newsCode == bestNewsCode){
			var predict = RTA[i].todayFluc;
			if(predict == 'p'){
				predict = '상승';
				$('#bestPredict').html('<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp;'+predict+'</b></span>');
			}
			else if(predict == 'm'){
				predict = '하락';
				$('#bestPredict').html('<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp;'+predict+'</b></span>');
			}else if(predict == '-'){
				predict = '동결';
				$('#bestPredict').html('<b>- '+predict+'</b>');
			}else if(predict == 'x'){
				predict = '데이터 부족';
				$('#bestPredict').html('<b>'+predict+'</b>');
			}
		}
	}
	var predicValue;
	if(pCnt>mCnt){
		$('#predict').html('<span class="text-danger"><b><i class="fa fa-caret-up"></i>'+(pCnt/56*100).toFixed(0)+'%</b></span>');
	}else if(pCnt<mCnt){
		$('#predict').html('<span class="text-primary"><b><i class="fa fa-caret-down"></i>'+(mCnt/56*100).toFixed(0)+'%</b></span>');
	}else{
		$('#predict').html('<b>-</b>');
	}
	
	drawChart('1_DAY');
	function drawChart(timeFrame){
		$.ajax({
			url : '${context}/company/rtStock.json?name=${name}&timeFrame='+timeFrame,
			success : function(data){
				var obj = JSON.parse(data)[0];
				var chartData = obj.price;
				var start = chartData[0].value;
				var now = chartData[chartData.length-1].value;
				if(start<now){
					$('#now').html('<span class="text-danger"><h3 style="margin-top:0"><b>'+now+'</b><small class="text-danger">'
									+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-up"></i>&nbsp;'+(now-start)
									+'&nbsp;&nbsp;&nbsp;+'+((now-start)/start*100).toFixed(2)+'%</small></h3></span>');
				}else if(start>now){
					$('#now').html('<span class="text-primary"><h3 style="margin-top:0"><b>'+now+'</b><small class="text-primary">'
							+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down"></i>&nbsp;'+(start-now)
							+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></h3></span>');
				}else{
					$('#now').html('<span><h3 style="margin-top:0"><b>'+now+'</b><small>'
							+'&nbsp;&nbsp;&nbsp;-'+(start-now)
							+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></h3></span>');
				}
				var chart = AmCharts.makeChart("chartdiv", {
					type: "stock",

					categoryAxesSettings: {
						minPeriod: "mm"
					},

					dataSets: [{
						color: "#b0de09",
						 fieldMappings: [{
							fromField: "value",
							toField: "value"
						}/* , {
							fromField: "volume",
							toField: "volume"
						} */],

						dataProvider: chartData,
						categoryField: "dateTime",
						/* stockEvents: [{
							date: new Date(chartData[60].dateTime),
							type: "sign",
							backgroundColor: "#85CDE6",
							graph: "g1",
							text: "S",
							description: "This is description of an event"
						}, {
							date: new Date(chartData[70].dateTime),
							type: "arrowUp",
							backgroundColor: "#FFFFFF",
							backgroundAlpha: 0.5,
							graph: "g1",
							text: "F",
							description: "Some longer\ntext can also\n be added"
						}] */
					}],

					panels: [{
							showCategoryAxis: true,
							//title: "${name}",
							percentHeight: 70,

							valueAxes:[{
									id:"v1"
								}
							],

							stockGraphs: [{
								id: "g1",
								valueField: "value",
								type: "smoothedLine",
								lineThickness: 2,
								dateFormat: "MM-DD HH:NN",
								balloonText: "<b>[[value]]</b>",
								bullet: "round"
							}],

							stockLegend: {
								valueTextRegular: " ",
								markerType: "none"
							}
						}/* ,



						{
							title: "Volume",
							percentHeight: 30,

							stockGraphs: [{
								valueField: "volume",
								type: "column",
								cornerRadiusTop: 2,
								fillAlphas: 1
							}],
	 
							stockLegend: {
								valueTextRegular: " ",
								markerType: "none"
							}
						} */
					],

					chartScrollbarSettings: {
						graph: "g1",
						usePeriod: "10mm",
						position: "bottom",
						updateOnReleaseOnly:false
					},

					chartCursorSettings: {
						valueBalloonsEnabled: true,
						valueLineBalloonEnabled:true,
						valueLineEnabled:true
					},

					periodSelector: {
						position: "bottom",
						dateFormat: "MM-DD HH:NN",
						inputFieldWidth: 100,
						periods: [{
							period: "hh",
							count: 1,
							label: "1시간"
						}, {
							period: "hh",
							count: 3,
							label: "3시간"
						}, {
							period: "MAX",
							selected:true,
							label: "MAX"
						}]
					},

					panelsSettings: {
						mouseWheelZoomEnabled:true,
						usePrefixes: true,
						accessible: true
					}
				});
				$('a').remove();
			}
		});
	}
	function drawChart2(timeFrame){
		$.ajax({
			url : '${context}/company/rtStock.json?name=${name}&timeFrame='+timeFrame,
			success : function(data){
				var chart;
				var obj = JSON.parse(data)[0];
				var chartData = [];
				chartData = obj.price;
				console.log(chartData);
				createStockChart();
				function createStockChart() {
					chart = new AmCharts.AmStockChart();
		
					// As we have minutely data, we should set minPeriod to "mm"
					var categoryAxesSettings = new AmCharts.CategoryAxesSettings();
					categoryAxesSettings.minPeriod = "mm";
					chart.categoryAxesSettings = categoryAxesSettings;
		
					// DATASETS //////////////////////////////////////////
					var dataSet = new AmCharts.DataSet();
					dataSet.color = "#b0de09";
					dataSet.fieldMappings = [{
						fromField: "value",
						toField: "value"
					}/* , {
						fromField: "volume",
						toField: "volume"
					} */];
					dataSet.dataProvider = chartData;
					dataSet.categoryField = "date";
		
					// set data sets to the chart
					chart.dataSets = [dataSet];
					// PANELS ///////////////////////////////////////////
					// first stock panel
					var stockPanel1 = new AmCharts.StockPanel();
					stockPanel1.showCategoryAxis = true;
					//stockPanel1.title = "Value";
					stockPanel1.percentHeight = 70;
		
					// graph of first stock panel
					var graph1 = new AmCharts.StockGraph();
					graph1.valueField = "value";
					graph1.balloonText = '<b>[[value]]</b>',
					graph1.type = "smoothedLine";
					graph1.lineThickness = 2;
					graph1.bullet = "round";
					graph1.bulletBorderColor = "#FFFFFF";
					graph1.bulletBorderAlpha = 1;
					graph1.bulletBorderThickness = 3;
					stockPanel1.addStockGraph(graph1);
		
					// create stock legend
					var stockLegend1 = new AmCharts.StockLegend();
					stockLegend1.valueTextRegular = " ";
					stockLegend1.markerType = "none";
					stockPanel1.stockLegend = stockLegend1;
		
					/* 
					// second stock panel
					var stockPanel2 = new AmCharts.StockPanel();
					stockPanel2.title = "Volume";
					stockPanel2.percentHeight = 30;
					var graph2 = new AmCharts.StockGraph();
					graph2.valueField = "volume";
					graph2.type = "column";
					graph2.cornerRadiusTop = 2;
					graph2.fillAlphas = 1;
					stockPanel2.addStockGraph(graph2);
		
					// create stock legend
					var stockLegend2 = new AmCharts.StockLegend();
					stockLegend2.valueTextRegular = " ";
					stockLegend2.markerType = "none";
					stockPanel2.stockLegend = stockLegend2;
		
					// set panels to the chart
					chart.panels = [stockPanel1, stockPanel2];
					 */
					chart.panels = [stockPanel1];
		
		
					// OTHER SETTINGS ////////////////////////////////////
					var scrollbarSettings = new AmCharts.ChartScrollbarSettings();
					scrollbarSettings.graph = graph1;
					scrollbarSettings.usePeriod = "10mm"; // this will improve performance
					scrollbarSettings.updateOnReleaseOnly = false;
					scrollbarSettings.position = "bottom";
					chart.chartScrollbarSettings = scrollbarSettings;
		
					var cursorSettings = new AmCharts.ChartCursorSettings();
					cursorSettings.valueBalloonsEnabled = true;
					chart.chartCursorSettings = cursorSettings;
		
				
					// PERIOD SELECTOR ///////////////////////////////////
					var periodSelector = new AmCharts.PeriodSelector();
					periodSelector.position = "bottom";
					periodSelector.dateFormat = "YYYY-MM-DD";
					periodSelector.inputFieldWidth = 150;
					if(timeFrame == "1_MONTH"){
						periodSelector.periods = [{
							period: "DD",
							count: 1,
							label: "1일"
						}, {
							period: "DD",
							count: 10,
							label: "15일"
						}, {
							period: "MAX",
							selected:true,
							label: "MAX"
						}];
					}else{
						periodSelector.periods = [{
							period: "MM",
							count: 1,
							label: "1개월"
						}, {
							period: "MM",
							count: 3,
							label: "3개월"
						}, {
							period: "MAX",
							selected:true,
							label: "MAX"
						}];
					}
					chart.periodSelector = periodSelector;
					
		
					var panelsSettings = new AmCharts.PanelsSettings();
					panelsSettings.mouseWheelZoomEnabled = true;
					panelsSettings.usePrefixes = true;
					chart.panelsSettings = panelsSettings;
		
		
					chart.write('chartdiv');
					$('a').remove();
				}	
			}
		});
	}
	</script>
	
	
	<!-- 
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	 -->
	<script src="${context}/resources/assets/js/bootstrap.min.js"></script>

</body>
</html>

