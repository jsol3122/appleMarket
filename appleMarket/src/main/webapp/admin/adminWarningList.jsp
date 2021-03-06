<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h1 class="page-header">Warning</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                  </div>
              </div>
              <br>
            <div class="panel panel-default">
                <div class="panel-heading">
                	<ion-icon name="alert-circle-outline" class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminWarning">
              				<tr>
                               <th>No</th>
                               <th>카테고리</th>
                               <th>제목</th>
                               <th>신고날짜</th>
                               <th>처리현황</th>
                               <th>관리</th>
                           </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/adminWarningList.js"></script>
<script type="text/javascript">
//처리 버튼	
$(document).on("click", ".pull-right", function(){

	var warning_seq = $(this).parents().prev().prev().prev().prev().prev().html();
	var result = confirm("신고처리 완료하시겠습니까?");
	
	if(result){
		alert(warning_seq);
		$.ajax({
			url: '/appleMarket/adminWarningChange',
			type : 'post',
			data : {'warning_seq' :warning_seq},
			success: function(data){
				alert('처리 완료');				
				location.href='/appleMarket/adminWarningList'
		
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