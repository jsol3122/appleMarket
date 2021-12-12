
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

<body>
                        <section class="dashboard section" style="padding-top: 0px;">
                            <!-- Container Start -->
                            <div class="container">
                                <!-- Row Start -->
                                <div class="row">
                                    <div class="col-md-10 offset-md-1 col-lg-8 offset-lg-0">
                                        <!-- Recently Favorited -->
                                        <div class="widget dashboard-container my-adslist" style="width: 730px;">
                                            <h3 class="widget-header">구매내역</h3>
                                            <table class="table table-responsive product-dashboard-table">
                                                <thead>
                                                    <tr>
                                                        <th>물품</th>
                                                        <th>상세내역</th>
                                                        <th class="text-center">거래상황</th>
                                                        <th class="text-center">관리</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/에어팟1-3.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">A급 에어팟 싸게 파라요!~~</h3>
                                                            <span class="add-id"><strong>ID:</strong>itgdtd@apple.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/11/08</time> </span>
                                                            <span class="status active"><strong>가격:</strong>110000</span>
                                                            <span class="location"><strong>장소:</strong>서울시 종로구 사직동</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래완료</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래완료</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래중</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래중</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="product-thumb">
                                                            <img width="80px" height="auto" src="/appleMarket/img/자전거1-1.jpg" alt="image description"></td>
                                                        <td class="product-details">
                                                            <h3 class="title">반년쓴 최신 자전거 싸게 팝니다!</h3>
                                                            <span class="add-id"><strong>ID:</strong>abc@aplle.maket</span>
                                                            <span><strong>날짜: </strong><time>2017/10/21</time> </span>
                                                            <span class="status active"><strong>가격:</strong>100000</span>
                                                            <span class="location"><strong>장소:</strong>경기도 안양시 동안구</span>
                                                        </td>
                                                        <td class="product-category"><span class="categories">거래중</span></td>
                                                        <td class="action" data-title="Action">
                                                            <div class="">
                                                                <ul class="list-inline justify-content-center">
                                                                    <li class="list-inline-item">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Delete" class="delete" href="">
                                                                            <i class="fa fa-trash"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>

                                        <!-- pagination -->
                                        <div class="pagination justify-content-center">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                    </li>
                                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                            <span class="sr-only">Next</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                        <!-- pagination -->

                                    </div>
                                </div>
                                <!-- Row End -->
                            </div>
                            <!-- Container End -->
                        </section>
                        <!-- Container End -->
                        <!-- To Top -->
                        <div class="top-to">
                            <a id="top" class="" href="#"><i class="fa fa-angle-up"></i></a>
                        </div>
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
</body>

</html>
