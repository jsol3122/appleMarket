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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" href="/appleMarket/css/userupdatapage.css">
    <title>사고팔고마켓</title>
</head>
    <style>
    .placeholderColor::-webkit-input-placeholder{
   color: tomato;
   }
    </style>
<body>
<!-- 상단 -->
<%@include file="/includes/header.jsp" %>
    <div class="memberup">
        <div class="main">
            <div class="content">
                <div class="content_resize">
                    <div class="mainbar">
                        <div class="article">
                            <!-- main -->
                        <c:if test="${empty display}">
<<<<<<< HEAD
                      <%@include file="/view/myPage/modifyForm.jsp" %>
=======
                      <form class="memberuptext" id="userUpdataForm" action="" method="">
                      이미지 넣기
                      </form>
>>>>>>> bddeb693c08df341813ea311f5096a39c9367355
                  </c:if >
                    <c:if test="${not empty display}">
                           <jsp:include page="${display }"/>
                        </c:if >   
                        </div>
                    </div>
                       <!-- sidebar -->
                     <%@include file="/includes/myPage_sidebar.jsp" %>
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

</body>
</html>