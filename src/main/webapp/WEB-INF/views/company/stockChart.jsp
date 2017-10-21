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
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
</head>
<body style="margin-top:0;margin-bottom:0">
			<div class="row">
				<div class="col-sm-6" id="now"></div>
				<div class="col-sm-6 text-right" id="predict">
				</div>
			</div>
			<div id="chart">
			
			</div>
	<script>
	if('${name}'!="KOSPI" && '${name}' != "KOSDAQ" && '${name}' != "KOSPI2"){
		$('#predict').append('전일예측 | <span id="yesterPredict"></span>'
				+'<br/>주가예측  | 금일 <span id="todayPredict"></span> | 익일 <span id="tomorrowPredict"></span>'
				+'<br/>베스트 분석 예측 | 금일 <span id="bestTodayPredict"></span> | 익일 <span id="bestTomorrowPredict"></span>');
	}
	var bestAnaCode = '${bestAnalysis.anaCode}';
	var bestNewsCode = '${bestAnalysis.newsCode}';
	var RTA = ${RTA};
	var yesterdayPcnt = 0;
	var yesterdayMcnt = 0;
	var yesterdayEcnt = 0;
	var todayPcnt = 0;
	var todayMcnt = 0;
	var todayEcnt = 0;
	var tomorrowPcnt = 0;
	var tomorrowMcnt = 0;
	var tomorrowEcnt = 0;
	var reliability = [];
	<c:forEach items="${reliability}" var="reliabilityVO">
		reliability.push({
			anaCode : '${reliabilityVO.anaCode }',
			newsCode : '${reliabilityVO.newsCode }',
			value : '${reliabilityVO.value }'
		});
	</c:forEach>
	for(var i in RTA){
		var newsCode = RTA[i].newsCode;
		var anaCode = RTA[i].anaCode;
		var add;
		for(var j in reliability){
			if(reliability[j].anaCode == anaCode && reliability[j].newsCode == newsCode){
				add = Number(reliability[j].value)/100;
				break;
			}
		}
		if(RTA[i].yesterdayFluc == "p")
			yesterdayPcnt += add;
		else if(RTA[i].yesterdayFluc == "m")
			yesterdayMcnt += add;
		else if(RTA[i].yesterdayFluc == "-")
			yesterdayEcnt += add;
		if(RTA[i].todayFluc == "p")
			todayPcnt += add;
		else if(RTA[i].todayFluc == "m")
			todayMcnt += add;
		else if(RTA[i].todayFluc == "-")
			todayEcnt += add;
		if(RTA[i].tomorrowFluc == "p")
			tomorrowPcnt += add;
		else if(RTA[i].tomorrowFluc == "m")
			tomorrowMcnt += add;
		else if(RTA[i].tomorrowFluc == "-")
			tomorrowEcnt += add;
		
		if(RTA[i].anaCode == bestAnaCode && RTA[i].newsCode == bestNewsCode){
			var todayPredict = RTA[i].todayFluc;
			var tomorrowPredict = RTA[i].tomorrowFluc;
			//오늘
			if(todayPredict == 'p'){
				todayPredict = '상승';
				$('#bestTodayPredict').html('<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp;'+todayPredict+'</b></span>');
			}
			else if(todayPredict == 'm'){
				todayPredict = '하락';
				$('#bestTodayPredict').html('<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp;'+todayPredict+'</b></span>');
			}else if(todayPredict == '-'){
				todayPredict = '동결';
				$('#bestTodayPredict').html('<b>- '+todayPredict+'</b>');
			}else if(todayPredict == 'x'){
				todayPredict = '데이터 부족';
				$('#bestTodayPredict').html('<b>'+todayPredict+'</b>');
			}
			
			//내일
			if(tomorrowPredict == 'p'){
				tomorrowPredict = '상승';
				$('#bestTomorrowPredict').html('<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp;'+tomorrowPredict+'</b></span>');
			}
			else if(tomorrowPredict == 'm'){
				tomorrowPredict = '하락';
				$('#bestTomorrowPredict').html('<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp;'+tomorrowPredict+'</b></span>');
			}else if(tomorrowPredict == '-'){
				tomorrowPredict = '동결';
				$('#bestTomorrowPredict').html('<b>- '+tomorrowPredict+'</b>');
			}else if(tomorrowPredict == 'x'){
				tomorrowPredict = '데이터 부족';
				$('#bestTomorrowPredict').html('<b>'+tomorrowPredict+'</b>');
			}
		}
	}
	var predicValue;
	var yesterdayTotal = yesterdayPcnt + yesterdayMcnt + yesterdayEcnt;
	var todayTotal = todayPcnt + todayMcnt + todayEcnt;
	var tomorrowTotal = tomorrowPcnt + tomorrowMcnt + tomorrowEcnt;
	if(todayPcnt>todayMcnt){
		$('#todayPredict').html('<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp'+(todayPcnt/todayTotal*100).toFixed(0)+'%</b></span>');
	}else if(todayPcnt<todayMcnt){
		$('#todayPredict').html('<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp'+(todayMcnt/todayTotal*100).toFixed(0)+'%</b></span>');
	}else{
		$('#todayPredict').html('<b>-</b>');
	}
	if(tomorrowPcnt>tomorrowMcnt){
		$('#tomorrowPredict').html('<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp'+(tomorrowPcnt/tomorrowTotal*100).toFixed(0)+'%</b></span>');
	}else if(tomorrowPcnt<tomorrowMcnt){
		$('#tomorrowPredict').html('<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp'+(tomorrowMcnt/tomorrowTotal*100).toFixed(0)+'%</b></span>');
	}else{
		$('#tomorrowPredict').html('<b>-</b>');
	}
	
	drawChart('1_DAY');
	function drawChart(timeFrame){
		$.ajax({
			url : '${context}/company/rtStock.json?name=${name}&timeFrame='+timeFrame,
			success : function(data){
				var obj = JSON.parse(data)[0];
				var chartData = obj.price;
				var yesterdayEnd;
				var yesterPredict;
				$.ajax({
					url : '${context}/company/rtStock.json?name=${name}&timeFrame=1_MONTH',
					async:false,
					success : function(data){
						var todayDate = chartData[0].dateTime.split('T')[0];
						var obj = JSON.parse(data)[0];
						var yesterdayData = obj.price;
						var d1,d2; //d1 = 하루전, d2 = 이틀전
						if(todayDate == yesterdayData[yesterdayData.length-1].date){
							yesterdayEnd = yesterdayData[yesterdayData.length-2];
							d1 = yesterdayData[yesterdayData.length-2].value;
							d2 = yesterdayData[yesterdayData.length-3].value;
						}else{
							yesterdayEnd = yesterdayData[yesterdayData.length-1];
							d1 = yesterdayData[yesterdayData.length-1].value;
							d2 = yesterdayData[yesterdayData.length-2].value;
						}
						if(d1<d2){
							yesterPredict = '하락';
						}else if(d1>d2){
							yesterPredict = '상승';
						}else
							yesterPredict = '동결';
					}
				});
				chartData.unshift({
					dateTime : '${yesterday}T23:50:00Z',
					value : yesterdayEnd.value
				});
				var start = chartData[0].value;
				var now = chartData[chartData.length-1].value;
				if('${name}'=="KOSPI" || '${name}' == "KOSDAQ" || '${name}' == "KOSPI2"){
					now = now.toFixed(2);
					start = start.toFixed(2);
					if(start<now){
						$('#now').html('<h3 style="margin-top:0"><span class="text-danger"><b>'+numberWithCommas(now)+'</b><small class="text-danger">'
										+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-up"></i>&nbsp;'+numberWithCommas((now-start).toFixed(2))
										+'&nbsp;&nbsp;&nbsp;+'+((now-start)/start*100).toFixed(2)+'%</small></span></h3>');
					}else if(start>now){
						$('#now').html('<h3 style="margin-top:0"><span class="text-primary"><b>'+numberWithCommas(now)+'</b><small class="text-primary">'
								+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down"></i>&nbsp;'+numberWithCommas((start-now).toFixed(2))
								+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></span></h3>');
					}else{
						$('#now').html('<h3 style="margin-top:0"><span><b>'+numberWithCommas(now)+'</b><small>'
								+'&nbsp;&nbsp;&nbsp;-'+numberWithCommas((start-now).toFixed(2))
								+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></span></h3>');
					}
				}else{
					if(start<now){
						$('#now').html('<h3 style="margin-top:0"><span class="text-danger"><b>'+numberWithCommas(now)+'</b><small class="text-danger">'
										+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-up"></i>&nbsp;'+numberWithCommas((now-start))
										+'&nbsp;&nbsp;&nbsp;+'+((now-start)/start*100).toFixed(2)+'%</small></span></h3>');
					}else if(start>now){
						$('#now').html('<h3 style="margin-top:0"><span class="text-primary"><b>'+numberWithCommas(now)+'</b><small class="text-primary">'
								+'&nbsp;&nbsp;&nbsp;<i class="fa fa-caret-down"></i>&nbsp;'+numberWithCommas((start-now))
								+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></span></h3>');
					}else{
						$('#now').html('<h3 style="margin-top:0"><span><b>'+numberWithCommas(now)+'</b><small>'
								+'&nbsp;&nbsp;&nbsp;-'+numberWithCommas((start-now))
								+'&nbsp;&nbsp;&nbsp;-'+((start-now)/start*100).toFixed(2)+'%</small></span></h3>');
					}
					if(yesterdayPcnt>yesterdayMcnt){
						$('#yesterPredict').html('<span class="text-danger"><b><i class="fa fa-caret-up"></i>&nbsp'+(yesterdayPcnt/yesterdayTotal*100).toFixed(0)+'%</b></span>');
					}else if(yesterdayPcnt<yesterdayMcnt){
						$('#yesterPredict').html('<span class="text-primary"><b><i class="fa fa-caret-down"></i>&nbsp'+(yesterdayMcnt/yesterdayTotal*100).toFixed(0)+'%</b></span>');
					}else{
						$('#yesterPredict').html('<b>-</b>');
					}
					if((yesterdayPcnt>yesterdayMcnt && yesterPredict == '상승') || (yesterdayPcnt<yesterdayMcnt && yesterPredict == '하락')){
						$('#yesterPredict').append(' <span class="text-success"><b> | 예측성공 </b></span>');
					}else {
						$('#yesterPredict').append(' <span class="text-danger"><b> | 예측실패 </b></span>');
					}
				}
				
				if('${draw}'== 'true'){
					$('#chart').empty();
					$('#chart').append('<span style="cursor:pointer;" class="badge badge-success pull-right" onclick="drawChart2(\'1_YEAR\')">1년</span>');
					$('#chart').append('<span style="cursor:pointer;" class="badge badge-success pull-right" onclick="drawChart2(\'1_MONTH\')">1개월</span>');
					$('#chart').append('<span style="cursor:pointer;" class="badge badge-success pull-right" onclick="drawChart(\'1_DAY\')">1일</span> ');
					$('#chart').append('<div id="chartdiv" class="col-sm-12" style="height:400px;"></div>');
					
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

