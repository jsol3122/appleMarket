<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>조잘조잘</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
<!-- 조잘조잘 게시판 body  -->
<!-- side nav없으면 div 하나만 잡으면 됨 -->
<div class="page_section" >
	
	<div class="head_article">
		<h2 class="tit">
		조잘조잘 게시판
			<span class="tit_sub">우리지역의 자유게시판</span>
		</h2>
		<div class="container"><!-- table -->
		<form name="" id="" action="">
			<input type="text" name="id" value="페이징처리 변수 hidden처리">
			<table>
				<tr>
				<td>검색창</td>
				</tr>
				
			</table>
			<table width="100%" align="center" cellpadding="0" cellspacing="0"   >
			<tbody>
				<tr>
					<td>
						<div>
							<table class="table table-hover" id="communityboardListTable">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
								</thead>
								<tbody>
									<!--글 뿌려주는 구간 예시로 데이터 넣음  -->
								<tr>
							        <td>July</td>
							        <td>Dooley</td>
							        <td>july@example.com</td>
							        <td>2020.2.1</td>
							        <td>1</td>
							     </tr>
							     	
							     </tbody>							      
							</table>
						</div> <!-- 테이블  -->
						
					</td>
				</tr>
			</tbody>
			</table>			
			<div class="layout-pagination">
				<div class="pagediv">
					<a href="">맨 처음 페이지로 가기</a>
					<a href="">이전 페이지로 가기</a>
					
					<a href="">다음 페이지로 가기</a>
					<a href="">맨 끝 페이지로 가기</a>
				</div>
			</div>
	
			</form>
		</div>
	</div>
 </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
$.ajax({
	url: ,
	type:'post',
	data: ,
	dataType: 'json' ,
	success:function(){
		
	},
	error:function(err){
		console.log(err);
	}
	});
});
</script>

</body>
</html>