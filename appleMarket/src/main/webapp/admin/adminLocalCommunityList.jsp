<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>boardList</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">우리동네게시판 관리</h1>
				</div>
				<div class="row"></div>
				<div class="panel panel-default">
					<div class="panel-heading">우리동네게시판</div>
					<div class="panel-body">
						<table class="table table-hover" id="localCommunityTable" name="localCommunityTable">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th><input type="text" list="list" id="location"
										class="location" value="지역" /> 
										<datalist id="list">
											<option value="지역을 입력하세요" />
											<option value="역삼동" />
											<option value="독산동" />
											<option value="구로동" />
											<option value="가산동" />
										</datalist></th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>관리</th>
								</tr>
							</thead>

						</table>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="/appleMarket/js/adminLocalCommunity.js"></script>
	<script type="text/javascript">
	
//삭제 버튼	
$(document).on("click", ".localCommunityDelete", function(){

		var localcommunity_seq = $(this).parents().prev().prev().prev().prev().prev().prev().html();
		alert(localcommunity_seq+"삭제");
		
		  $.ajax({
			url:'/appleMarket/adminLocalCommunityDelete'
			,type:'post'
			,data:{'localcommunity_seq' :localcommunity_seq}
			,success:function(data){
				alert("우리동네게시글 삭제 완료");
				
				location.href='/appleMarket/adminLocalCommunityList'
			}
			,error:function(err){
				console.log(err);
			}
		}); 
	});	

</script>


</body>
</html>