<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${context }/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${context }/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<!-- text fonts -->
<link rel="stylesheet" href="${context }/assets/css/fonts.googleapis.com.css" />
<!-- ace styles -->
<link rel="stylesheet" href="${context }/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<!--[if lte IE 9]>
	<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
<![endif]-->
<link rel="stylesheet" href="${context }/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="${context }/assets/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
<link rel="stylesheet" href="assets/css/ace-ie.min.css" />
<![endif]-->
<!-- inline styles related to this page -->
<script src="${context}/assets/js/jquery-2.1.4.min.js"></script>
<!-- ace settings handler -->
<script src="${context }/assets/js/ace-extra.min.js"></script>
<!-- chart -->
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/serial.js" type="text/javascript"></script>
<script src="${context}/resources/amstockchart_3.21.6.free/amcharts/amstock.js" type="text/javascript"></script>
<link rel="stylesheet" href="${context }/resources/amcharts_3.21.6.free/images/style.css" type="text/css">
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${context }/resources/amcharts_3.21.6.free/amcharts/serial.js" type="text/javascript"></script>
<!-- wordCloud -->
<script src="${pageContext.request.contextPath }/resources/d3.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/d3.layout.cloud.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/word-cloud.js"></script>
</head>
<body style="margin:auto">
	<div class="page-content">
		<div class="ace-settings-container" id="ace-settings-container">
			<div class="btn btn-app btn-xs btn-warning ace-settings-btn"
				id="ace-settings-btn">
				<i class="ace-icon fa fa-cog bigger-130"></i>
			</div>

			<div class="ace-settings-box clearfix" id="ace-settings-box">
				<div class="pull-left width-50">
					<div class="ace-settings-item" style="cursor: pointer;">
						<span class="badge badge-success" onclick="drawChart('1_DAY')">1일</span>
						<span class="badge badge-success" onclick="drawChart2('1_MONTH')">1개월</span>
						<span class="badge badge-success" onclick="drawChart2('1_YEAR')">1년</span>
					</div>
					<div class="ace-settings-item" style="cursor: pointer;">
						<span class="badge badge-info" onclick="respons('newsCode')">뉴스 카테고리별 예측 확률</span>
					</div>
					<div class="ace-settings-item" style="cursor: pointer;">
						<span class="badge badge-warning" onclick="respons('anaCode')">분석 방법별 예측 확률</span>
					</div>
					<div class="ace-settings-item" style="cursor: pointer;">
						<span class="badge badge-danger" onclick="wordCloud()">단어 사전</span>
					</div>
				</div>
				<!-- /.pull-left -->

				<!-- <div class="pull-left width-50">
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-hover" autocomplete="off" /> <label class="lbl"
								for="ace-settings-hover"> Submenu on Hover</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-compact" autocomplete="off" /> <label
								class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
						</div>
	
						<div class="ace-settings-item">
							<input type="checkbox" class="ace ace-checkbox-2"
								id="ace-settings-highlight" autocomplete="off" /> <label
								class="lbl" for="ace-settings-highlight"> Alt. Active
								Item</label>
						</div>
					</div> -->
				<!-- /.pull-left -->
			</div>
			<!-- /.ace-settings-box -->
		</div>
		<!-- /.ace-settings-container -->
		<div class="row">
			<div class="col-sm-6">
				<span><b>${name }</b></span>
				<span id="now"></span>
				<span id="raise"></span>
				<span id="rate"></span>
				예측 : <span id="predict"></span>
			</div>
		</div>
	
		<div id="chartdiv" class="col-sm-12" style="height:500px;"></div>
	</div>
	
	<script>
	drawChart('1_DAY');
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
		$('#predict').text('+'+(pCnt/(pCnt+mCnt)*100).toFixed(0)+'%');
	}else if(pCnt<mCnt){
		$('#predict').text('-'+(mCnt/(pCnt+mCnt)*100).toFixed(0)+'%');
	}else{
		$('#predict').text('-');
	}
	function drawChart(timeFrame){
		$.ajax({
			url : '${context}/company/rtStock.json?name=${name}&timeFrame='+timeFrame,
			success : function(data){
				var obj = JSON.parse(data)[0];
				var chartData = obj.price;
				console.log(chartData);
				var start = chartData[0].value;
				var now = chartData[chartData.length-1].value;
				$('#now').text(now);
				if(start<now){
					$('#raise').text('+'+(now-start).toFixed(2));
					$('#rate').text('+'+((now-start)/start*100).toFixed(2)+'%');
				}else{
					$('#raise').text('-'+(start-now).toFixed(2));
					$('#rate').text('-'+((start-now)/start*100).toFixed(2)+'%');
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
							label: "1 시간",
							selected: true

						}, {
							period: "hh",
							count: 2,
							label: "2 시간"
						}, {
							period: "hh",
							count: 5,
							label: "5 시간"
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
					periodSelector.dateFormat = "YYYY-MM-DD JJ:NN";
					periodSelector.inputFieldWidth = 150;
					if(timeFrame == "1_MONTH"){
						periodSelector.periods = [{
							period: "DD",
							count: 1,
							label: "1 일"
						}, {
							period: "DD",
							count: 10,
							label: "10 일"
						}, {
							period: "DD",
							count: 20,
							label: "20 일"
						}, {
							period: "MAX",
							selected:true,
							label: "MAX"
						}];
					}else{
						periodSelector.periods = [{
							period: "MM",
							count: 1,
							label: "1 개월"
						}, {
							period: "MM",
							count: 3,
							label: "3 개월"
						}, {
							period: "MM",
							count: 6,
							label: "6 개월"
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
	function respons(option){
		var chart;
		//카테고리별 오늘 상승/하락/동결 - 카테고리별 내일 상승/하락/동결
		var map = new Map();
		var chartData = [];
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
			var types = ['금일 주가 상승확률','금일 주가 하락확률','금일 주가 동결확률','익일 주가 상승확률','익일 주가 하락확률','익일 주가 동결확률']
			for(var i=0; i<types.length; i++){
				chartData.push({
					type : types[i],
					economic : (map.get('economic')[i]/8*100).toFixed(1),
					digital : (map.get('digital')[i]/8*100).toFixed(1),
					culture : (map.get('culture')[i]/8*100).toFixed(1),
					politics : (map.get('politics')[i]/8*100).toFixed(1),
					foreign : (map.get('foreign')[i]/8*100).toFixed(1),
				});
			}
			console.log(chartData);
            // SERIAL CHART
            // SERIAL CHART
            chart = new AmCharts.AmSerialChart();
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
            chart.write("chartdiv");
            $('a').remove();
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
			var types = ['금일 주가 상승확률','금일 주가 하락확률','금일 주가 동결확률','익일 주가 상승확률','익일 주가 하락확률','익일 주가 동결확률']
			for(var i=0; i<types.length; i++){
				chartData.push({
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
			console.log(chartData);
            // SERIAL CHART
            // SERIAL CHART
            chart = new AmCharts.AmSerialChart();
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
            chart.write("chartdiv");
            $('a').remove();
		}
    }
	function wordCloud(){
		$.ajax({
			url : 'http://localhost:8080/PPTAnalysisServer/dictionary/mongo/selectOpiDic.do?comName=${name}&opinion=pos&newsCode=economic',
			success : function(data){
				var tags = JSON.parse(data);
				wordCloudUpdate(tags);
				console.log(tags);
				$('div.modal').modal();
			}
		});
	}
	</script>
	
	
	<!-- 
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>
	 -->
	<script src="${context }/assets/js/bootstrap.min.js"></script>

	<!-- ace scripts -->
	<script src="${context }/assets/js/ace-elements.min.js"></script>
	<script src="${context }/assets/js/ace.min.js"></script>
	
	<!-- Modal -->
	<div class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">x</button>
				<!-- header title -->
				<h4 class="modal-title">Login Dialog</h4>
			</div>
			<!-- body -->
			<div class="modal-body">
				<div id="vis" style="width: 100%"></div>
			</div>
			<!-- Footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
	    </div>
	  </div>
	</div>
</body>
</html>

