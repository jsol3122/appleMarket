<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Member Manage</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-9"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Member Manage</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right" onclick="location.href='/appleMarket/adminBlackList'">
                          <i class="fa fa-edit fa-fw"></i> 블랙리스트
                      </button>
                  </div>
              </div>
              <br>
            <div class="panel panel-default">
                <div class="panel-heading">
                	<ion-icon name="people-outline" class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminMember">
              				<tr>
                               <th>회원번호</th>
                               <th>아이디</th>
                               <th>이메일</th>
                               <th>핸드폰</th>
                               <th>매너온도</th>
                               <th>사이트</th>
                               <th>가입일</th>
                               <th>관리</th>
                           </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/adminMemberList.js"></script>
<script type="text/javascript">
//삭제 버튼 - 회원삭제	
$(document).on("click", "#adminMember .pull-right", function(){

		var member_id = $(this).parents().prev().prev().prev().prev().prev().prev().html();
		var result = confirm("삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/adminMemberDelete',
				type : 'post',
				data : {'member_id' :member_id},
				success: function(data){
				    alert('회원 정보 삭제 완료');
				    location.href='/appleMarket/adminMemberList';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			
		}
});

//온도 감소 
$(document).on("click", ".nav__icon_minus", function(){
	var member_id = $(this).parents().prev().prev().prev().html();
	var member_reputation = $(this).parents().prev().next().children().eq(1).val();	
	var member_siteCheck = $(this).parents().next().html()
	
	if(member_reputation != 21.5){
		$.ajax({
			url: '/appleMarket/adminReputationDown',
			type : 'post',
			data : {'member_id' :member_id},
			success: function(data){
				alert('매너온도 낮추기 완료');
	
				location.href='/appleMarket/adminMemberList'
				
			},error : function(err){
				console.log(err);
			}
		});
	}else{
		$.ajax({
			url: '/appleMarket/adminBlackListDelete',
			type : 'post',
			data : {'member_id':member_id,
					'member_siteCheck':member_siteCheck},
			success: function(data){
				alert('매너온도 낮추기 완료');
	
				location.href='/appleMarket/adminMemberList'
				
			},error : function(err){
				console.log(err);
			}
		});
	}		
		
});

//온도 증가 
$(document).on("click", ".nav__icon_plus", function(){
	var member_id = $(this).parents().prev().prev().prev().html();
	$.ajax({
		url: '/appleMarket/adminReputationUp',
		type : 'post',
		data : {'member_id' :member_id},
		success: function(data){
			alert('매너온도 올리기 완료');

			location.href='/appleMarket/adminMemberList'
			
		},error : function(err){
			console.log(err);
		}
	});
			
		
});



</script>
</body>
</html>