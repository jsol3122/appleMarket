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
                    <input type="text" name="warning_seq" id="warning_seq" value="${warning_seq}">
                    <table class="table table-hover" id="adminWarningView">
              				<tr>
                               <td id="warning_subject" colspan="3" width="400" height="30">
                           </tr>
                           
                           <tr>
                           	 <td id="warning_content"colspan="3" width="200" height="500">
                           </tr>
                    </table>
                </div>
            </div>
            
             <!-- sidebar -->
             <%@include file="/admin/adminindex.jsp" %>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
if($('#warning_seq').val() !=null){
	$.ajax({
		url: '/appleMarket/getAdminWarningView',
		type : 'post',
		data:'warning_seq='+$('#warning_seq').val(), 
		dataType: 'json',
		success:function(data){
			alert(JSON.stringify(data));
		
			
			$('#warning_subject').html(data.subject);

			$('#warning_content').html(data.content.replace(/(?:\r\n|\r|\n)/g, '<br />'));
			/* 
			$('#no').html('글번호 : '+data.seq);
			$('#name').html('작성자 : '+data.name);
			$('#hit').html('조회수 : '+data.hit);
			$('#warning_content').html(data.content.replace(/(?:\r\n|\r|\n)/g, '<br />'));
 */
						
		},error:function(err){
			console.log(err);
		}
		});
		}
	
});

</script>
</body>
</html>