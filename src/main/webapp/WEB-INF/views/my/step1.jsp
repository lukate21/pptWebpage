<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane active" data-step="1">
	<form class="form-horizontal" id="sample-form">
		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-2 no-padding-right">기업선택</label>
			<div class="col-xs-12 col-sm-10">
				<div class="clearfix col-sm-12">
					<input class="typeahead scrollable" type="text"/>
				</div>
			</div>
		</div>

		<div class="space-2"></div>

		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-2 no-padding-right">분석방법</label>

			<div class="col-xs-12 col-sm-10">
				<div class="col-sm-4">
					<p>
						<button type="button" class="btn btn-white btn-info anaCode" value="opi1">감정분석1</button>
						<button type="button" class="btn btn-white btn-info anaCode" value="opi2">감정분석2</button>
						<button type="button" class="btn btn-white btn-primary anaCode" value="pro1">확률분석1</button>
						<button type="button" class="btn btn-white btn-primary anaCode" value="pro2">확률분석2</button>
						<button type="button" class="btn btn-white btn-success anaCode" value="fit1">필터분석1</button>
						<button type="button" class="btn btn-white btn-success anaCode" value="fit2">필터분석2</button>
						<button type="button" class="btn btn-white btn-warning anaCode" value="meg1">통합분석1</button>
						<button type="button" class="btn btn-white btn-warning anaCode" value="meg2">통합분석2</button>
					</p>
				</div>
				<div class="col-sm-8">
					<div id="anaInfo">
					
					</div>
				</div>
			</div>
		</div>
		
		<div class="space-2"></div>

		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-2 no-padding-right">뉴스 카테고리</label>
			<div class="col-xs-12 col-sm-10">
				<div class="col-sm-4">
					<p>
						<button type="button" class="btn btn-white btn-info newsCode" value="politics">정치</button>
						<button type="button" class="btn btn-white btn-info newsCode" value="economic">경제</button>
						<button type="button" class="btn btn-white btn-primary newsCode" value="society">사회</button>
						<button type="button" class="btn btn-white btn-primary newsCode" value="culture">문화</button>
						<button type="button" class="btn btn-white btn-success newsCode" value="foreign">국제</button>
						<button type="button" class="btn btn-white btn-success newsCode" value="entertain">연예</button>
						<button type="button" class="btn btn-white btn-warning newsCode" value="digital">IT</button>
					</p>
				</div>
			</div>
		</div>
		
	</form>
</div>
<script>
	$(document).on("click", ".tt-suggestion.tt-selectable", function() {
		change();
	});
	$("input.typeahead").keydown(function(key) {
		if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
			change();
		}
	});
	
	function change() {
		if ($('input.typeahead')[1].value != $('input.typeahead')[0].value
				&& $('input.typeahead')[0].value != '') {
			comName = $('input.typeahead')[0].value;
		} else {
			comName = $('input.typeahead')[1].value;
		}
		console.log(comName);
		$('#comNameSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+comName);
		$('#comNameDiv').html('<i class="ace-icon fa fa-angle-double-right"></i> '+comName);
	}
	$('.anaCode').click(function(){
		anaCode = this.value;
		console.log(anaCode);
		var cnt = $('.anaCode').length;
		for(var i=0; i<cnt; i++){
			var attr = $($('.anaCode')[i]).attr('class').replace("active","");
			$($('.anaCode')[i]).attr('class',attr);
		} 
		var attr = $(this).attr('class') + ' active';
		$(this).attr('class',attr);
		$('#anaCodeSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+this.innerText);
		$('#anaCodeDiv').html('<i class="ace-icon fa fa-angle-double-right"></i> '+this.innerText);
		var anaInfoStr = '';
		var opiDic = '<span style="cursor:pointer;"><i class="fa fa-question blue popover-info" data-placement="top" data-rel="popover" title="의사사전"'
						+' data-content="<ul><li>의사사전은 상승일, 하락일, 동결일에 출현한 단어들의 집합을 구한다.</li><li>각 집합의 공통부분은 중립 단어이며 여집합은 상승사전, 하락사전, 동결 사전으로 나뉘어진다.<br/>(𝑇_𝑝𝑜𝑠  : 상승일에만 출현한 단어, 𝑇_𝑛𝑒𝑔  : 하락일에만 출현한 단어, 𝑇_𝑒𝑞𝑢  : 동결일에만 출현한 단어)</li>"></i></span>';
		var proDic1 = '<span style="cursor:pointer;"><i class="fa fa-question blue popover-info" data-placement="top" data-rel="popover" title="확률사전1"'
						+' data-content="<ul><li>확률사전1의 단어들은 상승치, 하락치, 동결치를 가지고있다.<br/>( 𝑇 ∋𝐼_𝑠𝑐𝑜𝑟𝑒, 𝐷_𝑠𝑐𝑜𝑟𝑒, 𝐸_𝑠𝑐𝑜𝑟𝑒 )</li><li>상승치는 단어가 상승일에 출현한 일 수 / 단어가 총 출현한 일 수 로 구한다.<br/>( 𝐼_𝑠𝑐𝑜𝑟𝑒= 𝑇𝐹_𝑖𝑛𝑐 / 𝑇𝐹_𝑡𝑜𝑡𝑎𝑙 )</li><li>하락치와 동결치도 동일하게 구한다.</li>"></i></span>';
		var proDic2 = '<span style="cursor:pointer;"><i class="fa fa-question blue popover-info" data-placement="top" data-rel="popover" title="확률사전2"'
						+' data-content="<ul><li>확률사전2의 단어들은 상승치, 하락치, 동결치를 가지고있다.<br/>( 𝑇 ∋𝐼_𝑠𝑐𝑜𝑟𝑒, 𝐷_𝑠𝑐𝑜𝑟𝑒, 𝐸_𝑠𝑐𝑜𝑟𝑒 )</li><li>상승치는 단어가 상승일에 출현한 일 수 / 총 상승일 수 로 구한다.<br/>( 𝐼_𝑠𝑐𝑜𝑟𝑒 = 𝑇𝐹_𝑖𝑛𝑐 / 𝐷𝐹_𝑖𝑛𝑐 )</li><li>하락치와 동결치도 동일하게 구한다.</li>"></i></span>';
		var tfidf = '<span style="cursor:pointer;"><i class="fa fa-question blue popover-info" data-placement="top" data-rel="popover" title="TF-IDF 알고리즘"'
						+' data-content="<ul><li>TF-IDF 알고리즘은 문서내 단어 중요도를 구하는 알고리즘 입니다.</li><li>TFIDF값은 TF와 IDF값을 곱한 것으로 단어의 중요도를 의미합니다.</li><li>TF는 단어의 빈도수로 전체 문서에서 단어가 출현하는 빈도이며</li><li>IDF는 해당 단어가 다른 문서에도 출현하는 빈도의 역수치 입니다.</li>"></i></span>';
		switch(anaCode){
			case 'opi1':
				anaInfoStr = '<ul><li><b>감정분석1</b>은 상승, 하락, 동결 사전으로 만들어진 <b>의사사전</b>'+opiDic+'을 바탕으로한 분석 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 의사사전과 비교합니다.</li>'
							+'<li>의사사전과 일치하는 단어마다 상승, 하락, 동결 점수를 <b class="red">1점씩 카운트</b>해 상승치, 하락치, 동결치를 구해  예측하는 방법입니다.</li></ul>';
				break;
			case 'opi2':
				anaInfoStr = '<ul><li><b>감정분석2</b>는 상승, 하락, 동결 사전으로 만들어진 <b>의사사전</b>'+opiDic+'을 바탕으로한 분석 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 의사사전과 비교합니다.</li>'
							+'<li>의사사전과 일치하는 단어마다 해당 단어가 갖는 <b class="red">가중치</b>를 더해가며 상승치, 하락치, 동결치를 구해  예측하는 방법입니다.</li></ul>';
				break;
			case 'pro1':
				anaInfoStr = '<ul><li><b>확률분석1</b>은 <b>확률사전1</b>'+proDic1+'을 바탕으로한 분석 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 확률사전1과 비교합니다.</li>'
							+'<li>확률사전1과 일치하는 단어마다 해당 단어가 갖는 <b class="red">상승치, 하락치, 동결치</b>를 더해가며  예측하는 방법입니다.</li></ul>';
				break;
			case 'pro2':
				anaInfoStr = '<ul><li><b>확률분석2</b>는 <b>확률사전2</b>'+proDic2+'를 바탕으로한 분석 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 확률사전2와 비교합니다.</li>'
							+'<li>확률사전2와 일치하는 단어마다 해당 단어가 갖는 <b class="red">상승치, 하락치, 동결치</b>를 더해가며  예측하는 방법입니다.</li></ul>';
				break;
			case 'fit1':
				anaInfoStr = '<ul><li><b>필터분석1</b>은 <b>확률사전1</b>'+proDic1+'을 <b>TF-IDF</b>'+tfidf+' 알고리즘을 이용해 유용한 단어들만 필터링해 분석하는 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 필터링된 확률사전1과 비교합니다.</li>'
							+'<li>필터링된 확률사전1과 일치하는 단어마다 해당 단어가 갖는 상승치, 하락치, 동결치에 <b class="red">TFIDF값</b>을 곱한 후 이를 더해가며  예측하는 방법입니다.</li></ul>';
				break;
			case 'fit2':
				anaInfoStr = '<ul><li><b>필터분석2</b>는 <b>확률사전2</b>'+proDic2+'를 <b>TF-IDF</b>'+tfidf+' 알고리즘을 이용해 유용한 단어들만 필터링해 분석하는 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 필터링된 확률사전2와 비교합니다.</li>'
							+'<li>필터링된 확률사전2와 일치하는 단어마다 해당 단어가 갖는 상승치, 하락치, 동결치에 <b class="red">TFIDF값</b>을 곱한 후 이를 더해가며  예측하는 방법입니다.</li></ul>';
				break;
			case 'meg1':
				anaInfoStr = '<ul><li><b>통합분석1</b>은 <b>의사사전</b>'+opiDic+'과 <b>TF-IDF</b>'+tfidf+' 알고리즘으로 필터링된 <b>확률사전1</b>'+proDic1+'을 이용한 분석 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 의사사전과 필터링된 확률사전1과 비교합니다.</li>'
							+'<li>두 사전에서 공통으로 일치하는 단어마다 해당 단어가 갖는 상승치, 하락치, 동결치에 <b class="red">TFIDF값</b>을 곱한 후 이를 더해가며  예측하는 방법입니다.</li></ul>';
				break;
			case 'meg2':
				anaInfoStr = '<ul><li><b>통합분석2</b>는 <b>의사사전</b>'+opiDic+'과 <b>TF-IDF</b>'+tfidf+' 알고리즘으로 필터링된 <b>확률사전2</b>'+proDic2+'를 이용한 분석 방법입니다.</li>'
							+'<li>실시간으로 수집된 뉴스에서 단어를 추출해 해당 기업과 뉴스 카테고리에 해당하는 의사사전과 필터링된 확률사전2와 비교합니다.</li>'
							+'<li>두 사전에서 공통으로 일치하는 단어마다 해당 단어가 갖는 상승치, 하락치, 동결치에 <b class="red">TFIDF값</b>을 곱한 후 이를 더해가며  예측하는 방법입니다.</li></ul>';
				break;
		}
		$('#anaInfo').html(anaInfoStr);
		//$('#anaInfo').html('<p class="red-text">'+this.value+'</p>설명');
		$('[data-rel=popover]').popover({html:true});

	});
	$('.newsCode').click(function(){
		newsCode = this.value;
		console.log(newsCode);
		var cnt = $('.newsCode').length;
		for(var i=0; i<cnt; i++){
			var attr = $($('.newsCode')[i]).attr('class').replace("active","");
			$($('.newsCode')[i]).attr('class',attr);
		} 
		var attr = $(this).attr('class') + ' active';
		$(this).attr('class',attr);
		$('#newsCodeSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+this.innerText);
		$('#newsCodeDiv').html('<i class="ace-icon fa fa-angle-double-right"></i> '+this.innerText);
		//$('#anaInfo').html('<p class="red-text">'+this.value+'</p>설명');
	});
</script>