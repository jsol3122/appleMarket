<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>이미지 등록</h3>

<!-- 1. 단순 submit ~ action -->
<%--
<form id="imageboardWriteForm" enctype="multipart/form-data" method="post" 
action="/chapter06_SpringMaven/user/imageboardWrite">
 --%>
        
<!-- 2. AJax -->
<form id="saleboardWriteForm" >        
	<table border="1" cellpadding="5" cellspacing="0">

<!-- 		<tr>
			<td align="center" width="100">작성자</td>
			<td><input type="text" name="member_id" id="member_id" size="50"></td>
		</tr> -->
	
		<tr>
			<td align="center" width="100">상품명</td>
			<td><input type="text" name="sale_subject" id="sale_subject" size="50"></td>
		</tr>
		
		<tr>
			<td align="center" width="100">단가</td>
			<td><input type="text" name="sale_price" id="sale_price" size="50"></td>
		</tr>
		
		<tr>
			<td align="center" width="100">카테고리</td>
			<td><input type="text" name="sale_category" id="sale_category" size="50"></td>
		</tr>
		
		<tr>
			<td align="center" width="100">내용</td>
			<td><textarea cols="50" rows="15" name="sale_content" id="sale_content"></textarea></td>
		</tr>
		
		<!-- 이미지 input은 name 을 다 같게 해줘야 배열로 데이터가 간다. name = image1, 2, ... 이렇게 하면 안되고 img 로 통일 -->
		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr>
		
 		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 
		
		 <tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 
		
 		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 
		
 		<tr>
			<td colspan="2">
				<input type="file" name="img">
			</td>
		</tr> 				

<%-- 		<tr>
			<td colspan="2">
				<input type="file" name="img[]" multiple>
			</td>
		</tr>		
 --%>		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="saleboardWriteBtn" value="이미지등록"/>
				<input type="reset" value="다시작성"/>
			</td>
      </tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$('#saleboardWriteBtn').click(function(){
		//1. 단순 submit
		//$('#imageboardWriteForm').submit();
		
		//2. AJax 통신
		var formData = new FormData($('#saleboardWriteForm')[0]); // form 안에 있는 모든 것
		//FormData 는 Forms 라는 복수형 객체들을 내장하고 있기 때문에 이렇게 form 하나만 쓰더라도 [0]이라고 인덱스를 써줘야 한다. 
		$.ajax({
			url: '/appleMarket/saleboard/saleboardWrite',
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data: formData,
			success: function(){
				alert('이미지 등록 완료');
			},
			error: function(err){
				console.log(err)
			}
		});
	});
</script>

<!-- 
processData
 - 기본값은 true
 - 기본적으로 Query String으로 변환해서 보내진다('변수=값&변수=값')
 - 파일 전송시에는 반드시 false로 해야 한다.(formData를 문자열로 변환하지 않는다)
 
contentType
  - 기본적으로 "application/x-www-form-urlencoded; charset=UTF-8"
  - 파일 전송시에는 'multipart/form-data'로 전송이 될 수 있도록 false로 설정한다
 -->
