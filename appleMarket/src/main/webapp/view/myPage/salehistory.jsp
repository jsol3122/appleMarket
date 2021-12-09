 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <script src="/appleMarket/js/salehistory.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <!-- 구매내역 -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/appleMarket/css/buystyle/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/appleMarket/css/buystyle/plugins/bootstrap/css/bootstrap-slider.css">
    <!-- Font Awesome -->
    <link href="/appleMarket/css/buystyle/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- CUSTOM CSS -->
    <link rel="stylesheet" href="/appleMarket/css/buysalehistory.css">
    <link rel="stylesheet" href="/appleMarket/css/comboard.css">
    <title>사고팔고마켓</title>
</head>
 
   <section class="dashboard section" style="padding-top: 0px;">
     <!-- Container Start -->
     <div class="container">
         <!-- Row Start -->
         <div class="row">
             <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-0">
                 <!-- Recently Favorited -->
                 <div class="widget dashboard-container my-adslist" style="width: 610px;">
                     <h3 class="widget-header">판매내역</h3>
                     <table class="table table-responsive product-dashboard-table">
                         <thead>
                             <tr>
                                 <th>물품</th>
                                 <th>상세내역</th>
                                 <th class="text-center">거래상태</th>
                                 <th class="text-center">관리</th>
                             </tr>
                         </thead>
                         <tbody>
                             <!-- ajax로 아이디 검색해서 구매내역 띄우기 -->
                                                        
                         </tbody>
                     </table>

                 </div>

                 <!-- pagination -->
                 <form action="./" method="get" class="bd_pg clear"><input type="hidden" name="error_return_url" value="/freebd"><input type="hidden" name="act" value="">
                    <fieldset>
                        <!-- 페이징처리 ajax로 뿌리기 -->
                    </fieldset>
                 </form>
                 <!-- pagination -->

             </div>
         </div>
         <!-- Row End -->
     </div>
     <!-- Container End -->
 </section>