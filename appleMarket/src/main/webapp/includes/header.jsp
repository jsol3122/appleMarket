<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="headBox">
        <div class="inner">
            <h1>
                <a href="/appleMarket/index"><img class="logo" src="/appleMarket/img/logo-basic.png" alt="사과마켓"></a>
            </h1>
            <form action="#" method="get" class="search_box">
                <fieldset>
                    <legend>검색창</legend>
                    <label class="hidden" for="searchPrd">지역, 상품, 업체등을 검색해보세요.</label>
                    <input type="text" id="searchPrd" name="searchPrd" placeholder="지역, 상품, 업체등을 검색해보세요.">
                    <button type="submit"><i class="fas fa-search"></i><span class="hidden">검색버튼</span></button>
                </fieldset>
            </form>
            <ul class="category">
                <li><a href="#">사고/팔고</a></li>
                <li><a href="#">조잘조잘</a></li>
                <li><a href="#">우리동네</a></li>
                <li><a href="#">문의하기</a></li>
            </ul>
            <c:choose>
            	<c:when test="${not empty sessionScope.login_info}">
		            <ul class="login">
		              <li> ${sessionScope.login_info.member_id}님		            
		               <li><a href="/appleMarket/view/myPage/userupdatapage.jsp">마이페이지</a></li>
		               <li><a href="#" class="logout">로그아웃</a></li><!-- ajax 쓰기..화면넘어가게 하지 않기 위해서 -->
		
		            </ul>
            	</c:when>
            	<c:otherwise>
            		 <ul class="login">
		                <li><a href="/appleMarket/view/user/writeForm.jsp" rel="modal:open">회원가입</a></li>
		                <li><a href="/appleMarket/view/user/loginForm.jsp" rel="modal:open">로그인</a></li>
		
		            </ul>
            	</c:otherwise>  
            </c:choose>
            <!-- <div class="btnbox_search"> 수정해야하지만 일단 잘 돌아감 -->
            <div class="btnbox_search">
                <!-- 캐러셀 -->
                <button type="button"><i class="fas fa-search"></i><span class="hidden">검색창 펼치기</span></button>
            </div>

            <nav id="nav">
                <!-- <h1></h1> -->
                <div class="ham">
                    <span class="bar1"></span>
                    <span class="bar2"></span>
                    <span class="bar3"></span>
                </div>
                <ul class="menu">
                    <li class="active"><a href="#">사고/팔고</a></li>
                    <li><a href="#">조잘조잘</a></li>
                    <li><a href="#">우리동네</a></li>
                    <li><a href="#">문의하기</a></li>
                </ul>
            </nav>

        </div>
    </header>
 <script type="text/javascript">
 /* 로그아웃버튼 클릭  */
$('.logout').click(function(){
	var result = confirm("정말 로그아웃 하시겠습니까?");
	if(result){
		$.ajax({
			url: '/appleMarket/logout',
			type: 'get',
			success:function(){
				alert("로그아웃 하였습니다.");
				 location.href= "/appleMarket/index.jsp";
			},
			error:function(err){
				console.log(err);
			}
		});
	}else{
	    
	}
});
</script>