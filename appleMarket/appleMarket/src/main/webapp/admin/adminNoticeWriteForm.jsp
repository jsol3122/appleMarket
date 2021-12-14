<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<div class="page-wrapper">
	<div class="container-fluid">
		<div class="col-lg-8">
			<!--게시판 넓이 -->
			<div class="col-lg-12">
				<h1 class="page-header">Notice Write</h1>
			</div>
			<div class="row"></div>
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: center;">Notice Write</div>
				<div class="panel-body">
					<form name="adminNoticeWriteForm" id="adminNoticeWriteForm">

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
								<td colspan="2" align="center">
									<input type="button" class="btn btn-outline btn-primary pull-center" id="adminNoticeWriteBtn" value="글작성"> 
									<input type="reset" class="btn btn-outline btn-primary pull-center" value="다시작성"></td>
							</tr>
						</table>

					</form>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
$('#adminNoticeWriteBtn').click(function(){
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
			url: '/appleMarket/getadminNoticeWrite',
			type: 'post',
			data: $('#adminNoticeWriteForm').serialize(),
			success: function(){
				alert("글 작성 성공");
				location.href="/appleMarket/adminNoticeList"
			},
			error: function(err){
				console.log(err);
			}
		});
});


</script>
