<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/serial.js" type="text/javascript"></script>
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/amstock.js" type="text/javascript"></script>

</head>
<body>
	<button onclick="drawChart('1_DAY')">1일</button>
	<button onclick="drawChart2('1_MONTH')">1개월</button>
	<button onclick="drawChart2('1_YEAR')">1년</button>
	<div id="chartdiv" style="width:100%; height:600px;"></div>
	
	<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
	<script>
	drawChart('1_DAY');
	function drawChart(timeFrame){
		$.ajax({
			url : '${context}/company/rtStock.json?name=${name}&timeFrame='+timeFrame,
			success : function(data){
				var obj = JSON.parse(data)[0];
				var chartData = obj.price;
				var RTA = ${RTA};
				var pCnt = 0;
				var mCnt = 0;
				for(var i in RTA){
					if(RTA[i].todayFluc == "p")
						pCnt++;
					else if(RTA[i].todayFluc == "m")
						mCnt++;
				}
				var predicValue;
				if(pCnt>mCnt){
					predicValue = chartData[0].value*1.03;
				}else if(pCnt<mCnt){
					predicValue = chartData[0].value*0.97;
				}else{
					predicValue = chartData[0].value;
				}
				if(!chartData[(chartData.length-1)].dateTime.includes('T06:30:00Z')){
					chartData.push({
						dateTime :chartData[0].dateTime.split("T")[0] + "T06:30:00Z",
						value : predicValue
					});
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
						}, {
							fromField: "volume",
							toField: "volume"
						}],

						dataProvider: chartData,
						categoryField: "dateTime",
						stockEvents: [{
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
						}]
					}],

					panels: [{
							showCategoryAxis: false,
							title: "Value",
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
						dateFormat: "YYYY-MM-DD HH:NN",
						inputFieldWidth: 150,
						periods: [{
							period: "hh",
							count: 1,
							label: "1 hour",
							selected: true

						}, {
							period: "hh",
							count: 2,
							label: "2 hours"
						}, {
							period: "hh",
							count: 5,
							label: "5 hour"
						}, {
							period: "hh",
							count: 12,
							label: "12 hours"
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
					}, {
						fromField: "volume",
						toField: "volume"
					}];
					dataSet.dataProvider = chartData;
					dataSet.categoryField = "date";
		
					// set data sets to the chart
					chart.dataSets = [dataSet];
					// PANELS ///////////////////////////////////////////
					// first stock panel
					var stockPanel1 = new AmCharts.StockPanel();
					stockPanel1.showCategoryAxis = false;
					stockPanel1.title = "Value";
					stockPanel1.percentHeight = 70;
		
					// graph of first stock panel
					var graph1 = new AmCharts.StockGraph();
					graph1.valueField = "value";
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
					periodSelector.dateFormat = "YYYY-MM-DD JJ:NN";
					periodSelector.inputFieldWidth = 150;
					if(timeFrame == "1_MONTH"){
						periodSelector.periods = [{
							period: "DD",
							count: 1,
							label: "1 day"
						}, {
							period: "DD",
							count: 10,
							label: "10 days"
						}, {
							period: "DD",
							count: 15,
							label: "15 days"
						}, {
							period: "DD",
							count: 20,
							label: "20 days"
						}, {
							period: "MAX",
							selected:true,
							label: "MAX"
						}];
					}else{
						periodSelector.periods = [{
							period: "MM",
							count: 1,
							label: "1 month"
						}, {
							period: "MM",
							count: 3,
							label: "3 months"
						}, {
							period: "MM",
							count: 6,
							label: "6 months"
						}, {
							period: "MM",
							count: 9,
							label: "9 months"
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
</body>
</html>

