<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        	crossorigin="anonymous"> -->
    	<!-- <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet"> -->
     	<!-- <link rel="stylesheet" href="/appleMarket/css/myPage.css"> -->
     	
     	<style type="text/css">
     	/* COLLAPSE */
		.collapse {
		    grid-template-columns: 20px max-content 1fr;
		}
		
		.collapse__link {
		    justify-self: flex-end;
		    transition: .5;
		}
		
		.collapse__menu {
		    display: none;
		    padding: .2rem 2.25rem;
		}
		
		.collapse__sublink {
		    color: var(--sub-color);
		    font-size: var(--small-font-size);
		}
		
		.collapse__sublink:hover {
		    color: var(--white-color);
		}
		
		/* Show collapse */
		.showCollapse {
		    display: block;
		}
		
		/* Rotate icon */
		.rotate {
		    transform: rotate(180deg);
		    transition: .5s;
		}
     	</style>

     </head>
   
   <div class="sidebar">
        <div class="clr"></div>
	        <div class="gadget">
		        <h2 class="star"><span>마이페이지</span></h2>
			        <div class="clr"></div>
				        <ul class="sb_menu">
				        <li><a href="/appleMarket/buyhistory?pg=1">구매내역</a></li>
				        <li><a href="/appleMarket/salehistory?pg=1">판매내역</a></li>
				         <li><a href="/appleMarket/myMap">동네인증</a></li>
				        <li class="sidebar-dropdown">
				              <span class="nav_name">조잘조잘</span>
				              <ion-icon name="chevron-down-outline" class="collapse__link" style="color:#df4b49;"></ion-icon>
				              <ul class="collapse__menu">
				                  <li><a href="/appleMarket/communityHistory?pg=1" class="collapse__sublink">조잘조잘 글</a></li>				              
				                  <li><a href="/appleMarket/communityCommentHistory?pg=1" class="collapse__sublink">조잘조잘 댓글</a></li>				                        
				              </ul>
				         </li>
				         <li class="sidebar-dropdown">
				              <span class="nav_name">우리동네이야기</span>
				              <ion-icon name="chevron-down-outline" class="collapse__link" style="color:#df4b49;"></ion-icon>			          
				              <ul class="collapse__menu">				 
				               	  <li><a href="/appleMarket/localCommunityHistory?pg=1" class="collapse__sublink">우리동네이야기 글</a></li> 
				                  <li><a href="/appleMarket/localCommunityCommentHistory?pg=1" class="collapse__sublink">우리동네이야기 댓글</a></li>				                        
				              </ul>
			          	</li>
				        <li><a href="/appleMarket/recommendForm">친구 초대</a></li>				        
				        <li><a href="/appleMarket/modifyForm">회원정보수정</a></li>	
				        <li><a href="/appleMarket/deleteForm">회원탈퇴</a></li>      
				     	</ul>
			        </div>
		</div>

  <!-- IONICONS -->
 <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
 <script type="text/javascript">
 /* COLLAPSE MENU */
 const linkCollapse = document.getElementsByClassName('collapse__link')
 var i

 for(i=0;i<linkCollapse.length;i++) {
     linkCollapse[i].addEventListener('click', function(){
         const collapseMenu = this.nextElementSibling
         
         collapseMenu.classList.toggle('showCollapse')
		
         const rotate = collapseMenu.previousElementSibling
         rotate.classList.toggle('rotate')
     });
 }
 </script>
 

