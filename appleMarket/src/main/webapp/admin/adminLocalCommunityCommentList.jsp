<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>boardList</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">우리동네게시판 댓글 관리</h1>
            </div>
            <div class="row">
                  
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">우리동네게시판 댓글</div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminLocalCommunityCommentTable" name="adminLocalCommunityCommentTable">
							<thead>
								<tr>
									<th>NO</th>
									<th>내용</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>게시물번호</th>
									<th>관리</th>
								</tr>
							</thead>

						</table>
                </div>
            </div>
            
        </div>
    </div>
</div>

<script type="text/javascript" src="/appleMarket/js/adminLocalCommunityComment.js"></script>
<script type="text/javascript">
//삭제 버튼	
$(document).on("click", ".localCommunityboard_comment_delete", function(){
		var localcommunity_comment_seq = $(this).parents().prev().prev().prev().prev().prev().html();
		alert(localcommunity_comment_seq);
		
	    var result = confirm("삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/adminLocalCommunityCommentDelete',
				type : 'post',
				data : {'localcommunity_comment_seq':localcommunity_comment_seq},
				success: function(data){
				    alert('삭제 완료');
				    location.href='/appleMarket/adminLocalCommunityCommentList';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			location.href='/appleMarket/adminLocalCommunityCommentList';
		}   
});


</script>


</body>
</html>