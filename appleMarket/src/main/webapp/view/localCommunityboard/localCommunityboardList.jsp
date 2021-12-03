<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>우리동네 글 목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
</head>

<body>
<div class="page_section" >
   
   <div class="head_article">
      <h2 class="tit">
      우리동네 게시판
         <span class="tit_sub">우리동네 얘기하쇼</span>
      </h2>
      <div class="container"><!-- table -->
      <form name="" id="" action="">
         <input type="text" id="pg" name="pg" value="1">
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
                     <table class="table table-hover" id="localCommunityboardListTable">
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                              <th>조회</th>
                           </tr>
                        </thead>
                                          
                     </table>
                  </div> <!-- 테이블  -->
                  
               </td>
            </tr>
         </tbody>
         </table>         
         <div class="layout-pagination">
            <div class="pagediv"  style="width: 750px; text-align: center;" id="localCommunityboardPagingDiv"></div>
            <div>
               <button type="button">글쓰기</button>
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
   url: '/appleMarket/localCommunityboard/localCommunityboardGetList',
   type:'get',
   data: 'pg='+$('#pg').val(),
   dataType: 'json' ,
   success:function(data){
      //alert(JSON.stringify(data));
      
      $.each(data.list, function(index,items){
            
            $('<tbody>').append($('<tr>').append($('<td/>',{      
               text: items.localcommunityboard_seq               
            })).append($('<td/>',{                              
               }).append($('<a/>',{
                  href:'#',
                  text: items.localcommunityboard_subject,         
                  class: 'subjectA',
                  id:'subject_'+items.localcommunityboard_seq
                  
            }))).append($('<td/>',{
               
               text: items.localcommunityboard_user_id
               
            })).append($('<td/>',{
               
               text: items.localcommunityboard_logtime
               
            })).append($('<td/>',{
               
               text:items.localcommunityboard_hit                   
               
            }))).appendTo($('#localCommunityboardListTable')); //id값으로 가져와야한다
               
                        
         
         });
      //페이징처리
      $('#localCommunityboardPagingDiv').html(data.boardPaging);
      $('#localCommunityboardPagingDiv').css('cursor','pointer');
      
   },
   error:function(err){
      console.log(err);
   }
   });
});
</script>

</body>
</html>