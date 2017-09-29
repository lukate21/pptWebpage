<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane active" data-step="1">
	<form class="form-horizontal" id="sample-form">
		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-2 no-padding-right"
				for="email">기업선택</label>
			<div class="col-xs-12 col-sm-10">
				<div class="clearfix col-sm-12">
					<input class="typeahead scrollable" type="text"/>
				</div>
			</div>
		</div>

		<div class="space-2"></div>

		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-2 no-padding-right"
				for="state">분석방법</label>

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
			<label class="control-label col-xs-12 col-sm-2 no-padding-right"
				for="state">뉴스 카테고리 선택</label>
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
		
		//$('#anaInfo').html('<p class="red-text">'+this.value+'</p>설명');
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
		//$('#anaInfo').html('<p class="red-text">'+this.value+'</p>설명');
	});
</script>