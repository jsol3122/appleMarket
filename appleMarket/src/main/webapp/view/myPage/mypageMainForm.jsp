<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">

<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    <script src="https://kit.fontawesome.com/674d94d429.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/shortcut_icon.png" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

 <link rel="stylesheet" media="all" href="https://d1unjqcospf8gs.cloudfront.net/assets/home/users/show-55066fc73da845f2ada2fc34ec3657a030b59f3c236bd32c414ed74bbcbb8699.css" />
      <script src="https://d1unjqcospf8gs.cloudfront.net/assets/home/users/show-1fd3ee71d0a705c147acdd56af6f8467080b112679ac3b813dcd40daaf3a1921.js"></script>
<style>
.nav__icon {
    font-size: 1.25rem;
}
</style>
<body>
<!-- 상단 -->
<%@include file="/includes/header.jsp" %>
    <div class="memberup2">
        <div class="main2">
            <div class="content2">
                <div class="content_resize2">
                    <div class="mainbar">
                            <!-- main -->
                        <c:if test="${empty display}">
                     	 <section id="content">
							    <section id="user-profile">
							      <h2 id="nickname">
							        <span id="nickname_member_id">${sessionScope.login_info.member_id}</span>
							        <span id="region_name"></span>
							      </h2>
							      <ul id="profile-detail">
							        <li class="profile-detail-title">매너온도 <span class="profile-detail-count"></span></li>
							      </ul>
							      <div id="profile-image">
							        <img alt="당근이" src="https://dnvefa72aowie.cloudfront.net/origin/profile/202109/23D6FCD4F145019383458B90F66961C9E8AD8DFA8122229A084C2DAA4507023E.jpg?q=82&amp;s=80x80&amp;t=crop" />
							      </div>
							    </section>
							
							    <div id="user-records-detail">
							      <section id="user-filter">
							    <ul>
							      <li><a class="active" href="/u/bdWKV03NAvZy1zjP">관심목록</a></li>
							        <li><a class="" href="/appleMarket/view/myPage/userupdatapage.jsp">마이페이지</a></li>
							    </ul>
							    
							    
							</section>
			
			
<section id="user-records" class="user-articles" data-total-page="1" data-current-page="1">
    <h3 class="hide">${sessionScope.login_info.member_id}님의 판매 물품 목록</h3>
        <section class="cards-wrap">
 

</section>
</section>
</section>
                	 	</c:if >
                    <c:if test="${not empty display}">
                           <jsp:include page="${display }"/>
                            <!-- sidebar -->
                           <%@include file="/includes/myPage_sidebar.jsp" %>
                        </c:if >   
                    </div>
                      
                     
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </div>
 <!--하단  -->
<%@include file="/includes/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<script type="text/javascript" src="/appleMarket/js/profile.js"></script>
</body>
</html>