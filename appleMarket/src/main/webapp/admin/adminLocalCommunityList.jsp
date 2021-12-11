<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>boardList</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">우리동네게시판 관리</h1>
				</div>
				<div class="row"></div>
				<div class="panel panel-default">
					<div class="panel-heading">우리동네게시판</div>
					<div class="panel-body">
						<table class="table table-hover" id="localCommunityTable" name="localCommunityTable">
							<thead>
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>지역</th>
									<th><input type="text" list="list" id="admin_localcommunity_user_id" class="admin_localcommunity_user_id" value="작성자"/>
										  <datalist id ="list">
										 	<option value="아이디를 입력하세요"/>
										  </datalist>
									</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>관리</th>
								</tr>
							</thead>

						</table>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript" src="/appleMarket/js/adminLocalCommunity.js"></script>
	<script type="text/javascript">
	
//삭제 버튼	
$(document).on("click", ".localCommunityDelete", function(){

		var localcommunity_seq = $(this).parents().prev().prev().prev().prev().prev().prev().html();
		//alert(localcommunity_seq+"삭제");
		
		  $.ajax({
			url:'/appleMarket/adminLocalCommunityDelete'
			,type:'post'
			,data:{'localcommunity_seq' :localcommunity_seq}
			,success:function(data){
				alert("우리동네게시글 삭제 완료");
				
				location.href='/appleMarket/adminLocalCommunityList'
			}
			,error:function(err){
				console.log(err);
			}
		}); 
	});	

//특정아이디검색
$('#localCommunityTable .admin_localcommunity_user_id').focusout(function(){
    $("#localCommunityTable tr:gt(0)").remove(); 

    var localcommunity_user_id = $(this).val();
    //alert(localcommunity_user_id);

    if(location_dong!='지역'){
        $.ajax({
            url:'/appleMarket/getAdminLocalCommunityListId'
            ,type:'post'
            ,data:{'localcommunity_user_id' :localcommunity_user_id}
            ,dataType:'json'
            ,success:function(data){
                //console.log(JSON.stringify(data));
    
                $.each(data,function(index,items){
                    $('<tr>').append($('<td>',{
                        align : 'center'
                        ,text : items.localcommunity_seq
                    })).append($('<td>',{
                        align:'center'
                    }).append($('<a>',{ //td 자식
                        href:'/appleMarket/adminLocalCommunityView?localcommunity_seq='+items.localcommunity_seq
                        ,class:'localcommunity_subject'
                        ,text: items.localcommunity_subject
                        ,style:'text-decoration:none; color: inherit'
                    }))).append($('<td>',{
                        align : 'center'
                        ,text : items.location_dong
                    })).append($('<td>',{
                        align : 'center'
                        ,text : items.localcommunity_user_id
                    })).append($('<td>',{
                        align : 'center'
                        ,text : items.localcommunity_logtime
                    })).append($('<td>',{
                        align : 'center'
                        ,text : items.localcommunity_hit
                    })).append($('<td>',{
                        align:'center'
                    }).append($('<input>',{//td의 자식
                        type:'button'
                        ,value:'delete'
                        ,class:'btn btn-outline btn-primary pull-right localCommunityDelete' 
                    }))).appendTo($('#localCommunityTable'));
                });
                }
            ,error:function(err){
                console.log(err);
            }
    
    
            });
        }else{
        $.ajax({
        url:'/appleMarket/getAdminLocalCommunityList'
        ,type:'post'
        ,dataType:'json'
        ,success:function(data){
            //console.log(JSON.stringify(data));

            $.each(data,function(index,items){
                $('<tr>').append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_seq
                })).append($('<td>',{
                    align:'center'
                }).append($('<a>',{ //td 자식
                	href:'/appleMarket/adminLocalCommunityView?localcommunity_seq='+items.localcommunity_seq
                    ,class:'localcommunity_subject'
                    ,text: items.localcommunity_subject
                    ,style:'text-decoration:none; color: inherit'
                }))).append($('<td>',{
                    align : 'center'
                    ,text : items.location_dong
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_user_id
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_logtime
                })).append($('<td>',{
                    align : 'center'
                    ,text : items.localcommunity_hit
                })).append($('<td>',{
                    align:'center'
                }).append($('<input>',{//td의 자식
                    type:'button'
                    ,value:'delete'
                    ,class:'btn btn-outline btn-primary pull-right localCommunityDelete' 
                }))).appendTo($('#localCommunityTable'));
            });
            }
        ,error:function(err){
            console.log(err);
        }


        });
        
        }

});

</script>


</body>
</html>