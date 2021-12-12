<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<%--<html> --%>
<html ng-app='swankyChat' ng-cloak='true'>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Montserrat", sans-serif;
}
  <%--background: linear-gradient(180deg, #2EC4B6, #9EB1E9);--%>
html, body {
  background: linear-gradient(180deg, #FAAC58, #F6CECE);
  overflow-x: hidden;
}

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.inbox {
  background: #FA8258;
  width: 650px;
  height: 450px;
  display: flex;
  border-radius: 4px;
}
.inbox aside {
  background: #FA8258;
  flex: 1 1 auto;
  height: 100%;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.inbox aside .avatar {
  width: 30px;
  height: 30px;
  border: 2px solid #FFF;
  border-radius: 100%;
}
.inbox aside li {
  background: #FA8258;
  list-style: none;
  color: #FFF;
  display: flex;
  justify-content: space-between;
  padding: 0 2em;
  align-items: center;
  height: 5em;
  font-size: 0.8em;
  cursor: pointer;
  border-bottom: 1px solid #4bd5c8;
  border-top-left-radius: 4px;
}
.inbox aside li:hover {
  background: #30ccbe;
}
.inbox main {
  background: #EDF2F4;
  height: 100%;
  flex: 1 1 70%;
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
  transform: scale(1.035);
}
.inbox main .message-wrap {
  height: 88%;
  overflow-y: scroll;
}
.inbox main .message {
  background: #43d3c5;
  width: 70%;
  margin: 1em 6em;
  padding: 1em;
  border-radius: 4px;
  opacity: 1;
  transition: opacity ease-in-out 0.45s;
}
.inbox main .message p {
  font-size: 0.68em;
  color: #FFF;
  font-weight: 300;
}
.inbox main .message img {
  width: 30px;
  height: 30px;
  border-radius: 100%;
  transform: translateX(-70px) translateY(-20px);
  float: left;
}
.inbox main .message:nth-of-type(even) {
  background: #2fc8ba;
  margin: 1em 1em;
}
.inbox main footer {
  position: fixed;
  bottom: 0;
  height: 12%;
  width: 100%;
  display: flex;
  align-items: center;
  border-top: 1px solid #e0e9ec;
}
.inbox main footer input[type=text] {
  border: none;
  background: transparent;
  padding: 0.8em;
  outline: none;
  color: #AAA;
  width: 100%;
}
.inbox main footer input[type=submit] {
  background: #43d3c5;
  color: #FFF;
  width: 17%;
  border-radius: 4px;
  padding: 0.8em;
  margin: 0 1em;
  border: none;
  cursor: pointer;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none;
}
.inbox main footer form {
  width: 100%;
  display: flex;
  justify-content: space-between;
}

.init {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: column wrap;
  height: 100%;
  position: absolute;
  left: 0;
  right: 0;
  z-index: -1;
  text-align: center;
}
.init i {
  font-size: 5em;
  color: #43d3c5;
}
.init h4 {
  margin: 1em auto;
  color: #43d3c5;
}

.loader {
  opacity: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: column wrap;
  height: 100%;
  position: absolute;
  margin: 0 auto;
  left: 0;
  right: 0;
  z-index: -1;
  text-align: center;
}
.loader p {
  background: #43d3c5;
  width: 20px;
  height: 20px;
  border-radius: 100%;
  -webkit-animation: loading 2000ms cubic-bezier(0.47, 0, 0.745, 0.715) infinite;
          animation: loading 2000ms cubic-bezier(0.47, 0, 0.745, 0.715) infinite;
}
.loader p:before {
  content: "";
  background: #43d3c5;
  width: 40px;
  height: 40px;
  opacity: 1;
  display: block;
  transform: translateX(-10px) translateY(-10px);
  border-radius: 100%;
  -webkit-animation: loading 2000ms cubic-bezier(0.47, 0, 0.745, 0.715) infinite;
          animation: loading 2000ms cubic-bezier(0.47, 0, 0.745, 0.715) infinite;
  -webkit-animation-delay: 50ms;
          animation-delay: 50ms;
}
.loader h4 {
  margin: 1em auto;
  color: #43d3c5;
}

@-webkit-keyframes loading {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 0.7;
  }
  100% {
    opacity: 0;
  }
}

@keyframes loading {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 0.7;
  }
  100% {
    opacity: 0;
  }
}
::-webkit-scrollbar {
  width: 0px;
}

::-webkit-scrollbar-track {
  background: transparent;
}

::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.1);
}
</style>
</head>
<body>
<% String chatRoom_id = (String) request.getAttribute("chatRoom_id"); %>
<% String member_id = (String) request.getAttribute("member_id"); %>
<% String user_id = (String) request.getAttribute("user_id"); %>
<%--<html ng-app='swankyChat' ng-cloak='true'> --%>
  <div class='container'>
    <div class='inbox'>
      <aside>
        <ul ng-controller='chatCtrl as chat'>
          <div ng-repeat='chat in chats'>
            <li ng-click='uid(chat.id)'>
              <img class='avatar' src='{{chat.avatar}}'>
              <p class='username'>{{chat.username}}</p>
            </li>
          </div>
        </ul>
      </aside>
      <main ng-controller='chatCtrl as chat'>
        <div class='init'>
          <i class='fa fa-inbox'></i>
          <h4>Choose a conversation from the left</h4>
       <%= chatRoom_id %>
       <%= member_id %>
       </div>
        <div class='loader'>
          <p></p>
          <h4>Loading</h4>
        </div>
        <!-- Set A Ng Repeat For Our Messages || Check To See If Our Value (Which Is Set Via Ng Click) Is Equal To The Id Of The Message List We Want To Show -->
        <div class='message-wrap' ng-repeat='message in chats' ng-show='value == message.id'>
          <!-- Repeat Each Item In The Array Seperately -->
          <div class='message' ng-repeat='i in message.messages track by $index'>
            <p>{{i}}</p>
            <img ng-src='{{message.avatar}}'>
          </div>
        </div>
        <footer>
          <form ng-submit='add()'>
            <input ng-model='text' placeholder='Enter a message' type='text'>
            <input type='submit' value='Send'>
          </form>
        </footer>
      </main>
    </div>
  </div>
  
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var chatRoom_id = '<c:out value='${chatRoom_id}' />';
var sale_seq = '<c:out value='${sale_seq}' />';
var buyerboard_seq = '<c:out value='${buyerboard_seq}' />';
var member_id = '<c:out value='${member_id}' />';
var user_id = '<c:out value='${user_id}' />';

//user_id의 chatRoomDTO 들 
$(function(){
    //var result = get_query(); //result { category: "1060192", } - 의형식으로 추출됨
    alert(user_id);
    $.ajax({
        url: '/appleMarket/chat/chatList',
        type: 'post',
        data: 'user_id='+user_id,
        dataType: 'json',
        success: function(list){
            //let chatRoomDTO = data[0];
            //get_detail(chatRoomDTO);
			
            //var result = chatRoomDTO.json;

            /*
            $.each(list , function(idx, val) {
            console.log(idx + " " + val.chatRoom_id);
            console.log(val.sale_seq[0]);
            });
            */
            $.each(list, function(index, chatRoomDTO){
                //renderList(false, chatRoomDTO);
            	console.log(idx + " " + val.chatRoom_id);
            });
            
            /*    
            // 상세페이지 통해 작성자 id 받아와서 해당하는 글 목록 12개 띄우는 함수
            $.ajax({
                url: '/appleMarket/saleboard/saleboardGetListId',
                type: 'post',
                data: 'member_id='+DTO.member_id+'&sale_seq='+DTO.sale_seq,
                dataType: 'json',
                success: function(list){
                    $.each(list, function(index, DTO){
                        renderList(false, DTO);
                    })
                },
                errer: function(err){
                    console.log('id해당글 12개 불러오기 실패')
                }
            });*/
        },
        error: function(err){
            console.log(err);
        }
    });
});
/*
//리스트 출력 함수
let renderList = function(mode, chatRoomDTO){
	if(DTO.location_dong == undefined){ //임시로 지역 넣어놓고 gps위치 개발하면 위치값 넣어놓기
       DTO.location_dong = '강남구'; 
       //DTO.location1_addr2.replace(/null/g, '');
    }
	
    let category = DTO.sale_category;

    // 리스트 html을 정의
    let html = "<li id=product_"+DTO.sale_seq+">"+
        "<div class=list_contents>"+
            "<div class=default onclick=location.href='/appleMarket/view/saleboard/saleboardView.jsp?sale_seq="+DTO.sale_seq+"'>"+
                //"<img src='/appleMarket/storage/"+DTO.sale_image1+"' style=width:200px;height:180px; alt=img>"+
                "<img src='/appleMarket/storage/"+DTO.sale_image1+"' style=width:200px;height:180px; alt=img>"+
                "<h3>"+DTO.sale_subject+"</h3>"+
                "<h3>"+DTO.location_dong+"</h3>"+
                "<h4>"+DTO.sale_price+"</h4>"+
            "</div>"+
            "<div class=hover>"+
                "<ul>"+
                    "<li><a href='#' class=sprites>addcart</a></li>"+
                "</ul>"+
            "</div>"+
        "</div>"+
    "</li>";
    
    $(".new_arrivals_list").append(html);
    console.log(mode)
    
    $('.hover a').addClass('addcart');
    $('.new_arrivals_list>li').addClass(['col-md-3', category]);
   */
 //==========================   
 /*  
    .controller("chatCtrl", function($scope, $timeout, $rootScope) {
    	$scope.chats = [{
    	 id: index,
    	 username: chatDTO.member_id,
    	 //avatar: //"https://imgflip.com/s/meme/Futurama-Leela.jpg",
    	 avatar: chatDTO.image1 , // 이 부분 sale_seq로 saleboard 에서 가져오는 작업 해줘야 한다.
    	 messages: [
    	// chat/peronalChatHistory 로 뿌려줘야 한다. 
    		 
    	 ]
    	}, {
    	 id: 1,
    	 username: "Bender",
    	 avatar: "http://orig02.deviantart.net/9689/f/2012/027/9/c/mr_bender______classy__by_sgtconker1r-d4nqpzu.png",
    	 messages: [
    	   "Stop! Don't shoot fire stick in space canoe! Cause explosive decompression!",
    	   "Fry! Stay back! He's too powerful! You guys aren't Santa!",
    	   "Hi, I'm a naughty nurse, and I really need someone to talk to. $9.95 a minute",
    	   "Who are you, my warranty?!",
    	   "I will destroy you"
    	 ]
    	}, {
    	 id: 2,
    	 username: "Fry",
    	 avatar: "http://www.wallpaperno.com/thumbnails/detail/20121027/futurama%20fry%201920x1080%20wallpaper_www.wallpaperno.com_68.jpg",
    	 messages: [
    	   "Ooh, name it after me! But I've never been to the moon!",
    	   "You don't know how to do any of those",
    	   "The key to victory is discipline, and that means a well made bed",
    	   "Stop bickering or I'm going to come back there and change your opinions manually",
    	   "Can we have Bender Burgers again"
    	 ]
    	}, {
    	 id: 3,
    	 username: 'Zoidberg',
    	 avatar: "http://images2.fanpop.com/images/photos/3300000/Zoidberg-futurama-3305418-1024-768.jpg",
    	 messages: [
    	   "All I want is to be a monkey of moderate intelligence who wears a suit",
    	   "Oh, I don't have time for this",
    	   "No! The kind with looting and maybe starting a few fires!",
    	   "Now, now. Perfectly symmetrical violence never solved anything",
    	   "Dissect its brain"
    	 ]
    	}];

}	
    */
//alert(chatRoom_id+sale_seq+member_id+user_id);

angular.module("swankyChat", [])

//Set Up Chat Controller
.controller("chatCtrl", function($scope, $timeout, $rootScope) {
$scope.chats = [{
 id: 0,
 username: "Leela",
 avatar: "https://imgflip.com/s/meme/Futurama-Leela.jpg",
 messages: [
   "I can explain. It's very valuable. You won't have time for sleeping, soldier, not with all the bed making you'll be doing",
   "Who am I making this out to? We'll go deliver this crate like professionals, and then we'll go home",
   "No! The cat shelter's on to me. I never loved you",
   "Oh Leela! You're the only person I could turn to",
   "Um, is this the boring, peaceful kind of taking to the streets",
   "That's right, baby. I ain't your loverboy Flexo, the guy you love so much. You even love anyone pretending to be him!"
 ]
}, {
 id: 1,
 username: "Bender",
 avatar: "http://orig02.deviantart.net/9689/f/2012/027/9/c/mr_bender______classy__by_sgtconker1r-d4nqpzu.png",
 messages: [
   "Stop! Don't shoot fire stick in space canoe! Cause explosive decompression!",
   "Fry! Stay back! He's too powerful! You guys aren't Santa!",
   "Hi, I'm a naughty nurse, and I really need someone to talk to. $9.95 a minute",
   "Who are you, my warranty?!",
   "I will destroy you"
 ]
}, {
 id: 2,
 username: "Fry",
 avatar: "http://www.wallpaperno.com/thumbnails/detail/20121027/futurama%20fry%201920x1080%20wallpaper_www.wallpaperno.com_68.jpg",
 messages: [
   "Ooh, name it after me! But I've never been to the moon!",
   "You don't know how to do any of those",
   "The key to victory is discipline, and that means a well made bed",
   "Stop bickering or I'm going to come back there and change your opinions manually",
   "Can we have Bender Burgers again"
 ]
}, {
 id: 3,
 username: 'Zoidberg',
 avatar: "http://images2.fanpop.com/images/photos/3300000/Zoidberg-futurama-3305418-1024-768.jpg",
 messages: [
   "All I want is to be a monkey of moderate intelligence who wears a suit",
   "Oh, I don't have time for this",
   "No! The kind with looting and maybe starting a few fires!",
   "Now, now. Perfectly symmetrical violence never solved anything",
   "Dissect its brain"
 ]
}];

// Assign Pushed Messages To A User
$scope.text;
$scope.add = function() {
 var vlu = $scope.value;
 if($scope.text) {
   $scope.chats[vlu].messages.push(this.text);
   $scope.text = '';
   console.log(vlu);
 /*  
   $.ajax({
       url: '/personalChat/'+chatRoom_id,
       type: 'post',
       data: 'chatRoomd_id='+chatRoom+id'user_id='+user_id+'member_id='+member_id,'chatContent=' + $scope.text,
       dataType: 'json',
       success: function(data){
    	   console.log('보내기 성공');
           })
       },
       errer: function(err){
           console.log('id해당글 12개 불러오기 실패');
       }
   });*/
   
   $.ajax({
       url: '/appleMarket/chat/insertChat',
       type: 'post',
       data: 'chatRoom_id='+chatRoom_id+'&user_id='+user_id+'&member_id='+member_id+'&sale_seq='+sale_seq+'&buyerboard_seq='+buyerboard_seq+'&chatContent='+$scope.text.value,
       dataType: 'json',
       success: function(data){
    	   console.log('보내기 성공');
          
       },
       errer: function(err){
           console.log('id해당글 12개 불러오기 실패');
       }
   });
   
   
 }
}

// Setting The Value Scope Equal To The Chat.id Which Is Retrieved Via Ng Click - We Pass The Chat.id Through The Function
$scope.value;
$scope.uid = function(ix) {
 console.log(ix);

 function ixy() {
   $rootScope.value = ix;
 }
 // Delay Our Scope Change To Create A Smoother Transition
 $timeout(ixy, 750);
}

});

//Animation Styles
$(function() {

var index = 0;

function initScroll() {
 $(".message-wrap").animate({ 
   scrollTop: $("main").height() 
 }, 1000);
}

function scroll() {
 $(".message-wrap").animate({
   scrollTop: 9000
 }, 1000);
}

$("input[type='submit']").click(function() {
 scroll();
});

$("aside").find("li").click(function() {
 initScroll();
 $(".init").animate({
   'opacity': '0'
 }, 500);
});

$("aside").find("li").click(function() {
 if (index == 1) {
   index = 0;
   $(".message-wrap").find(".message").css({
     'opacity': '1'
   });
 } else {
   index = 0;
   $(".message-wrap").find(".message").css({
     'opacity': '0'
   });
   $(".loader").delay(500).animate({
     'opacity': '1'
   });
   setTimeout(function() {
     index = 0;
     $(".message-wrap").find(".message").css({
       'opacity': '1'
     });
     $(".loader").animate({
       'opacity': '0'
     });
   }, 3000)
 }
});
});

</script>
</body>
</html>