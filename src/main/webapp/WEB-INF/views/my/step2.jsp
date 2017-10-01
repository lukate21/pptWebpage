<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<div class="step-pane" data-step="2">
	<div class="form-horizontal" id="sample-form">
		<div class="form-group">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1">
				<div class="row">
					<div class="col-sm-6">
						<div class="row">
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a data-toggle="tab" href="#textTab"
										aria-expanded="true"> 단어
									</a></li>
	
									<li class=""><a data-toggle="tab" href="#textAreaTab"
										aria-expanded="false"> 텍스트 
									</a></li>
	
									<li class=""><a data-toggle="tab" href="#newsTab"
										 aria-expanded="false">뉴스
									</a></li>
									
									<li class=""><a data-toggle="tab" href="#mydicTab"
										 aria-expanded="false">내사전
									</a></li>
								</ul>
	
								<div class="tab-content">
									<div id="textTab" class="tab-pane fade active in">
										<p><input type="text" id="inputTerm" size="30" placeholder="단어를 입력해주세요"></p>
									</div>
	
									<div id="textAreaTab" class="tab-pane fade">
										<div class="widget-box widget-color-blue">
											<div class="widget-header widget-header-small"></div>
											<div class="widget-body">
												<div class="widget-main no-padding">
													<div class="wysiwyg-editor" id="editor2"
														contenteditable="true" style="height: 100px;"></div>
												</div>
												<div class="widget-toolbox padding-4 clearfix">
													<div class="btn-group pull-right">
														<button class="btn btn-sm btn-default btn-white btn-round">
															<i class="ace-icon fa fa-times bigger-125"></i>Cancel
														</button>
														<button class="btn btn-sm btn-success btn-white btn-round"
															id="textMorp">
															<i class="ace-icon fa fa-globe bigger-125"></i>분석' <i
																class="ace-icon fa fa-arrow-right icon-on-right bigger-125"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
	
									<div id="newsTab" class="tab-pane fade">
										<p><input type="text" id="inputUrl" size="40" placeholder="url 주소를 입력해주세요."></p>
									</div>
	
									<div id="mydicTab" class="tab-pane fade">
										<p>내사전</p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div id="inputDic">
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="row">
							<div class="tabbable">
								<ul class="nav nav-tabs" >
									<li class="active"><a data-toggle="tab" href="#"
										aria-expanded="true">등록할 단어
									</a></li>
									<button class="btn btn-white btn-warning btn-bold pull-right" onclick="deleteAll()">
										<i class="ace-icon fa fa-trash-o bigger-120 orange"></i>전체삭제
									</button>
									
								</ul>
								<div class="tab-content">
									<div class="row">
										<span class="badge badge-info pull-right" id="selectedTermCnt">0</span>
										<div id="textTab" class="tab-pane fade active in">
											<div class="inline">
												<input type="text" name="tags" id="form-field-tags"  />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).on('keydown','#inputTerm',function(key){
		if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
			var $tag_obj = $('#form-field-tags').data('tag');
			$tag_obj.add(this.value);
			//$('.tags').append('<span class="tag">'+this.value+'<button type="button" class="close">×</button></span>');
			this.value='';
		}
		$('#selectedTermCnt').text($('.tags span').length);
		$('#termCntSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+$('#selectedTermCnt').text());
	});
	
	//텍스트 요청을 통한 형태소 분석 결과 얻기
	$(document).on('click','#textMorp',function(){
		if($('#editor2').text().length>300){
			alert('글자는 최대 300자까지 가능합니다.');
			return ;
		}
		$.ajax({
			url : "${context}/my/analysis/getMorp.json",
			data : {
				'type' : 'text',
				'data' : encodeURI($('#editor2').text())
			},
			async : false,
			success : function(data){
				$('#inputDic').html('<select multiple="multiple" size="10" name="duallistbox_demo1[]" id="duallist"></select>');
				var morp = JSON.parse(data);
				for (term in morp) {
					if (isNaN(parseInt(term)))
						$('#duallist').append('<option value="'+term+'">' + term + '</option>');
				}
				
				var demo1 = $('select[name="duallistbox_demo1[]"]')
				.bootstrapDualListbox(
						{
							infoTextFiltered : '<span class="label label-purple label-lg">Filtered</span>'
						});
				var container1 = demo1.bootstrapDualListbox('getContainer');
				container1.find('.btn').addClass('btn-white btn-info btn-bold');
				$('.btn.clear1').remove();
				$('.btn.clear2').remove();
				$('.info-container')[1].append('<button class="btn btn-sm btn-success btn-white btn-round pull-right" onclick="addAll()">'
						+'<i class="ace-icon fa fa-share green bigger-110"></i>추가</button>');
			},
			error : function(e){
				console.log("error : "+ e);
			}
		});
	})
	
	//뉴스기사로 형태소 분석 결과 얻기
	$(document).on('keydown','#inputUrl',function(key){
		if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
			$.ajax({
				url : "${context}/my/analysis/getMorp.json",
				data : {
					'type' : 'news',
					'data' : this.value
				},
				async : false,
				success : function(data){
					$('#inputDic').html('<select multiple="multiple" size="10" name="duallistbox_demo1[]" id="duallist"></select>');
					var morp = JSON.parse(data);
					for (i in morp) {
						if (isNaN(parseInt(morp[i].key)))
							$('#duallist').append('<option value="'+morp[i].key+'">' + morp[i].key + '</option>');
					}
					
					var demo1 = $('select[name="duallistbox_demo1[]"]')
					.bootstrapDualListbox(
							{
								infoTextFiltered : '<span class="label label-purple label-lg">Filtered</span>'
							});
					var container1 = demo1.bootstrapDualListbox('getContainer');
					container1.find('.btn').addClass('btn-white btn-info btn-bold');
					$('.btn.clear1').remove();
					$('.btn.clear2').remove();
					$('.info-container')[1].append('<button class="btn btn-sm btn-success btn-white btn-round pull-right" onclick="addAll()">'
							+'<i class="ace-icon fa fa-share green bigger-110"></i>추가</button>');
				},
				error : function(e){
					console.log("error : "+ e);
				}
			});
			this.value='';
		}
	})
	
	function addAll(){
		var options = $('select')[1].options;
		var $tag_obj = $('#form-field-tags').data('tag');
		for(var i=0; i<options.length; i++){
			var term = options[i].text;
			$tag_obj.add(term);
		}
		$('#selectedTermCnt').text($('.tags span').length);
		$('#termCntSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+$('#selectedTermCnt').text());
	}
	
	function deleteAll(){
		var $tag_obj = $('#form-field-tags').data('tag');
		var termObj = $tag_obj.values;
		for(var i=termObj.length-1; i>=0; i--){
			$tag_obj.remove(i);
		}
		$('#selectedTermCnt').text(0);
		$('#termCntSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+$('#selectedTermCnt').text());
	}
	//개수 카운트
	$(document).on('keydown','.tags',function(key){
		if (key.keyCode == 13) {//엔터는 13
			$('#selectedTermCnt').text($('.tags span').length);
			$('#termCntSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+$('#selectedTermCnt').text());
		}
	});
	$(document).on('keydown','.tags',function(key){
		if (key.keyCode == 8) {//백스페이스는 8
			$('#selectedTermCnt').text($('.tags span').length);
			$('#termCntSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+$('#selectedTermCnt').text());
		}
	});
	$(document).on('click','.tag .close',function(){
		$('#selectedTermCnt').text($('.tags span').length);
		$('#termCntSpan').html('<i class="ace-icon fa fa-angle-double-right"></i>'+$('#selectedTermCnt').text());
	});
	/* $(document).on('change','.tags',function(){
		$('#selectedTermCnt').text($('.tags span').length);
	}); */
</script>
