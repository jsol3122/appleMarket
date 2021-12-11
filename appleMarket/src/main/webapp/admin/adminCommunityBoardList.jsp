<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.panel-body #admin_communityboard_user_id{
	text-align:center;
	border:none;
	background: transparent;
}
</style>  
<title>CommunityBoard</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-12"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">CommunityBoard</h1>
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
                    <table class="table table-hover" id="adminCommunityBoard">
              				<tr>
                               <th>No</th>
                               <th>제목</th>
                               <th>
                               	<input type="text" list="list" id="admin_communityboard_user_id" class="admin_communityboard_user_id" value="작성자"/>
								  <datalist id ="list">
								 	<option value="아이디를 입력하세요"/>
								  </datalist>
							   </th>
                               <th>작성일</th>
                               <th>관리</th>
                           </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/adminCommunityBoardList.js"></script>
<script type="text/javascript">
//삭제 버튼	
$(document).on("click", "#adminCommunityBoard .pull-right", function(){

		var communityboard_seq = $(this).parents().prev().prev().prev().prev().html();
		//alert(communityboard_seq);
	     var result = confirm("삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/adminCommunityBoardDelete',
				type : 'post',
				data : {'communityboard_seq' :communityboard_seq},
				success: function(data){
				    alert('삭제 완료');
				    location.href='/appleMarket/adminCommunityBoardList';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			
		}  
});

//아이디별로 출력
$('#adminCommunityBoard .admin_communityboard_user_id').focusout(function() {
	
	$("#adminCommunityBoard tr:gt(0)").remove(); 
	
	var communityboard_user_id = $(this).val();
	//alert(communityboard_user_id);
	
	
	if(communityboard_user_id!='작성자'){
		$.ajax({
			url: '/appleMarket/getAdminCommunityListId', 
			type: 'post',
			data : {'communityboard_user_id' :communityboard_user_id},
			success: function(data){
	//alert(JSON.stringify(data));
				
				//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
				$.each(data, function(index,items){
					$('<tr>').append($('<td>',{
						align : 'center',
						id:'communityboard_seq',
						text : items.communityboard_seq
					})).append($('<td>',{
						align:'center',
					}).append($('<a>',{
						href:'/appleMarket/adminCommunityBoardView?communityboard_seq='+items.communityboard_seq,
						class:'communityboard_subject',
						text : items.communityboard_subject,
						style:'text-decoration:none; color: inherit',
					}))).append($('<td>',{
						align : 'center', 
						id:'communityboard_user_id',
						text : items.communityboard_user_id
					})).append($('<td>',{
						align : 'center', 
						text : items.communityboard_logtime
					})).append($('<td>',{
						align:'center',
					}).append($('<input>',{//td의 자식 
						type: 'button',
						value: '삭제',
						class:'btn btn-outline btn-primary pull-right',
						id:'saleDelete'
					}))).appendTo($('#adminCommunityBoard'));

	});//each

		},error:function(err){
			console.log(err);
		}
	});

	}else{
		$.ajax({
			url: '/appleMarket/getAdminCommunityBoardList', 
			type: 'post',
			dataType: 'json', 
			success: function(data){
				//alert(JSON.stringify(data));
				
				//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
				$.each(data, function(index,items){
					$('<tr>').append($('<td>',{
						align : 'center',
						id:'communityboard_seq',
						text : items.communityboard_seq
					})).append($('<td>',{
						align:'center',
					}).append($('<a>',{
						href:'/appleMarket/adminCommunityBoardView?communityboard_seq='+items.communityboard_seq,
						class:'communityboard_subject',
						text : items.communityboard_subject,
						style:'text-decoration:none; color: inherit',
					}))).append($('<td>',{
						align : 'center', 
						id:'communityboard_user_id',
						text : items.communityboard_user_id
					})).append($('<td>',{
						align : 'center', 
						text : items.communityboard_logtime
					})).append($('<td>',{
						align:'center',
					}).append($('<input>',{//td의 자식 
						type: 'button',
						value: '삭제',
						class:'btn btn-outline btn-primary pull-right',
						id:'saleDelete'
					}))).appendTo($('#adminCommunityBoard'));

	});//each

		},error:function(err){
			console.log(err);
		}
	});
	} 
});
</script>
</body>
</html>