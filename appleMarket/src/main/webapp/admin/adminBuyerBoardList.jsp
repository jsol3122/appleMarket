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
.panel-body #location{
	text-align:center;
	border:none;
	background: transparent;
	width : 80px;
}
</style>
<title>BuyerBoard</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-12"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">BuyerBoard</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                  </div>
              </div>
              <br>
            <div class="panel panel-default">
                <div class="panel-heading">
                	<ion-icon name="wallet-outline" class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminBuyerBoard">
              				<tr>
                               <th>No</th>
                               <th>카테고리</th>
                               <th>제목</th>
                               <th>
                               	<input type="text" list="list" id="location" class="location" value="지역"/>
								  <datalist id ="list">
								 	<option value="지역을 입력하세요"/>
								    <option value="역삼동"/>
								  	<option value="독산동"/>
								  	<option value="구로동"/>
								  	<option value="가산동"/>
								  </datalist>
							   </th>
                               <th>상태</th>
                               <th>판매자</th>
                               <th>가격</th>
                               <th>등록일</th>
                               <th>관리</th>
                           </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/adminBuyerBoardList.js"></script>
<script type="text/javascript">
//삭제 버튼
$(document).on("click", "#adminBuyerBoard .pull-right", function(){

		var buyerboard_seq = $(this).parents().prev().prev().prev().prev().prev().prev().prev().prev().html();
		alert(buyerboard_seq);
	    var result = confirm("삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: '/appleMarket/adminBuyerBoardDelete',
				type : 'post',
				data : {'buyerboard_seq' :buyerboard_seq},
				success: function(data){
				    alert('삭제 완료');
				    location.href='/appleMarket/adminBuyerBoardList';
	
				},error : function(err){
					console.log(err);
				}
			});
		
		}else{
			
		} 
});

//지역별로 출력
$('#adminBuyerBoard .location').focusout(function() {
	
	$("#adminBuyerBoard tr:gt(0)").remove(); 
	
	var location_dong = $(this).parents().children().eq(0).val();
	//alert(location_dong);
	
	if(location_dong!='지역'){
		$.ajax({
			url: '/appleMarket/getAdminBuyerBoardListDong', 
			type: 'post',
			data : {'location_dong' :location_dong},
			success: function(data){
				//alert(JSON.stringify(data));
				
				//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
				$.each(data, function(index,items){
					$('<tr>').append($('<td>',{
						align : 'center',
						id:'buyerboard_seq',
						text : items.buyerboard_seq
					})).append($('<td>',{
						align : 'center', 
						id:'buyerboard_category',
						class:'buyerboard_category',
						text : items.buyerboard_category
					})).append($('<td>',{
						align:'center',
					}).append($('<a>',{
						href:'/appleMarket/adminBuyerBoardView?buyerboard_seq='+items.buyerboard_seq,
						class:'buyerboard_subject',
						text : items.buyerboard_subject,
						style:'text-decoration:none; color: inherit',
					}))).append($('<td>',{
						align : 'center', 
						text : items.location_dong
					})).append($('<td>',{
						align : 'center', 
						text : items.buyer_status
					})).append($('<td>',{
						align : 'center', 
						text : items.member_id
					})).append($('<td>',{
						align : 'center', 
						text : items.buyerboard_price
					})).append($('<td>',{
						align : 'center', 
						text : items.buyerboard_logtime
					})).append($('<td>',{
						align:'center',
					}).append($('<input>',{//td의 자식 
						type: 'button',
						value: '삭제',
						class:'btn btn-outline btn-primary pull-right',
						id:'buyerDelete'
					}))).appendTo($('#adminBuyerBoard'));

	});//each
	
			},error:function(err){
				console.log(err);
			}
		});
	}else{
		$.ajax({
			url: '/appleMarket/getAdminBuyerBoardList', 
			type: 'post',
			dataType: 'json', 
			success: function(data){
				//alert(JSON.stringify(data));
				
				//List로 보내면 data라고만 써야 한다. - json 에선 data.list로 보내야한다.
				$.each(data, function(index,items){
					$('<tr>').append($('<td>',{
						align : 'center',
						id:'buyerboard_seq',
						text : items.buyerboard_seq
					})).append($('<td>',{
						align : 'center', 
						id:'buyerboard_category',
						class:'buyerboard_category',
						text : items.buyerboard_category
					})).append($('<td>',{
						align:'center',
					}).append($('<a>',{
						href:'/appleMarket/adminBuyerBoardView?buyerboard_seq='+items.buyerboard_seq,
						class:'buyerboard_subject',
						text : items.buyerboard_subject,
						style:'text-decoration:none; color: inherit',
					}))).append($('<td>',{
						align : 'center', 
						text : items.location_dong
					})).append($('<td>',{
						align : 'center', 
						text : items.buyer_status
					})).append($('<td>',{
						align : 'center', 
						text : items.member_id
					})).append($('<td>',{
						align : 'center', 
						text : items.buyerboard_price
					})).append($('<td>',{
						align : 'center', 
						text : items.buyerboard_logtime
					})).append($('<td>',{
						align:'center',
					}).append($('<input>',{//td의 자식 
						type: 'button',
						value: '삭제',
						class:'btn btn-outline btn-primary pull-right',
						id:'buyerDelete'
					}))).appendTo($('#adminBuyerBoard'));

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