<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    <script src="https://kit.fontawesome.com/674d94d429.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/x-icon" href="/appleMarket/img/shortcut_icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <link rel="stylesheet" href="/appleMarket/css/style.css">

    <title>사고팔고마켓</title>
</head>
   
    
<header id="headBox">
        <div class="inner">
            <h1>
                <a href="/appleMarket/index"><img class="logo" src="/appleMarket/img/logo-basic.png" alt="사과마켓"></a>
            </h1>
            <form action="#" method="get" class="search_box">
                <fieldset>
                    <legend>검색창</legend>                            
                    <label class="hidden" for="searchPrd"  for="tags">지역, 상품, 업체등을 검색해보세요.</label>
                    <input type="text" class="tags" id="searchPrd" name="searchPrd" placeholder="지역, 상품, 업체등을 검색해보세요.">                      
                    <button type="submit"><i class="fas fa-search"></i><span class="hidden">검색버튼</span></button>
                </fieldset>
            </form>
            <ul class="category">
                <li><a href="/appleMarket/view/buyerboard/buyerboardList.jsp">사고</a></li>
                <li><a href="/appleMarket/view/saleboard/saleboardList.jsp">팔고</a></li>
                <li><a href="/appleMarket/view/communityboard/communityboardList.jsp?pg=1">조잘조잘</a></li>
                <li><a href="/appleMarket/view/localCommunityboard/localCommunityboardList.jsp?pg=1">우리동네</a></li>
            </ul>
         <ul class="login">
            <c:choose>
               <c:when test="${not empty sessionScope.login_info}">
                 
                    <li> ${sessionScope.login_info.member_id}님</li>               
                    <li><a href="/appleMarket/mypageMainForm">마이페이지</a></li>
                    <li><a href="#" class="logout">로그아웃</a></li><!-- ajax 쓰기..화면넘어가게 하지 않기 위해서 -->   
                 
               </c:when>
               <c:when test="${not empty sessionScope.kakaoInfo}">   
                <li> ${member_id}님</li>      
                   <li><a href="/appleMarket/mypageMainForm">마이페이지</a></li>                 
                   <li><a href="https://kauth.kakao.com/oauth/logout?client_id=ab83dfbd7b35d430c0fcb3a8f27f07ed&logout_redirect_uri=http://localhost:8080/appleMarket/logout">로그아웃</a></li>
                    
				<!-- ajax 쓰기..화면넘어가게 하지 않기 위해서 -->          
               </c:when>
               <c:otherwise>
                  
                      <li><a href="/appleMarket/view/user/writeForm.jsp" rel="modal:open">회원가입</a></li>
                      <li><a href="/appleMarket/view/user/loginForm.jsp" rel="modal:open">로그인</a></li>
         
               </c:otherwise>  
            </c:choose>
          </ul>
            <!-- <div class="btnbox_search"> 수정해야하지만 일단 잘 돌아감 -->
          <div class="btnbox_search">
              <!--   캐러셀 -->

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