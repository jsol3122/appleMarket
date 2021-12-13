<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>





<div class="page-wrapper">
	<div class="container-fluid">
		<div class="col-lg-8">
			<!--게시판 넓이 -->
			<div class="col-lg-12">
				<h1 class="page-header">공지사항 수정</h1>
			</div>
			<div class="row"></div>
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: center;">공지사항 수정 </div>
				<div class="panel-body">
					<form name="adminNoticeModifyForm" id="adminNoticeModifyForm">
						<input type="hidden" id="admin_notice_seq" name="admin_notice_seq"
							value="${admin_notice_seq }">

						<table class="table table-hover">
							<tr>
								<td width="70" align="right">제목</td>
								<td><input type="text" name="admin_notice_subject"
									id="admin_notice_subject" style="width: 657px;">
									<div id="subjectDiv"></div></td>
							</tr>
							<tr>
								<td width="70" align="right">내용</td>
								<td><textarea name=admin_notice_content
										id="admin_notice_content" cols="80" rows="25"></textarea>
									<div id="contentDiv"></div></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="button"
									class="btn btn-outline btn-primary pull-right"
									id="adminNoticeModifyBtn" value="글수정"> 
									<input
									type="reset" 
									class="btn btn-outline btn-primary pull-right"
									value="다시작성"></td>
							</tr>
						</table>

					</form>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	$.ajax({
		url:'/appleMarket/getadminNoticeView'
		,type:'post'
		,data:{'admin_notice_seq' :$('#admin_notice_seq').val()}
		,dataType:'json'
		,success:function(data){
			//alert(JSON.stringify(data));
			
			$('#admin_notice_subject').val(data.admin_notice_subject);
			$('#admin_notice_content').val(data.admin_notice_content);
			
		}
		,error:function(err){
			console.log(err);
		}
		
	});
	
	$('#adminNoticeModifyBtn').click(function(){
		//초기화 과정
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#admin_notice_subject').val() == '') {
			$('#subjectDiv').html('제목 입력'); 
			$('#admin_notice_subject').focus();
		}
		else if($('#admin_notice_content').val() == ''){
			$('#contentDiv').html('내용 입력');
			$('#admin_notice_content').focus();
		}
		else 
			$.ajax({
				url: '/appleMarket/getadminNoticeModify',
				type: 'post',
				data: $('#adminNoticeModifyForm').serialize(),
				success: function(){
					alert("글 수정 성공");
					location.href="/appleMarket/adminNoticeList"
				},
				error: function(err){
					console.log(err);
				}
			});
	});
	
});	

</script>
