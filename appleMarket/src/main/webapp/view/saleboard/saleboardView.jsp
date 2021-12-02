<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>사과마켓 팔기 - 물품</title>
    <meta name="keywords" content="shopping mall, jacket, men, women">
    <meta name="description" content="shop any where for women and men's ware">
    <meta name="robots" content="index, follow">

    <!-- open graph -->
    <meta property="og:title" content="Shopy shop any where" />
    <meta property="og:type" content="website" />
    <meta property="og:description" content="shop any where for women and men's ware" />
    <meta property="og:url" content="http://www.shopy.com" />
    <meta property="og:img" content="http://www.shopy.com/img/logo.png" />

    <!-- fontawesome -->
    <script src="/appleMarket/js/all.min.js"></script>

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="/appleMarket/js/buyandsell.js"></script>
    <script src="/appleMarket/js/saleboardGetView.js"></script>

    <!-- bootstrap grid -->
    <link rel="stylesheet" href="/appleMarket/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/appleMarket/css/star-rating.min.css">
    <link rel="stylesheet" href="/appleMarket/css/buyandsell.css">

</head>

<body>
    <header>
        <nav class="main_navigation">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="gnb">
                        <h1 class="logo"><a href="/appleMarket/index.jsp">Shopy Logo</a></h1>
                        <ul>
                            <li><a href="">사과마켓</a></li>
                            <li><a href="">사고/팔기</a></li>
                            <li><a href="">조잘조잘</a></li>
                            <li><a href="">우리동네</a></li>
                        </ul>
                    </div>
                    <ul class="shopping_nav">
                        <li><span class="search_btn sprites">search</span></li>
                        <li><a href="" class="mypage sprites">mypage</a></li>
                        <li><a href="" class="cart sprites" data-cart="5">cart</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <form action="#" method="get">
            <input type="text">
            <input type="submit" value="검색" class="search_btn sprites">
        </form>
    </header>
    <section class="product_info">
        <h2 class="hidden">product_info</h2>
        <div class="container"> 
            <!-- 상품 상세페이지 ajax로 뜨는 부분 -->
        </div>

    </section>
    <main class="container">
        <section class="new_arrivals">
            <h2 class="content_title"><span>사과마켓</span> 사고/팔고</h2>
            <p class="content_desc">사과마켓은 신뢰할 수 있는 물품들만 제공합니다. </p>
            <ul class="new_arrivals_list row">
                <!-- 구매자의 다른상품 12개 ajax로 띄우기 -->
            </ul>
        </section>

    </main>
    <footer></footer>
</body>

</html>