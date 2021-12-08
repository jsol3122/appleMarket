<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도</title>
    
</head>
<body>
<div class="box-header with-border" id="address" style="width:600px;height:700px;position:relative;overflow:hidden;"></div>
<div><h3> </h3></div>	  
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75b263d76606aaf650816f233cd5f1c9"></script>
<script>
setTimeout("window.close();", 10000);
alert('회원님의 현재 위치를 받아옵니다. 이 창은 10초 후 자동으로 종료 됩니다.');
$(function(){

	//현재 접속한 브라우저의 위도와 경도 출력하기 

	navigator.geolocation.getCurrentPosition(function(position){
	

		var loc = position.coords.latitude + "-" +position.coords.longitude

		//console.log(loc);
		//address라는 URL loc를 파라미터로 넘겨서 

		//json 타입으로 데이터를 받아오는 ajax 요청 

		
		$.ajax({
			url: '/appleMarket/address',
			type:'post',
			data:{"loc":loc},
			dataType:'json',
			success:function(data){
				//alert(data.address);
				document.getElementById("address").innerHTML="<h3>" + data.address + "</h3>";
			
				//지도생성
				var mapContainer = document.getElementById('address'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), // 지도의 중심좌표
			        level: 3, // 지도의 확대 레벨
			    };
			 
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			
			// 지도에 표시할 원을 생성합니다
			var circle = new kakao.maps.Circle({
			    center : new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),  // 원의 중심좌표 입니다 
			    radius: 100, // 미터 단위의 원의 반지름입니다 
			    strokeWeight: 5, // 선의 두께입니다 
			    strokeColor: '#75B8FA', // 선의 색깔입니다
			    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			    strokeStyle: 'dashed', // 선의 스타일 입니다
			    fillColor: '#CFE7FF', // 채우기 색깔입니다
			    fillOpacity: 0.7  // 채우기 불투명도 입니다   
			}); 

			// 지도에 원을 표시합니다 
			circle.setMap(map); 
			
			},
            error: function(err){
                console.log(err);
             }

		});

		

	});

});	
</script>
</body>
</html>