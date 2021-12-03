<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>사과마켓 팔기</title>
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

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="/appleMarket/js/isotope.pkgd.min.js"></script>
    <script src="/appleMarket/js/buyandsell.js"></script>
	<script src="/appleMarket/js/saleboardList.js"></script>

    <!-- bootstrap grid -->
    <link rel="stylesheet" href="/appleMarket/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/appleMarket/css/star-rating.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

    <main class="container">
        <section class="filters">
            <h2 class="hidden">category filter</h2>
            <div class="list_filters">
                <div class="combi_filters">

                    <div class="category_filter" data-filter-group="category">

                        <h3>카테고리</h3>
                        <input type="checkbox" id="sale_category_all" name="sale_category" value="*">
                        <span class="box">box</span>
                        <label for="sale_category_all">All</label>


                        <input type="checkbox" id="tech" name="sale_category" value=".tech" checked>
                        <span class="box">box</span>
                        <label for="tech">디지털기기/생활가전</label>

                        <input type="checkbox" id="furniture" name="sale_category" value=".furniture">
                        <span class="box">box</span>
                        <label for="furniture">가구/인테리어</label>

                        <input type="checkbox" id="baby" name="sale_category" value=".baby">
                        <span class="box">box</span>
                        <label for="baby">유아동</label>

                        <input type="checkbox" id="living" name="sale_category" value=".living">
                        <span class="box">box</span>
                        <label for="living">생활/가공식품</label>
                        
                        <input type="checkbox" id="female" name="sale_category" value=".female">
                        <span class="box">box</span>
                        <label for="female">여성패션/잡화</label>
                        
                        <input type="checkbox" id="male" name="sale_category" value=".male">
                        <span class="box">box</span>
                        <label for="male">남성패션/잡화</label>
                        
                        <input type="checkbox" id="hobby" name="sale_category" value=".hobby">
                        <span class="box">box</span>
                        <label for="hobby">게임/취미</label>
                        
                        <input type="checkbox" id="sports" name="sale_category" value=".sports">
                        <span class="box">box</span>
                        <label for="sports">스포츠/레저</label>
                        
                        <input type="checkbox" id="beauty" name="sale_category" value=".beauty">
                        <span class="box">box</span>
                        <label for="beauty">뷰티/미용</label>
                        
                        <input type="checkbox" id="pet" name="sale_category" value=".pet">
                        <span class="box">box</span>
                        <label for="pet">반려동물용품</label>
                        
                        <input type="checkbox" id="book" name="sale_category" value=".book">
                        <span class="box">box</span>
                        <label for="book">도시/티켓/음반</label>
                        
                        <input type="checkbox" id="etc" name="sale_category" value=".etc">
                        <span class="box">box</span>
                        <label for="etc">기타중고물품</label>

                    </div>
                </div>
            </div>
        </section>
        <section class="new_arrivals">
            <h2 class="content_title"><span>사과마켓</span> 사고/팔고</h2>
            <p class="content_desc">사과마켓은 신뢰할 수 있는 물품들만 제공합니다. </p>
            <ul class="new_arrivals_list row"></ul>
        </section>
       
    </main>
    <footer></footer>
</body>


</html>

