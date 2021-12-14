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
  
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>adminNoticeList</title>
</head>
<body>

<c:if test="${empty display}"> 
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Notice</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right" id="noticeWrite">
                          <i class="fa fa-edit fa-fw"></i> 공지사항 작성
                      </button>
                  </div>
            </div>
            <br>
            <div class="panel panel-default">
            	<div class="panel-heading">
                	<ion-icon name="clipboard-outline"class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="noticeTable">
                            <tr>
                                <th>No</th>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>수정</th>
                                <th>삭제</th>
                            </tr>
                        
                        
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
</c:if > 
                 <c:if test="${not empty display}">
                           <jsp:include page="${display }"/>
                        </c:if >  
                        
             <!-- sidebar -->
             <%@include file="/admin/adminindex.jsp" %>




<script type="text/javascript" src="/appleMarket/js/adminNoticeList.js"></script>
<script type="text/javascript">
//삭제 버튼	
$(document).on("click", ".NoticeDelete", function(){
		var admin_notice_seq = $(this).parents().prev().prev().prev().prev().html();
		//alert(admin_notice_seq+"삭제");
		 $.ajax({
			url:'/appleMarket/adminNoticeDelete'
			,type:'post'
			,data:{'admin_notice_seq' :admin_notice_seq}
			,success:function(data){
				alert("공지글 삭제 완료");
				
				location.href='/appleMarket/adminNoticeList'
			}
			,error:function(err){
				console.log(err);
			}
		});
	});	
//수정 버튼	
$(document).on("click", ".NoticeModify", function(){
		var admin_notice_seq = $(this).parents().prev().prev().prev().html();
		//alert(admin_notice_seq)
		location.href="/appleMarket/adminNoticeModifyForm?admin_notice_seq="+admin_notice_seq;
	
	});	
//작성버튼
$('#noticeWrite').click(function(){
	//alert("작성");
	location.href="/appleMarket/adminNoticeWriteForm"
});
</script>

</body>
</html>