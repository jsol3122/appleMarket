


<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    <script src="https://kit.fontawesome.com/674d94d429.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/shortcut_icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" href="/appleMarket/css/userupdatapage.css">
    <title>사고팔고마켓</title>
</head>

<body>
<!-- 상단 -->

   
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
                <li><a href="#">조잘조잘</a></li>
                <li><a href="/appleMarket/view/localCommunityboard/localCommunityboardList.jsp?pg=1">우리동네</a></li>
            </ul>
         <ul class="login">
            
            	
		           
		              <li> sangjin님</li>	            
		              <li><a href="/appleMarket/mypageMainForm" class="mypage sprites">마이페이지</a></li>
		              <li><a href="#" class="logout">로그아웃</a></li><!-- ajax 쓰기..화면넘어가게 하지 않기 위해서 -->	
		           
            	
            	
            	  
            
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
    <div class="memberup">
        <div class="main">
            <div class="content">
                <div class="content_resize">
                    <div class="mainbar">
                        <div class="article">
                            <!-- main -->
	                     
			  			
	               			
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <form class="memberuptext" id="userUpdataForm" action="" method="">
                                <h3>회원탈퇴</h3>
                                <hr>
                                <div class="memberupwriteid">
                                    <label>아이디 </label>
                                    <input type="text" name="member_id" id="member_id" placeholder="sangjin" readonly/>
                                </div>
                                <div class="memberupwrite">
                                    <label>비밀번호 </label>
                                    <input type="password" name="member_pwd" id="member_pwd" placeholder="8자 이상의 영문과 숫자를 조합" />
                                </div>
                                <div class="memberupwrite">
                                    <label>비밀번호확인 </label>
                                    <input type="password" name="member_rePwd" id="member_rePwd" placeholder="비밀번호를 한번 더 입력해주세요" />
                                </div>
                                <input type="button" value="탈퇴하기" id="writeBtn" class="sbm" />
                            </form>
                            
                            
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$('#writeBtn').click(function(){
	var pwd_valid = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,30}$/;
	
	userUpdataForm.querySelector('#member_pwd').placeholder = '8자 이상의 영문과 숫자를 조합';
	userUpdataForm.querySelector('#member_pwd').classList.remove("placeholderColor");
	
	if(!pwd_valid.test(userUpdataForm.querySelector('#member_pwd').value)){
		userUpdataForm.querySelector("#member_pwd").value = '';
		userUpdataForm.querySelector("#member_pwd").placeholder = "비밀번호는 문자와 숫자를 혼용하여 8자 이상 입력해주세요";
		userUpdataForm.querySelector('#member_pwd').classList.add("placeholderColor");
	}else if(userUpdataForm.querySelector("#member_pwd").value != userUpdataForm.querySelector("#member_rePwd").value){
		userUpdataForm.querySelector("#member_rePwd").value = '';
		userUpdataForm.querySelector('#member_rePwd').placeholder = "동일한 비밀번호를 입력해주세요";
		userUpdataForm.querySelector('#member_rePwd').classList.add("placeholderColor");
	}else{
		var result = confirm("정말 탈퇴 하시겠습니까?");
		if(result){
		$.ajax({
			url:'/appleMarket/delete',
			type:'post',
			data:'member_id='+$('#member_id').val()+'&member_pwd='+$('#member_pwd').val(),
			success: function(){			
				alert('탈퇴를 완료하였습니다. 사과마켓을 이용해주세서 감사합니다.');
				window.location.href="/appleMarket/index";
			},
			error:function(err){
				console.log(err)
				}
			});
		}
	}
});
                   
     
	               			
                        </div>
                    </div>
	                    <!-- sidebar -->
	                  
     
  <div class="sidebar">
        <div class="clr"></div>
	        <div class="gadget">
		        <h2 class="star"><span>마이페이지</span></h2>
			        <div class="clr"></div>
				        <ul class="sb_menu">
				        <li><a href="/appleMarket/modifyForm">회원정보수정</a></li>
				        <li><a href="/appleMarket/changePwdForm">비밀번호변경</a></li>
				        <li><a href="/appleMarket/deleteForm">회원탈퇴</a></li>      
				     	</ul>
			        </div>
	</div>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </div>
 <!--하단  -->

 <footer id="footBox">
        <h1 class="hidden">사과마켓 하단 정보</h1>
        <ul id="inb">
            <li><a href="">이용약관</a></li>
            <li><a href="">개인정보처리방침</a></li>
            <li><a href="">위치기반서비스 이용약관</a></li>
            <li><a href="">광고주센터</a></li>
            <li><a href="">ABOUT US</a></li>
        </ul>
        <ul class="addresss_list">
            <li>사업자 등록번호 : XXX-XX-XXXXX</li>
            <li>서울 강남구 강남대로94길 20 삼오빌딩 903호</li>
            <li>
                <p>고객문의 : <a href="mailto:xx@xxxxxxx.com">cs@xxxxxxx.com</a></p>
                <p>제휴문의 : <a href="mailto:xx@xxxxxxx.com">contact@xxxxxxx.com</a></p>
            </li>
        </ul>
        <p>(주)사과마켓 대표 전진솔, 이지현, 유혜림, 김현정, 맹주혁, 이상진</p>
        <small class="copyright">
            Copyright &copy; Apple Market Inc. All rights reserved.
        </small>
        <ul class="sns_list">
            <li><a href=""><i class="fab fa-facebook-square"></i><span class="hidden">페이스북</span></a></li>
            <li><a href=""><i class="fab fa-instagram"></i><span class="hidden">인스타그램</span></a></li>
            <li><a href=""><i class="fas fa-blog"></i><span class="hidden">블로그</span></a></li>
        </ul>
    </footer>
    <!--챗봇-채널톡  -->
  <script>
        (function() {
            var w = window;
            if (w.ChannelIO) {
                return (window.console.error || window.console.log || function() {})('ChannelIO script included twice.');
            }
            var ch = function() {
                ch.c(arguments);
            };
            ch.q = [];
            ch.c = function(args) {
                ch.q.push(args);
            };
            w.ChannelIO = ch;

            function l() {
                if (w.ChannelIOInitialized) {
                    return;
                }
                w.ChannelIOInitialized = true;
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
                s.charset = 'UTF-8';
                var x = document.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
            }
            if (document.readyState === 'complete') {
                l();
            } else if (window.attachEvent) {
                window.attachEvent('onload', l);
            } else {
                window.addEventListener('DOMContentLoaded', l, false);
                window.addEventListener('load', l, false);
            }
        })();
        ChannelIO('boot', {
            "pluginKey": "8f477d11-b3a5-4a18-9f84-31eeb55cd47e"
        });
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="/appleMarket/js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/appleMarket/js/user.js"></script>

</body>
</html>