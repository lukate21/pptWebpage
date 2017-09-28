<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane active" data-step="1">
	<form class="form-horizontal" id="sample-form">
		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-3 no-padding-right"
				for="email">기업선택</label>
			<div class="col-xs-12 col-sm-9">
				<div class="clearfix col-sm-12">
					<input class="typeahead scrollable" type="text" value="하나금융지주" />
				</div>
			</div>
		</div>

		<div class="space-2"></div>

		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-3 no-padding-right"
				for="state">분석방법</label>

			<div class="col-xs-12 col-sm-9">
				<div class="col-sm-6">
					<p>
						<button type="button" class="btn btn-white brn-info">감정분석1</button>
						<button type="button" class="btn btn-white btn-info">감정분석2</button>
						<button type="button" class="btn btn-white btn-primary">확률분석1</button>
						<button type="button" class="btn btn-white btn-primary">확률분석2</button>
					</p>
					<p>
						<button type="button" class="btn btn-white btn-success">필터분석1</button>
						<button type="button" class="btn btn-white btn-success">필터분석2</button>
						<button type="button" class="btn btn-white btn-warning">통합분석1</button>
						<button type="button" class="btn btn-white btn-warning">통합분석2</button>
					</p>
				</div>
				<div class="col-sm-6">
					<div id="anaInfo">
					
					</div>
				</div>
			</div>
		</div>
		
		<div class="space-2"></div>

		<div class="form-group">
			<label class="control-label col-xs-12 col-sm-3 no-padding-right"
				for="state">뉴스 카테고리 선택</label>
			<div class="col-xs-12 col-sm-9">
				<div class="col-sm-12">
					<p>
						<button type="button" class="btn btn-white brn-info">정치</button>
						<button type="button" class="btn btn-white btn-info">경제</button>
						<button type="button" class="btn btn-white btn-primary">사회</button>
						<button type="button" class="btn btn-white btn-primary">문화</button>
					</p>
					<p>
						<button type="button" class="btn btn-white btn-success">국제</button>
						<button type="button" class="btn btn-white btn-success">연예</button>
						<button type="button" class="btn btn-white btn-warning">IT</button>
					</p>
					
					<div id="anaInfo">
					
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
