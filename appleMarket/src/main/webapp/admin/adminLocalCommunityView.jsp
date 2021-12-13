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
				<div class="panel-heading" style="text-align: center;">공지사항 수정
				</div>
				<div class="panel-body">
					<form id="adminLocalCommunityViewForm" name="adminLocalCommunityViewForm">
						<input type="hidden" id="localcommunity_seq" name="localcommunity_seq" value="${localcommunity_seq }">
						<table border="1" width="600" cellspacing="0" cellpadding="5"
							frame="hsides" rules="rows">

							<tr>
								<td colspan="4">
									<h3>
									<span id="subjectSpan"></span>
									</h3>
								</td>
							</tr>

							<tr>
								<td width="150">글번호 : <span id="seqSpan"></span></td>
								<td width="150">지역 : <span id="localSpan"></span></td>
								<td width="150">작성자 : <span id="idSpan"></span></td>
								<td width="150">조회수 : <span id="hitSpan"></span></td>
							</tr>

							<!-- 엔터를 안치고 글을 옆으로 길게쓴 경우-->
							<tr>
								<td colspan="4" valign="top">
								<pre style="white-space: pre-line; work-break: break-all;">
								<span id="contentSpan"></span>
								</pre></td>
							</tr>
						</table>

						<input type="button" id="adminLocalCommunityListBtn" 
							class="btn btn-outline btn-primary pull-right"
							value="목록"
							>

					</form>


				</div>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript" src="/appleMarket/js/adminLocalCommunityView.js"></script>
<script type="text/javascript">

$('#adminLocalCommunityListBtn').click(function(){
	location.href="/appleMarket/adminLocalCommunityList"
});


</script>
