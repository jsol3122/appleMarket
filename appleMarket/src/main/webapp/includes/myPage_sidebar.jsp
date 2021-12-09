<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        	crossorigin="anonymous"> -->
    	<!-- <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet"> -->
     	<!-- <link rel="stylesheet" href="/appleMarket/css/myPage.css"> -->
     </head>
    
   <div class="sidebar">
        <div class="clr"></div>
	        <div class="gadget">
		        <h2 class="star"><span>마이페이지</span></h2>
			        <div class="clr"></div>
				        <ul class="sb_menu">
				        <li><i class="fa fa-shopping-cart"></i><a href="/appleMarket/buyhistory?pg=1">구매내역</a></li>
				        <li><i class="fa fa-shopping-cart"></i><a href="/appleMarket/salehistory?pg=1">판매내역</a></li>
				         <li><a href="/appleMarket/myMap">동네인증</a></li>
				        <li class="sidebar-dropdown">
				            <a href="#">
				              
				              <span>조잘조잘</span>
				              <span class="badge badge-pill badge-danger">3</span>
				            </a>
				            <div class="sidebar-submenu">
				              <ul>
				                <li>
				                  <a href="/appleMarket/communityHistory?pg=1">조잘조잘 글</a>
				                </li>
				                <li>
				                  <a href="/appleMarket/communityCommentHistory?pg=1">조잘조잘 댓글</a>
				                </li>         
				              </ul>
				            </div>
				         </li>
				         <li class="sidebar-dropdown">
				            <a href="#">
				              
				              <span>우리동네이야기</span>
				              <span class="badge badge-pill badge-danger">3</span>
				            </a>
				            <div class="sidebar-submenu">
				              <ul>
				                <li>
				                  <a href="/appleMarket/localCommunityHistory?pg=1">우리동네이야기 글</a>
				                </li>
				                <li>
				                  <a href="/appleMarket/localCommunityCommentHistory?pg=1">우리동네이야기 댓글</a>
				                </li>         
				              </ul>
				            </div>
			          	</li>
				        <li><a href="/appleMarket/recommendForm">친구 초대</a></li>				        
				        <li><a href="/appleMarket/modifyForm">회원정보수정</a></li>	
				        <li><a href="/appleMarket/deleteForm">회원탈퇴</a></li>      
				     	</ul>
			        </div>
		</div>


 <script type="text/javascript">
    jQuery(function ($) {

      $(".sidebar-dropdown > a").click(function() {
      $(".sidebar-submenu").slideUp(200);
	      if (
	        $(this)
	          .parent()
	          .hasClass("active")
	      ) {
	        $(".sidebar-dropdown").removeClass("active");
	        $(this)
	          .parent()
	          .removeClass("active");
	      } else {
	        $(".sidebar-dropdown").removeClass("active");
	        $(this)
	          .next(".sidebar-submenu")
	          .slideDown(200);
	        $(this)
	          .parent()
	          .addClass("active");
	      }
	    });
    $("#close-sidebar").click(function() {
      $(".page-wrapper").removeClass("toggled");
    });
    $("#show-sidebar").click(function() {
      $(".page-wrapper").addClass("toggled");
    });
    
});
 </script>
	       
<!--   <div class="sidebar">
        <div class="clr"></div>
	        <div class="gadget">
		        <h2 class="star"><span>마이페이지</span></h2>
			        <div class="clr"></div>
				        <ul class="sb_menu">
				        <li><a href="/appleMarket/buyhistory?pg=1">구매내역</a></li>
				        <li><a href="/appleMarket/salehistory?pg=1">판매내역</a></li>
				        <li><a href="/appleMarket/myMap">동네인증</a></li>
				        <li><a href="/appleMarket/communityHistory?pg=1">조잘조잘 글</a></li>
				        <li><a href="/appleMarket/communityCommentHistory?pg=1">조잘조잘 댓글</a></li>
				        <li><a href="/appleMarket/localCommunityHistory?pg=1">우리동네이야기 글</a></li>
				        <li><a href="/appleMarket/localCommunityCommentHistory?pg=1">우리동네이야기 댓글</a></li>
				        <li><a href="#">친구 초대</a></li>
				        <li><a href="/appleMarket/modifyForm">회원정보수정</a></li>	
				        <li><a href="/appleMarket/deleteForm">회원탈퇴</a></li>        
				     	</ul>
			        </div>
	</div> -->
