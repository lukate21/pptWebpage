<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane" data-step="4">
	<div class="center">
		<h3 class="green">등록되었습니다.</h3>
	</div>
	<div class="space-6"></div>
	<div class="row">
		<div class="col-xs-6 text-right">나만의
			분석 명</div>
		<div class="col-xs-6">
			<div class="clearfix col-sm-12">
				<p id="dicNameP"></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6 text-right">기업명</div>
		<div class="col-xs-6">
			<div class="clearfix col-sm-12">
				<p id="comNameP"></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6 text-right">분석방법</div>
		<div class="col-xs-6">
			<div class="clearfix col-sm-12">
				<p id="anaCodeP"></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6 text-right">뉴스</div>
		<div class="col-xs-6">
			<div class="clearfix col-sm-12">
				<p id="newsCodeP"></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6 text-right">신뢰도</div>
		<div class="col-xs-6">
			<div class="clearfix col-sm-12">
				<p>80%</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-6 text-right">등록
			단어 갯수</div>
		<div class="col-xs-6">
			<div class="clearfix col-sm-12">
				<p id="dictionaryP"></p>
			</div>
		</div>
	</div>
</div>