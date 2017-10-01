<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane" data-step="3">
	<div class="center" id="validationDiv">
		<h3 class="blue lighter"></h3>
		<div class="row">
			<div class="col-xs-6 center">
				<h4 class="green">유효한 단어</h4>
				<div class="row">
					<div class="col-xs-3 col-xs-offset-2">
						<svg id="fillgaugeInc" width="100%" height="100"></svg>
					</div>
					<div class="col-xs-3">
						<svg id="fillgaugeDec" width="100%" height="100"></svg>
					</div>
					<div class="col-xs-3">
						<svg id="fillgaugeNeu" width="100%" height="100"></svg>
					</div>
					<!-- <div class="easy-pie-chart percentage" data-percent="70"
						data-color="#87B87F" id="usefulPieChart">
						<span class="percent"></span>개
					</div> -->
					
				</div>
				<div class="space-2"></div>
				<div class="row">
					<div id="usefulTermCloud" style="width: 100%"></div>
				</div>
				<h4 >
					<small>
						<i class="ace-icon fa fa-angle-double-right"></i>
						<span class="red"><strong>상승</strong>관여 단어</span>
						<i class="ace-icon fa fa-angle-double-right"></i>
						<span class="blue"><strong>하락</strong>관여 단어</span>
						<i class="ace-icon fa fa-angle-double-right"></i>
						<span class="green"><strong>중립</strong>관여 단어</span>
					</small>
				</h4>
			</div>
			<div class="col-xs-6 center">
				<h4 class="red">유효하지 않은 단어</h4>
				<div class="row">
					<div class="col-xs-3 col-xs-offset-5">
						<svg id="fillgaugeNone" width="100%" height="100" onclick="gauge5.update(NewValue());"></svg>
					</div>
					<!-- <div class="easy-pie-chart percentage" data-percent="70"
						data-color="#D15B47" id="uselessPieChart">
						<span class="percent"></span>개
					</div> -->
				</div>
				<div class="space-2"></div>
				<div class="row">
					<div id="uselessTermCloud" style="width: 100%"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	//상승
	var fillgaugeIncConfig = liquidFillGaugeDefaultSettings();
	fillgaugeIncConfig.circleColor = "#FF7777";
	fillgaugeIncConfig.textColor = "#FF4444";
	fillgaugeIncConfig.waveTextColor = "#FFAAAA";
	fillgaugeIncConfig.waveColor = "#FFDDDD";
	//하락
	var fillgaugeDecConfig = liquidFillGaugeDefaultSettings();
	//중립
	var fillgaugeNeuConfig = liquidFillGaugeDefaultSettings();
	fillgaugeNeuConfig.circleColor = "#6DA398";
	fillgaugeNeuConfig.textColor = "#0E5144";
	fillgaugeNeuConfig.waveTextColor = "#6DA398";
	fillgaugeNeuConfig.waveColor = "#246D5F";
	//무의미
	var fillgaugeNoneConfig = liquidFillGaugeDefaultSettings();
	fillgaugeNoneConfig.circleColor = "#808015";
	fillgaugeNoneConfig.textColor = "#555500";
	fillgaugeNoneConfig.waveTextColor = "#FFFFAA";
	fillgaugeNoneConfig.waveColor = "#AAAA39";

	function drawValidationState() {
		$('#usefulTermSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+usefulTerms.length);
		//gauge
		var totalTermSize = usefulTerms.length + uselessTerms.length;
		var incValue = 0;
		var decValue = 0;
		var neuValue = 0;
		for (i in usefulTerms) {
			if (usefulTerms[i].opinion == "inc")
				incValue++;
			else if (usefulTerms[i].opinion == "dec")
				decValue++;
			else if (usefulTerms[i].opinion == "neu")
				neuValue++;
		}
		$('#fillgaugeInc').empty();
		$('#fillgaugeDec').empty();
		$('#fillgaugeNeu').empty();
		$('#fillgaugeNone').empty();
		gaugeConfig(fillgaugeIncConfig, 0, totalTermSize);
		var gaugeInc = loadLiquidFillGauge("fillgaugeInc", incValue, fillgaugeIncConfig);
		gaugeConfig(fillgaugeDecConfig, 0, totalTermSize);
		var gaugeDec = loadLiquidFillGauge("fillgaugeDec", decValue, fillgaugeDecConfig);
		gaugeConfig(fillgaugeNeuConfig, 0, totalTermSize);
		var gaugeNeu = loadLiquidFillGauge("fillgaugeNeu", neuValue, fillgaugeNeuConfig);
		gaugeConfig(fillgaugeNoneConfig, 0, totalTermSize);
		var gaugeNone = loadLiquidFillGauge("fillgaugeNone", uselessTerms.length, fillgaugeNoneConfig);
		
		//Word Cloud
		$('#usefulTermCloud').empty();
		$('#uselessTermCloud').empty();
		drawCloud(usefulTerms, "#usefulTermCloud");
		drawCloud(uselessTerms, "#uselessTermCloud");
	}

	function wordCloudUpdate() {
		drawCloud(usefulTerms, "#usefulTermCloud");
		drawCloud(uselessTerms, "#uselessTermCloud");
	}
	
	function gaugeConfig(config, minV, maxV) {
		config.displayPercent = false;
		config.textVertPosition = 0.8;
		config.waveAnimateTime = 1500;
		config.minValue = minV;
		config.maxValue = maxV;
		config.waveHeight = 0.04;
		config.textSize = 0.75;
		config.waveAnimateTime = 1300;
		config.waveAnimate = true;
		config.waveRise = false;
		config.waveHeightScaling = false;
		config.waveOffset = 0.25;
		config.waveCount = 2;
	}
</script>
<script >



/* var gauge1 = loadLiquidFillGauge("fillgauge1", 55);
var config1 = liquidFillGaugeDefaultSettings();
config1.circleColor = "#FF7777";
config1.textColor = "#FF4444";
config1.waveTextColor = "#FFAAAA";
config1.waveColor = "#FFDDDD";
//config1.circleThickness = 0.2;
config1.displayPercent = false;
config1.textVertPosition = 0.8;
config1.waveAnimateTime = 1500;
config1.minValue = 0;
config1.maxValue = 100;
var gauge2= loadLiquidFillGauge("fillgauge2", 28, config1);
var config2 = liquidFillGaugeDefaultSettings();
config2.circleColor = "#D4AB6A";
config2.textColor = "#553300";
config2.waveTextColor = "#805615";
config2.waveColor = "#AA7D39";
config2.circleThickness = 0.1;
config2.circleFillGap = 0.2;
config2.textVertPosition = 0.8;
config2.waveAnimateTime = 2000;
config2.waveHeight = 0.3;
config2.waveCount = 1;
var gauge3 = loadLiquidFillGauge("fillgauge3", 60.1, config2);
var config3 = liquidFillGaugeDefaultSettings();
config3.textVertPosition = 0.8;
config3.waveAnimateTime = 5000;
config3.waveHeight = 0.15;
config3.waveAnimate = false;
config3.waveOffset = 0.25;
config3.valueCountUp = false;
config3.displayPercent = false;
var gauge4 = loadLiquidFillGauge("fillgauge4", 50, config3);
var config4 = liquidFillGaugeDefaultSettings();
config4.circleThickness = 0.15;
config4.circleColor = "#808015";
config4.textColor = "#555500";
config4.waveTextColor = "#FFFFAA";
config4.waveColor = "#AAAA39";
config4.textVertPosition = 0.8;
config4.waveAnimateTime = 1000;
config4.waveHeight = 0.05;
config4.waveAnimate = true;
config4.waveRise = false;
config4.waveHeightScaling = false;
config4.waveOffset = 0.25;
config4.textSize = 0.75;
config4.waveCount = 3;
var gauge5 = loadLiquidFillGauge("fillgauge5", 60.44, config4);
var config5 = liquidFillGaugeDefaultSettings();
// config5.circleThickness = 0.4;
config5.circleColor = "#6DA398";
config5.textColor = "#0E5144";
config5.waveTextColor = "#6DA398";
config5.waveColor = "#246D5F";
config5.textVertPosition = 0.52;
config5.waveAnimateTime = 5000;
config5.waveHeight = 0;
config5.waveAnimate = false;
config5.waveCount = 2;
config5.waveOffset = 0.25;
config5.textSize = 1.2;
config5.minValue = 30;
config5.maxValue = 4000;
config5.displayPercent = false;
var gauge6 = loadLiquidFillGauge("fillgauge6", 120, config5); */
</script>
