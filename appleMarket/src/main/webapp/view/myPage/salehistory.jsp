
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
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
<<<<<<< HEAD
        
=======
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="/appleMarket/js/salehistory.js"></script>
        <!-- Channel Plugin Scripts -->
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
>>>>>>> bddeb693c08df341813ea311f5096a39c9367355
        </body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script src="/appleMarket/js/salehistory.js"></script>
        </html>