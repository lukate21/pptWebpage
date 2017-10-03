<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane" data-step="3">
	<div class="center" id="validationDiv">
		<div class="row">
			<div class="col-xs-6 center">
				<h4 class="green">유효한 단어</h4>
				<div class="row">
					<div class="col-xs-3 ">
						<svg id="fillgaugeInc" width="100%" height="100"></svg>
					</div>
					<div class="col-xs-3">
						<svg id="fillgaugeDec" width="100%" height="100"></svg>
					</div>
					<div class="col-xs-3">
						<svg id="fillgaugeEqu" width="100%" height="100"></svg>
					</div>
					<div class="col-xs-3">
						<svg id="fillgaugeNeu" width="100%" height="100"></svg>
					</div>
				</div>
				<div class="space-2"></div>
				<div class="row">
					<div id="usefulTermCloud" style="width: 100%"></div>
				</div>
				<div class="row">
					<i class="fa fa-flag red bigger-130"></i>
					<span class="red"><strong>상승</strong>관여 단어</span>&nbsp;&nbsp;&nbsp;&nbsp; 
					<i class="fa fa-flag blue bigger-130"></i>
					<span class="blue"><strong>하락</strong>관여 단어</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<i class="fa fa-flag green bigger-130"></i> 
					<span class="green"><strong>동결</strong>관여 단어</span>
					<i class="fa fa-flag orange bigger-130"></i> 
					<span class="orange"><strong>중립</strong>관여 단어</span>
				</div>
			</div>
			<div class="col-xs-6 center">
				<h4 class="red">유효하지 않은 단어</h4>
				<div class="row">
					<div class="col-xs-3 col-xs-offset-5">
						<svg id="fillgaugeNone" width="100%" height="100"></svg>
					</div>
				</div>
				<div class="space-2"></div>
				<div class="row">
					<div id="uselessTermCloud" style="width: 100%"></div>
				</div>
			</div>
		</div>
		<div id="dialog-confirm" class="hide">
			<div class="alert alert-info bigger-110">
				<div class="clearfix center">
					<input type="text" id="dicNameInput" size="30" placeholder=" 나만의 분석 이름을 등록해주세요" />
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 center">
					<div class="col-xs-5">
						<h4>기업이름
							<small id="comNameDiv"></small>
						</h4>
					</div>
					<div class="col-xs-4">
						<h4>분석방법
							<small id="anaCodeDiv"></small>
						</h4>
					</div>
					<div class="col-xs-3">
						<h4>뉴스
							<small id="newsCodeDiv"></small>
						</h4>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-8 col-xs-offset-2" id="userDicTable">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>단어</th>
								<th>가중치</th>
								<th>의사</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div id="pageBtn">
					</div>
				</div>
			</div>
			<div class="space-6"></div>
			<p class="bigger-110 bolder center grey">
				<i class="ace-icon fa fa-hand-o-right blue bigger-120"></i>
				등록하시겠습니까?
			</p>
		</div>
		<!-- #dialog-confirm -->
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
	//동결
	var fillgaugeEquConfig = liquidFillGaugeDefaultSettings();
	fillgaugeEquConfig.circleColor = "#6DA398";
	fillgaugeEquConfig.textColor = "#0E5144";
	fillgaugeEquConfig.waveTextColor = "#6DA398";
	fillgaugeEquConfig.waveColor = "#246D5F";
	//중립
	var fillgaugeNeuConfig = liquidFillGaugeDefaultSettings();
	fillgaugeNeuConfig.circleColor = "#FFA500";
	fillgaugeNeuConfig.textColor = "#FFA500";
	fillgaugeNeuConfig.waveTextColor = "#FFA500";
	fillgaugeNeuConfig.waveColor = "#FFCC00";
	//무의미
	var fillgaugeNoneConfig = liquidFillGaugeDefaultSettings();
	fillgaugeNoneConfig.circleColor = "#808015";
	fillgaugeNoneConfig.textColor = "#555500";
	fillgaugeNoneConfig.waveTextColor = "#FFFFAA";
	fillgaugeNoneConfig.waveColor = "#AAAA39";

	function drawValidationState() {
		$('#usefulTermSpan').html(
				'<i class="ace-icon fa fa-angle-double-right"></i>'
						+ usefulTerms.length);
		//gauge
		var totalTermSize = usefulTerms.length + uselessTerms.length;
		var incValue = 0;
		var decValue = 0;
		var equValue = 0;
		var neuValue = 0;
		for (i in usefulTerms) {
			if (usefulTerms[i].opinion == "inc")
				incValue++;
			else if (usefulTerms[i].opinion == "dec")
				decValue++;
			else if (usefulTerms[i].opinion == "equ")
				equValue++;
			else if (usefulTerms[i].opinion == "neu")
				neuValue++;
		}
		$('#fillgaugeInc').empty();
		$('#fillgaugeDec').empty();
		$('#fillgaugeEqu').empty();
		$('#fillgaugeNeu').empty();
		$('#fillgaugeNone').empty();
		gaugeConfig(fillgaugeIncConfig, 0, totalTermSize);
		var gaugeInc = loadLiquidFillGauge("fillgaugeInc", incValue, fillgaugeIncConfig);
		gaugeConfig(fillgaugeDecConfig, 0, totalTermSize);
		var gaugeDec = loadLiquidFillGauge("fillgaugeDec", decValue, fillgaugeDecConfig);
		gaugeConfig(fillgaugeEquConfig, 0, totalTermSize);
		var gaugeEqu = loadLiquidFillGauge("fillgaugeEqu", equValue, fillgaugeEquConfig);
		gaugeConfig(fillgaugeNeuConfig, 0, totalTermSize);
		var gaugeNeu = loadLiquidFillGauge("fillgaugeNeu", neuValue, fillgaugeNeuConfig);
		gaugeConfig(fillgaugeNoneConfig, 0, totalTermSize);
		var gaugeNone = loadLiquidFillGauge("fillgaugeNone",
				uselessTerms.length, fillgaugeNoneConfig);

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
	
	function userDicTable(page){
		if(page > (usefulTerms.length/10).toFixed(0)){
			alert('마지막 페이지 입니다.');
			return;
		}else{
			$('#userDicTable tbody').empty();
			var cnt = 0;
			var start = (page-1)*10;
			var end = start+10;
			for(var i in usefulTerms){
				cnt++;
				if(cnt <= start)
					continue;
				else if(cnt > end)
					break;
				else{
					var term = usefulTerms[i].key;
					var value = usefulTerms[i].value;
					var opinion = usefulTerms[i].opinion;
					if(opinion == 'inc')
						opinion = '상승';
					else if(opinion == 'dec')
						opinion = '하락';
					else if(opinion == 'equ')
						opinion = '동결';
					else if(opinion == 'neu')
						opinion = '중립';
					$('#userDicTable tbody').append('<tr><td>'+term+'</td><td>'+value+'</td><td>'+opinion+'</td></tr>');
				}
			}
		}
		var pageBtn = '<span class="pull-right">';
		if(page>1){
			pageBtn += '<i class="ace-icon fa fa-arrow-left blue bigger-110" style="cursor:pointer" onclick="userDicTable('+(page-1)+')"></i>';
		}
		pageBtn += '&nbsp;&nbsp;' + page+'/'+(usefulTerms.length/10).toFixed(0) + '&nbsp;&nbsp;';
		pageBtn += '<i roll="button" class="ace-icon fa fa-arrow-right blue bigger-110" style="cursor:pointer" onclick="userDicTable('+(page+1)+')"></i>';
		$('#pageBtn').html(pageBtn);
	}
</script>