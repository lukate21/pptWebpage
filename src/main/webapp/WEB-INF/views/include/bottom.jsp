<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="footer">
	<div class="footer-inner">
		<div class="footer-content">
			<span class="bigger-120">
				<span class="blue bolder">Ace</span>
				Application &copy; 2013-2014
			</span>

			&nbsp; &nbsp;
			<span class="action-buttons">
				<a href="#">
					<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
				</a>

				<a href="#">
					<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
				</a>

				<a href="#">
					<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
				</a>
			</span>
		</div>
	</div>
</div>
		<script src="${context}/resources/assets/js/bootstrap.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="${context}/resources/assets/js/jquery-ui.min.js"></script>
		<script src="${context}/resources/assets/js/jquery.ui.touch-punch.min.js"></script>
		<!-- ace scripts -->
		<script src="${context}/resources/assets/js/ace-elements.min.js"></script>
		<script src="${context}/resources/assets/js/ace.min.js"></script>
		<script src="${context}/resources/loading.js"></script>
<script>
jQuery(function($) {
	$( "#id-btn-signOut" ).on('click', function(e) {
		e.preventDefault();
	
		$( "#dialog-signOut" ).removeClass('hide').dialog({
			resizable: false,
			width: '320',
			modal: true,
			title: "     탈퇴하기",
			title_html: true,
			buttons: [
				{
					html: "<i class='ace-icon fa fa-trash-o bigger-110'></i>&nbsp; 탈퇴하기",
					"class" : "btn btn-danger btn-minier",
					click: function() {
						$( this ).dialog( "close" );
						location.href = "${context}/signOut.do";
					}
				}
				,
				{
					html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 취소",
					"class" : "btn btn-minier",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
			]
		});
	});
});
</script>
		<!-- inline scripts related to this page -->
