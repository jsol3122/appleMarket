<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Community Comment</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-12"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Community Comment</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right" onclick="location.href='/appleMarket/adminBlackList'">
                          <i class="fa fa-edit fa-fw"></i> 공지사항 작성
                      </button>
                  </div>
              </div>
              <br>
            <div class="panel panel-default">
                <div class="panel-heading">
                	<ion-icon name="wallet-outline" class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminCommunityComment">
              				<tr>
                               <th>NO</th>
                               <th>내용</th>
                               <th>작성자</th>
                               <th>작성일</th>
                               <th>게시물번호</th>
                               <th>관리</th>
                           </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/adminCommunityCommentList.js"></script>
<script type="text/javascript">
//삭제 버튼	
$(document).on("click", "#adminCommunityComment .pull-right", function(){

		var communityboard_comment_seq = $(this).parents().prev().prev().prev().prev().prev().html();
		//alert(communityboard_comment_seq);
	    var result = confirm("삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/adminCommunityCommentDelete',
				type : 'post',
				data : {'communityboard_comment_seq' :communityboard_comment_seq},
				success: function(data){
				    alert('삭제 완료');
				    location.href='/appleMarket/adminCommunityCommentList';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			
		}   
});
</script>
</body>
</html>