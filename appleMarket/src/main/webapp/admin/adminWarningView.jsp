<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Warning</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-9"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Warning View</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right" onclick="location.href='/appleMarket/adminWarningList'">
                          <i class="fa fa-edit fa-fw"></i> 목록
                      </button>
                  </div>
              </div>
              <br>
            <div class="panel panel-default">
                <div class="panel-heading">
                	<ion-icon name="alert-circle-outline" class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminWarningView">
            			<tr>
                          <th>글번호</th>
                          <th>작성일</th>
                          <th>신고아이디</th>
                          <th>신고게시글 번호</th>
                          <th>게시판명</th>
                          <th>댓글여부</th>
                          <th>게시물(댓글)작성자</th>
                          <th>처리현황</th>
                         </tr>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//view의 주소값에서 상품 글번호 추출
function get_query(){ 
    var url = document.location.href; 
    var qs = url.substring(url.indexOf('?') + 1).split('&'); 
    for(var i = 0, result = {}; i < qs.length; i++){
         qs[i] = qs[i].split('='); 
         result[qs[i][0]] = decodeURIComponent(qs[i][1]); 
    } 
    return result; 
}

$(function(){
	var result = get_query();
	$.ajax({
		url: '/appleMarket/getAdminWarningView',
		type : 'post',
		data:'warning_seq='+result.warning_seq, 
		dataType: 'json',
		success:function(data){
			//alert(JSON.stringify(data));
				$('<tr>').append($('<td>',{
					align : 'center', 
					id:'warning_seq',
					text : data.warning_seq
				})).append($('<td>',{
					align : 'center', 
					id:'warning_logtime',
					text : data.warning_logtime
				})).append($('<td>',{
					align : 'center', 
					id:'member_id',
					text : data.member_id
				})).append($('<td>',{
					align : 'center', 
					id:'board_seq',
					text : data.board_seq
				})).append($('<td>',{
					align : 'center', 
					id:'board_name',
					text : data.board_name
				})).append($('<td>',{
					align : 'center', 
					id:'comment_YN',
					text : data.comment_YN
				})).append($('<td>',{
					align : 'center',
					id:'warning_id',
					text : data.warning_id
				})).append($('<td>',{
					align : 'center',
					id:'warning_status_YN',
					text : data.warning_status_YN
				})).appendTo($('#adminWarningView'));
				
				$('<tr>').append($('<th>',{
					align : 'center',
					text : '제목'
				})).append($('<td>',{
					align : 'left',
					id:'warning_subject',
					colspan:7,
					text : data.warning_subject
				})).appendTo($('#adminWarningView'));
				
				
			
				$('<tr>').append($('<td>',{
					align : 'left', 
					id:'warning_content',
					colspan:8,
					text : data.warning_content.replace(/\\r\\n|\\n|\\r/gm,'<br>')
				})).appendTo($('#adminWarningView'));
				
				
				$('#warning_content').append($('<img>',{//td의 자식 
					alt:'이미지',
					src:'/appleMarket/storage/'+data.warning_image,
					style:'width: auto; height: auto; cursor: pointer;'
				}));
		},error:function(err){
			console.log(err);
		}
		});
		
	
});

</script>
</body>
</html>