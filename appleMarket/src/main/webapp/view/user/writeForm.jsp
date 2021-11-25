<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	color : red;
	font-size : 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<form name="writeForm">
		<table id="writeTable" align="center" cellpadding="15">
		<thead>
			<tr style="color:#333; font-size:20pt;">
				<td colspan="2" align="center">회원가입</td>	
			</tr>
			<tr>
			<td colspan="2" align="center">
				<img src="../img/write_step2.PNG" width="500"  alt="회원가입_스탭2"/>
			</td>
			</tr>
		</thead>	
		
		<tbody id="writeTableBody">
		
			<tr>
				<td>&emsp;</td>
			</tr>

			<!-- 아이디  -->
			<tr>
				<td align="left">아이디 <font color="red">*</font></td>
				
				<td>
					<input type="text" name="member_id" id="member_id" size="30" onkeydown="inputIdChk()" style="border : none; border-bottom: 1px solid #999;">&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn" id="writeIdCheckBtn" onclick="checkId()" style=" color: black; background: white; border: 0.1px solid #999;font-size : 8pt;">중복확인</button>
					<div id="writeIdDiv"></div>
					<input type="hidden" id="writeIdDuplication" name="writeIdDuplication" value="idUncheck">
				</td> 
			</tr>
			
			<!-- 비밀번호  -->
			<tr>
				<td align="left">비밀번호 <font color="red">*</font></td>
				<td>
					<input type="password" name="writePwd" size="30" style="border : none; border-bottom: 1px solid #999">
					<div id="writePwdDiv"></div>
				</td>
			</tr>
			
			<!-- 비밀번호 확인  -->
			<tr>
				<td align="left">비밀번호 확인 <font color="red">*</font></td>
				<td>
					<input type="password" name="writeRepwd" size="30" style="border : none; border-bottom: 1px solid #999">
					<div id="writeRepwdDiv"></div>
				</td>
			</tr>
			
			<!-- 휴대폰번호  -->
			<tr>
				<td align="left">휴대폰 번호 <font color="red">*</font></td>
				<td>
					<select name="writeTel1" id="writeTel1"  onkeydown="inputPhoneChk()" style="width: 70px; height : 23px; border : none; border-bottom: 1px solid #999;">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="011">019</option>
					</select>
					<input type="text" name="writeTel2" id="writeTel2" size="7" maxlength="4" onkeydown="inputPhoneChk()" style="border : none; border-bottom: 1px solid #999">
					<input type="text" name="writeTel3" id="writeTel3" size="7" maxlength="4" onkeydown="inputPhoneChk()" style="border : none; border-bottom: 1px solid #999">&nbsp;&nbsp;&nbsp;&nbsp;
 					<button type="button" class="btn" id="writePhoneBtn" onclick="checkPhone()" style=" color: black; background: white; border: 1px solid #999;font-size : 8pt;">휴대폰 중복체크</button> 
					<div id="writePhoneDiv"></div>
					<input type="hidden" id="writePhoneDuplication" name="writePhoneDuplication" value="phoneUnCheck">
				</td>
			</tr>
			
			<!-- 생년월일  -->
			<tr>
				<td align="left">생년월일 <font color="red">*</font></td>
				<td>
					<select name="yy" style="width: 80px; border : none; border-bottom: 1px solid #999;">
						 <c:forEach var="yy" begin="1950" end="2021" step="1">
							<option value="${yy}">${yy}</option>
						</c:forEach> 
					</select>
			
					<select name="mm" style="width: 80px; border : none; border-bottom: 1px solid #999;">
						 <c:forEach var="mm" begin="1" end="12" step="1">
							<option value="${mm}">${mm}</option>
						</c:forEach> 
					</select>
					
					<select name="dd" style="width: 80px; border : none; border-bottom: 1px solid #999;">
						 <c:forEach var="dd" begin="1" end="31" step="1">
							<option value="${dd}">${dd}</option>
						</c:forEach> 
					</select>
				</td>
				
			</tr>
			
			<!-- 이메일  -->
			<tr>
				<td align="left">이메일 <font color="red">*</font></td>
				<td>
					<input type="text" name="writeEmail1" size="20" style="border : none; border-bottom: 1px solid #999"> 
					@
					<input type="text" name="writeEmail2" size="20" style="border : none; border-bottom: 1px solid #999">
					<div id="writeEmailDiv"></div>
				</td>
			</tr>
			
			<!-- 메일수신여부  -->
			<tr>
				<td align="left">메일수신여부 <font color="red">*</font></td>
				<td>
					<input type="radio" name="writeemailtf" checked/>
					<label for="yes">예</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="writeemailtf">
					<label for="no">아니오</label>
				</td>
			</tr>
			
			<!-- 추천인아이디  -->
			<tr>
				<td align="left">추천인아이디</td>
				<td>
					<input type="text" name="writeRecommenderid" size="30" style="border : none; border-bottom: 1px solid #999">
				</td>
			</tr>
			
			<tr>
				<td>&emsp;</td>
			</tr>
			
			</tbody>
			
			
			<!-- button  -->
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn" id="writeOkBtn" onclick="checkWrite()" style=" color: white; background: #39210D;font-size : 13pt;">회원가입</button>
					<input type="reset" class="btn" value="취  소" id="wrtieCancleBtn" style=" color: white; background: #39210D;font-size : 13pt;" >
				</td>
			</tr>
			
			<tr>
				<td>&emsp;</td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/user.js"></script>
</body>
</html>