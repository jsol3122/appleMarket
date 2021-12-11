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
  
<title>BuyerBoard</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-9"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">BuyerBoard View</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right" onclick="location.href='/appleMarket/adminBuyerBoardList'">
                          <i class="fa fa-edit fa-fw"></i> 목록
                      </button>
                  </div>
              </div>
              <br>
            <div class="panel panel-default">
                <div class="panel-heading">
                	<ion-icon name="wallet-outline" class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminBuyerBoardView">
            			<tr id="start">
            				<th>작성자</th>
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
		url: '/appleMarket/getAdminBuyerBoardView',
		type : 'post',
		data:'buyerboard_seq='+result.buyerboard_seq, 
		dataType: 'json',
		success:function(data){
			//alert(JSON.stringify(data));
				$('#start').append($('<td>',{
					align : 'left', 
					id:'member_id',
					text : data.member_id
				})).appendTo($('#adminBuyerBoardView'));
				
				$('<tr>').append($('<th>',{
					align : 'center',
					text : '가격'
				})).append($('<td>',{
					align : 'left', 
					id:'buyerboard_price',
					text : data.buyerboard_price
				})).appendTo($('#adminBuyerBoardView'));
				
			$('<tr>').append($('<th>',{
					align : 'center',
					text : '제목'
				})).append($('<td>',{
					align : 'left',
					id:'buyerboard_subject',
					colspan:2,
					text : data.buyerboard_subject
				})).appendTo($('#adminBuyerBoardView'));
				 
				
			
				$('<tr>').append($('<td>',{
					align : 'left', 
					id:'buyerboard_content',
					colspan:2,
					text : data.buyerboard_content.replace(/\\r\\n|\\n|\\r/gm,'<br>')
				})).appendTo($('#adminBuyerBoardView'));
				
				$('#buyerboard_content').append($('<img>',{//td의 자식 
					alt:'이미지',
					src:'/appleMarket/storage/'+data.buyerboard_image1.replace(null, '') ,
					style:'width: 100%; height: 100%; cursor: pointer;'
				})).append($('<img>',{//td의 자식 
					alt:'이미지',
					src:'/appleMarket/storage/'+data.buyerboard_image2.replace(null, '') ,
					style:'width: 100%; height: 100%; cursor: pointer;'
				})).append($('<img>',{//td의 자식 
					alt:'이미지',
					src:'/appleMarket/storage/'+data.buyerboard_image3.replace(null, '') ,
					style:'width: 100%; height: 100%; cursor: pointer;'
				}));
		},error:function(err){
			console.log(err);
		}
		});
		
	
});

</script>
</body>
</html>