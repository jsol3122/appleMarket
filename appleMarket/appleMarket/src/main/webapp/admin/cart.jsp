<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>20,30대 여성 대표쇼핑몰 레디언트</title>

<link rel="stylesheet" href="/radiant/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/radiant/css/radiant_Main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script type="text/javascript" src="/radiant/js/member.js"></script>
<script type="text/javascript" src="/radiant/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/radiant/js/cart.js"></script>

<style type="text/css">
#cart_order, #cart_delete, #cart_clean, #cart_like, #count_plus, #count_minus{
	color: black; 
	background: white; 
	border: 0.1px solid #999;
	font-size : 10pt;
}
#topline{
	border-bottom :1px solid #e6e6e6;
	padding : 16px 0px 15px;
	height : 70px;
}
#bottomline{
	border-bottom :1px solid #e6e6e6;
	height : 15%;
}
.cart{
	border-top :1px solid #e6e6e6;
	width : 75%;
	height :70%;
	padding : 16px 0px 15px;
	margin : 20px  0px;
	float: left;
}
.checkAllBtn{
	padding : 0px 0px 10px
}
.footBtwrap clearfix{
	padding : -20px -10px -10px;
}
.box{
	width :20%;
	float: right;
	padding : 0px 0px 15px;
}
#use_account{
	color: red;
}
#free-id{
	font-size: 10pt;
	color:#888888;
	align : center;
}
#free-id span{
	color: black;
}

#cart_all_order{
	align : center;
	color: white; 
	background: #39210D; 
	border: 0.1px solid #999;
	font-size : 13pt;
	width : 100%;
}

</style>
</head>
<body>
   <div id="wrap">
        <div id="header">
            
            <div id="logo">
                <a href="/radiant/main/index.do"><img src="/radiant/img/logo.png" alt="logo"></a>
            </div><!--logo-->
            <div id="icon">
                <a href="/radiant/main/index.do"><img src="/radiant/img/icon.png" alt="icon"></a>
            </div>
            <div id="headNav">
                <ul>
                	<c:if test="${sessionScope.memId == null}">
                    	<li><a href="/radiant/member/loginForm.do">로그인</a></li>
                    	<li><a href="/radiant/member/write_agree.do">회원가입</a></li>
                    </c:if>
                    <c:if test="${sessionScope.memId != null }">
                    	<li>${sessionScope.memName }님 로그인</li>
                    	<li><a href="/radiant/member/logout.do">로그아웃</a></li>
                    </c:if>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="/radiant/board/qnaList.do?pg=1">고객센터</a></li>
                </ul>
            </div><!--headNav-->
        </div><!--header-->
        <div id="mainNav">
            <ul>
                <li>
                    <div id="menu">
                        <a href="#">
                            <img src="/radiant/img/menu.png" alt="menu">
                        </a>
                    </div>
                </li>
                <li><a href="#">오늘의 할인</a></li>
                <li><a href="#">베스트아이템</a></li>
                <li><a href="#">가을신상15%</a></li>
            </ul>
            <ul>
                <li>
                    <a href="#">원피스</a>
                    <ul class="dropDownMenu">
                        <li><a href="#">이거</a></li>
                        <li><a href="#">하나만</a></li>
                        <li><a href="#">샘플로</a></li>
                        <li><a href="#">해봤어요</a></li>
                    </ul>
                </li>
                <li><a href="#">블라우스</a></li>
                <li><a href="#">아우터</a></li>
                <li><a href="#">니트/티셔츠</a></li>
                <li><a href="#">스커트</a></li>
                <li><a href="#">팬츠</a></li>
                <li><a href="#">주얼리</a></li>
                <li><a href="#">액세서리</a></li>
                <li><a href="#">아슈즈우터</a></li>
                <li><a href="#">가방</a></li>
                <li><a href="#">언더웨어</a></li>
                <li><a href="#">테마룩</a></li>
            </ul>
            <ul>
                <li><a href="#">전체상품보기</a></li>
            </ul>
        </div><!--mainNav-->
        <hr id="mainNavAfter">
        <div id="section">
            <div id="subNav">
     <br><br>           
     
     <p align="center" style="color:#333; font-size:20pt;">장바구니</p><br>
		<p align="center"><img src="../img/cart_img.PNG" width="500" alt="회원가입_스탭2"/></p>
            <ul class="cart_step1">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chkAll" class="chkAll" /> 전체선택
                        </li>
                    </ul>
 
 			<ul	class="table_product">
 				<input type="hidden" id="userid" value="${userid}"/>
 				<form>
 					<table class="cart">
 						<tr align="center" id="topline">
 							<th scope="col" colspan="2" width="550px" >상품정보</th><!--해당 셀이 열을 위한 헤더 셀임을 명시함  -->
 							<th scope="col" width="100px" >색깔</th>
 							<th scope="col" width="150px" >수량</th>
 							<th scope="col" width="256px" >가격</th>
 						</tr>
				<c:set var = "total" value = "0" />
 				<c:forEach var="cartDTO" items="${requestScope.cartlist }">	
 					
					<tr id="bottomline">
						<td width="150px" height="130px"><img src="../img/clothes/${cartDTO.img}" style="width:100px; height:130px;"alt="img"></td>
						<td width="400px"><input type="checkbox" name="checkbox" value="${cartDTO.cart_id }"/><br>${cartDTO.product_name}<br><br>
						</td>
						<td align="center">${cartDTO.color }</td>
						<td id="countline" width="150px" align="center">
							<button class="btn" id="count_minus" type="button" onclick="" >-</button>
							<input type="text" id="count_text" name="ea" size="1" value=${cartDTO.amount } class="form_input" style ="text-align:center; border:none;" readonly>
							<button class="btn" id="count_plus" type="button" onclick="" >+</button>
						</td>
						<td align="center" id="price">${cartDTO.price }</td>
						<td id="delete_img"><img src="../img/delete_img.png" style="width:10px; height:10px;"alt="img"><input type="hidden" class="cart_id" value="${cartDTO.cart_id }"/></td>
					</tr>
					<c:set var= "total" value="${total +(cartDTO.price * cartDTO.amount) }"/>
				</c:forEach>
				<tr>
					<td colspan="2" height="50px">
		 				<button class="btn" id="cart_order" type="button" onclick="" >선택상품 주문</button>
		               	<button class="btn" id="cart_delete" type="button" onclick="deleteValue();" >선택상품 삭제</button>
		               	<button class="btn" id="cart_clean" type="button">장바구니 비우기</button>
		            </td>
               	<tr>
 					</table>
 				</form>	
 			</ul>
 			
 			<ul	class="table_order">
 				<div class="box">
 					<table class="order">
 						<tr>
 							<th height="100px">결제금액</th>
 						</tr>
 						<tr>
 							<td height="50px" width="180px">상품 금액</td><!--해당 셀이 열을 위한 헤더 셀임을 명시함  -->
 							
 							<td align ="right">
 								<span id="total_price">
 								<c:out value="${total}"/>
 								</span>
 								원
 							</td>
 								
 						</tr>
 		
 						<tr>
 							<td height="50px">배송료</td>
 							<td align ="right">
 							  +
 							  <span id="del_account">
								<c:out value="${total >= 80000 || total == 0 ? 0 : 3000}"/>
							  </span>
 							  원
 							</td> 
 						</tr>
 						<tr class="total">
 							<td height="50px">총 결제 금액</td>
 							<td align ="right">
 								<strong id="use_account">
 									<c:out value="${total >= 80000 || total==0 ? total : total+3000}"/>
 								</strong>
 								원
 							</td>
 						</tr>	
 					</table>
 					<hr width="320px" style="vertical-align :middle; margin-top:15px; margin-left: -30px; padding : 15px;">
 					<div id="free-id">
 						<!-- <img src="../img/i.PNG" width="320px" style="vertical-align :middle; margin-top:-3px; margin-left: -30px;"> -->
 						<img src="../img/cart_free_delivery.PNG" style="vertical-align :middle; margin-top:-6px; ">
 						<span>80,000원이상</span>
 						 구매시 
						<span>무료배송</span>
 						 입니다. 
 					</div>
 					<div>
 						<button class="btn"  id ="cart_all_order" type="button" onclick="" >전체상품 주문</button>
 					</div>
 				</div>
 			</ul>

			
            </ul>
            <ul class="footBtwrap clearfix">
                <li>
           
               	</li>
            </ul>
           
           
       
       		<br><br> 
       
          </div><!--subNav-->
        </div><!--section-->
        <hr>
        <div id="footer">
            <div id="footerLeft">
                <p>
                    CUSTOMER CENTER<br>
                    02-1644-3225<br>
                    <br>
                    월~금 : am 11 ~ pm 5&emsp;점심시간 : pm 12 ~ 1<br>
                    (토/일/공휴일은 휴무)<br>
                </p>
            </div><!--footerLeft-->
            <div id="footerRight">
                <p>
                    교환/반품주소지(cj택배이용시) :<br>
                    서울특별시 강남구 강남대로94길 20 삼오빌딩 5-9층<br>
                    교환/반품주소지(타택배이용시) :<br>
                    서울특별시 강남구 강남대로94길 20 삼오빌딩 5-9층<br>
                </p>
            </div><!--footerRight-->
            <div id="footerBottom">
                <ul>
                    <li><a href="#">이용안내</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">파트너쉽</a></li>
                    <li><a href="#">멤버쉽</a></li>
                    <li><a href="#">리크루트</a></li>
                </ul>
                <p>
                    대표 : *** 전화 : 1644-3225 팩스 : 02)2231-4995 주소 : 서울특별시 구로구 구로동 237-14 아뜨랑스<br>
                    통신판매업 신고 : 2015-서울구로-1525 사업자등록번호 : 215-87-38531 [사업자정보확인] 개인정보보호책임자 : 정기열, 윤시영 (radiant@naver.com)<br>
                </p>
            </div>
        </div><!--footer-->
    </div><!--wrap-->
        
</body>
</html>