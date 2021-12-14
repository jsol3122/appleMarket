<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page import="chat.bean.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<%--<html> --%>
<html ng-app='swankyChat' ng-cloak='true'>
<head>
<meta charset="UTF-8">
<title>애플마켓 쪽지창</title>
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
  border-bottom: 1px solid #EDF2F4
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
<html ng-app='swankyChat' ng-cloak='true'>
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
          <h4>대화를 시작해보세요.</h4>
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
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
angular.module("swankyChat", [])

//Set Up Chat Controller
.controller("chatCtrl", function($scope, $timeout, $rootScope) {
$scope.chats = [{
 id: 0,
 username: "user4",
 avatar: "https://raw.githubusercontent.com/jsol3122/appleMarket/jihyun/appleMarket/src/main/webapp/img/rabbit.jpg",
 messages: [
   "[화이트 삼성 NT500R5H1] 가산동"
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