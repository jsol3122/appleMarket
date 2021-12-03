<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
input[type=checkbox] {
    display:none;
    padding-left: 23px; 
	background-repeat: no-repeat;
	background-image: url('./img/checker-off.svg');
}

input[type=checkbox] {
    display:none;
}
input[type=checkbox] + label { 
    cursor: pointer; 
    padding-left: 23px; 
    background-repeat: no-repeat;
    background-image: url('/appleMarket/img/checker-off.svg');
}
input[type=checkbox]:checked + label {
    background-image: url('/appleMarket/img/checker-on.svg');
}
input[type=checkbox]:disabled + label {
    background-image: url('/appleMarket/img/checker-disabled.svg');
}
 
</style>
<h3>이미지 등록</h3>
<form id="communityboardWriteForm" enctype="multipart/form-data" method="post" action=""><!-- get방식 안 먹음 무조건 post방식으로만 먹힘 , ajax쓸거라서 나중에 지워짐 -->
<table border="1" cellpadding="5" cellspacing="0" >
	
		<tr>
			<input type="checkbox" name="checker" id="checker1"><label for="checker1">익명</label>
			<td align="center"> 글제목</td>				
			<td>
			
			<input type="text" name = "imageName" id="imageName" size="35" placeholder="글 제목 입력">			
			<div id="emailDiv"></div>
			</td>
			
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
			<textarea name="imageContent" id="imageContent" cols="35" rows="15" placeholder="내용 입력" style="﻿overflow-y:scroll; overflow-x:hidden;"></textarea>			
			<div id="contentDiv"></div>
			</td>			
		</tr>		
		<tr>
			 <td colspan="2">				
				<input type="file" name="img[]" multiple>
			</td> 
		</tr>
		
		<tr>		
			<td colspan="2" align="center">
				<input type="submit" id="imageboardWriteBtn" value="이미지등록">
				<input type="reset" value="다시작성">	
			
			</td>
		</tr>
		
	</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#imageboardWriteBtn').click(function(){
	$('#imageboardWriteForm').submit();
	
});
</script>