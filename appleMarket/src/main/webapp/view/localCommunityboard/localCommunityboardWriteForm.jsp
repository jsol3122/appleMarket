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
<h3>우리동네 글 등록</h3>
<form id="localCommunityboardWriteForm">
<table border="1" cellpadding="5" cellspacing="0" >
	
		<tr>
			
			<td align="center"> 글제목</td>				
			<td>
			
			<input type="text" name = "localcommunity_subject" id="localcommunity_subject" size="35" placeholder="글 제목 입력">			
			<div id="subjectDiv"></div>
			</td>
			
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
			<textarea name="localcommunity_content" id="localcommunity_content" cols="35" rows="15" placeholder="내용 입력" style="﻿overflow-y:scroll; overflow-x:hidden;"></textarea>			
			<div id="contentDiv"></div>
			</td>			
		</tr>		
		<tr>
			 <td colspan="2">				
				<input type="file" name="img">
			</td> 
		</tr>
		
		<tr>		
			<td colspan="2" align="center">
				<input type="button" id="localCommunityboardWriteBtn" value="이미지등록">
				<input type="reset" value="다시작성">	
			
			</td>
		</tr>
		
	</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/localCommunityboard.js"></script>