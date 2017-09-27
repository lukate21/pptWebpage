<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="content container">
	<div class="row">
		<div class="col-xs-6">
			<img class="footer-logo" src="${context}/assets/acecv/img/logo.png"
				alt="Acecv Logo">
		</div>
		<div class="col-xs-6 text-right sm-text-left">
			<p class="margin-b-0">
				<a class="fweight-700" href="hello.do">Acecv</a> Theme Powered by: <a
					class="fweight-700" href="http://www.keenthemes.com/">KeenThemes.com</a>
			</p>
		</div>
	</div>
	<!--// end row -->
</div>
<script src="${pageContext.request.contextPath }/resources/zerif/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/jquery.nav.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/owl.carousel.min.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/js/menu/smoothscroll.js"></script> --%>
<script src="${pageContext.request.contextPath }/resources/zerif/js/jquery.vegas.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/zerif/js/zerif.js"></script>