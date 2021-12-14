<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="chat.bean.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html ng-app='swankyChat' ng-cloak='true'>
<head>
<meta charset="UTF-8">
<title>애플마켓 쪽지창</title>
<link rel="stylesheet" type="text/css" href="/appleMarket/css/chat.css">
</head>
<body>
<% String chatRoom_id = (String) request.getAttribute("chatRoom_id"); %>
<% String member_id = (String) request.getAttribute("member_id"); %>
<% String user_id = (String) request.getAttribute("user_id"); %>
<% List<ChatRoomDTO> chatRoomDTOlist = (ArrayList<ChatRoomDTO>) request.getAttribute("chatRoomDTOlist");
System.out.println("chatRoomDTOlist.size : "+chatRoomDTOlist.size());
%>
<% List<ChatDTO> newPersonalChatHistory = (ArrayList<ChatDTO>) request.getAttribute("newPersonalChatHistory"); 
System.out.println("newPersonalChatHistory.size : "+newPersonalChatHistory.size());
String selectedChatRoom_id = null;
%>

<%--<html ng-app='swankyChat' ng-cloak='true'> --%>
  <div class='container'>
    <div class='inbox'>
      <aside>
      
        <ul ng-controller='chatCtrl as chat'>
         <% for(ChatRoomDTO chatRoomDTO : chatRoomDTOlist){ %>
          <% if(chatRoomDTO.getUser_id().equals(user_id)){ %>
          <% selectedChatRoom_id = chatRoomDTO.getChatRoom_id()+""; %>
         <% System.out.println("selectedChatRoom_id : "+selectedChatRoom_id); %>
             <div ng-repeat='chat in chats'>
               <li ng-click='uid(chat.id)'>
                 <%-- 위에 onclick 에다가 1)js function 이나 2)컨트롤러로 가는 새 메소드 만들고 history 를 불러줘야 한다. 아니면 MQB 프로젝트처럼 display 따로 잡고 돌리기. --%>
                 <img class='avatar' src='../img/rabbit.jpg'>
                 <p class='username'>
                    <%=chatRoomDTO.getMember_id() %>
                    <input type="hidden" id="room_id" name="room_id" value=selectedChatRoom_id/>
                 </p>
               </li>
             </div>
         <% }%>
         <% } %>
        </ul>
         
      </aside>
      <main ng-controller='chatCtrl as chat'>
        <div class='init'>
          <i class='fa fa-inbox'></i>
          <h4>대화를 시작해보세요.</h4>
       <%-- = chatRoom_id --%>
       <%-- = member_id --%>
       </div>
        <div class='loader'>
          <p></p>
          <h4>Loading</h4>
        </div>
        <!-- Set A Ng Repeat For Our Messages || Check To See If Our Value (Which Is Set Via Ng Click) Is Equal To The Id Of The Message List We Want To Show -->
        <div class='message-wrap' ng-repeat='message in chats' ng-show='value == message.id'>
         <!-- Repeat Each Item In The Array Seperately -->
         <%for(ChatDTO chatDTO : newPersonalChatHistory){ %>
        <div class='message' >
            <p><%=chatDTO.getChatContent()%></p>
            <img ng-src="../img/rabbit.jpg";>
          </div>
          <%}%>
        </div>
        <footer>
          <form ng-submit='add()'>
            <input ng-model='text' id='sendMsg' onchange='printMsg()' placeholder='Enter a message' type='text'>
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
//user_id의 chatRoomDTO 들 
$(function(){
	var chatRoom_id = '<c:out value='${chatRoom_id}' />';
	var sale_seq = '<c:out value='${sale_seq}' />';
	var buyerboard_seq = '<c:out value='${buyerboard_seq}' />';
	var member_id = '<c:out value='${member_id}' />';
	var user_id = '<c:out value='${user_id}' />';

	var ctrl_idx = [];
	var ctrl_room = [];
	var ctrl_user = [];
	
	
    alert(user_id);
    $.ajax({
        url: '/appleMarket/chat/chatList',
        type: 'post',
        async: false,
        data: 'user_id='+user_id,
        dataType: 'json',
        success: function(list){
            $.each(list, function(index, chatRoomDTO){
                 ctrl_idx[index] = index;
               ctrl_room[index] = chatRoomDTO.chatRoom_id;
               ctrl_user[index] = chatRoomDTO.member_id;
               console.log(index, ctrl_idx[index], ctrl_room[index], ctrl_user[index]);
               
            });
       },
        error: function(err){
            console.log(err);
        }
    });
});


//Set Up Chat Controller
angular.module("swankyChat", [])
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
         
      }]; //$scope.chats

      function printMsg()  {
            var chatContent = document.getElementById('sendMsg').value;
            console.log(chatContent);
      }

      // Assign Pushed Messages To A User
      $scope.text;
      $scope.add = function() {
            var chatContent = document.getElementById('sendMsg').value;
            console.log(chatContent);
         
       var vlu = $scope.value;
       if($scope.text) {
         $scope.chats[vlu].messages.push(this.text);
         $scope.text = '';
         console.log($scope.chats[vlu]);
 
         $.ajax({
             url: '/appleMarket/chat/insertChat',
             type: 'post',
             data: 'chatRoom_id='+chatRoom_id+'&user_id='+user_id+'&member_id='+member_id+'&sale_seq='+sale_seq+'&buyerboard_seq='+buyerboard_seq+'&chatContent='+chatContent,
             dataType: 'json',
             success: function(data){
                console.log('쪽지 보내기 성공');
             },
             errer: function(err){
                 console.log('쪽지 보내기 실패');
             }
         });
       }// if
      }//scope.add 

      
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
}); //angular.module("swankyChat", []).controller("chatCtrl", function($scope, $timeout, $rootScope)

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