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
</head>
<body>
	<div class="row">
		<div class="col-xs-12" id="chart" style="height: 350px;">
		</div>
	</div>
	 <script>
            var chart;
            var chartData = [];
           	var todayCnt = 0;
           	var totalCnt = 0;
            <c:forEach items="${ newsCount}" var="newsCountVO">
            	var newsCode = '${newsCountVO.newsCode }';
            	if(newsCode == 'culture')
    				newsCode = '문화';
    			else if(newsCode == 'digital')
    				newsCode = 'IT';
    			else if(newsCode == 'economic')
    				newsCode = '경제';
    			else if(newsCode == 'entertain')
    				newsCode = '연예';
    			else if(newsCode == 'foreign')
    				newsCode = '국제';
    			else if(newsCode == 'politics')
    				newsCode = '정치';
    			else if(newsCode == 'society')
    				newsCode = '사회';
				chartData.push({
					newsCode : newsCode,
					today : '${newsCountVO.today }'
				})
				todayCnt += ${newsCountVO.today };
				totalCnt += ${newsCountVO.total };
			</c:forEach>

            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.addTitle("금일 뉴스("+todayCnt+"건 / "+totalCnt+"건)", 14);
                chart.dataProvider = chartData;
                chart.categoryField = "newsCode";
                chart.startDuration = 1;

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.labelRotation = 90;
                categoryAxis.gridPosition = "start";

                // value
                // in case you don't want to change default settings of value axis,
                // you don't need to create it, as one value axis is created automatically.

                // GRAPH
                var graph = new AmCharts.AmGraph();
                graph.valueField = "today";
                graph.balloonText = "[[category]] 뉴스: <b>[[value]]건</b>";
                graph.type = "column";
                graph.lineAlpha = 0;
                graph.fillAlphas = 0.8;
                chart.addGraph(graph);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorAlpha = 0;
                chartCursor.zoomable = false;
                chartCursor.categoryBalloonEnabled = false;
                chart.addChartCursor(chartCursor);

                chart.creditsPosition = "top-right";

                chart.write("chart");
                $('a').remove();
            });
        </script>	

</body>
</html>

