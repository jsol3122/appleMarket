<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>사과마켓 사고/팔기 - 물품</title>
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
    <script src="js/all.min.js"></script>

    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="js/main.js"></script>

    <!-- bootstrap grid -->
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/star-rating.min.css">
    <link rel="stylesheet" href="css/main.css">

</head>

<body>
    <header>
        <nav class="main_navigation">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="gnb">
                        <h1 class="logo"><a href="index.html">Shopy Logo</a></h1>
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
            <div class="row">
                <div class="product_pictures col-md-5">
                    <img src="img/에어팟1-1.jpg" style="width: 300px; height: 245px;" alt="coat" class="big_img">
                    <ul class="thumb_img">
                        <li class="active"><img src="img/에어팟1-1.jpg" style="width: 30px; height: 57px;" data-target="에어팟1-1.jpg" alt=""></li>
                        <li><img src="img/에어팟1-2.jpg" style="width: 30px; height: 57px;" data-target="에어팟1-2.jpg" alt=""></li>
                        <li><img src="img/에어팟1-3.jpg" style="width: 30px; height: 57px;" data-target="에어팟1-3.jpg" alt=""></li>
                    </ul>
                </div>
                <div class="droduct_specs jumbotron col-md-7">
                    <h2>에어팟 싸게 팔아요~(팔기)</h2>
                    <h3>서울시 종로구 사직동</h3>
                    <p>사용한지 반년은 넘었지만 아직 멀쩡합니다! 샀을때 모든 물품은 그대로 다 들어있습니다(귀보호는 다 사용함) 택배나 가격 흥정은 사절입니다. 직거래로만 거래 합니다. (010-****-****)</p>
                    <form action="">
                        <hr/>
                        <div class="option row justify-content-between">
                            <div class="size">
                                <h4>사과사과사과(아이디 or 닉네임)</h4>
                            </div>
                            <span class="divider">|</span>
                        </div>
                        <hr/>
                        <div class="option order_summary row justify-content-between">
                            <div class="total_price">
                                <h4>가격</h4>
                                <span class="price">110000원</span>
                            </div>
                            <div class="order_now">
                                <ul>
                                    <li><a href="" class="sprites addcart">addcart</a></li>
                                </ul>
                                <button type="submit">채팅하기</button>
                            </div>
                        </div>
                    </form>


                </div>
            </div>
        </div>

    </section>
    <main class="container">
        <section class="new_arrivals">
            <h2 class="content_title"><span>사과마켓</span> 사고/팔고</h2>
            <p class="content_desc">사과마켓은 신뢰할 수 있는 물품들만 제공합니다. </p>
            <ul class="new_arrivals_list row">
                <li id="product_02" class="col-md-3 small reebok">
                    <div class="list_contents">
                        <div class="default">
                            <a href="details.html"><img src="img/에어팟1-1.jpg" style="width: 200px; height: 180px;" alt="jacket"></a>
                            <a href="details.html">
                                <h3>에어팟 싸게 팔아요~(팔기)</h3>
                                <h3>서울시 종로구 사직동</h3>
                                <h4>11만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_03" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_04" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_05" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_02" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_03" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_04" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_05" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_02" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_03" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_04" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_05" class="col-md-3 xlarge addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1300000만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
            <button><span class="sprites load_more">Load more</span></button>
        </section>

    </main>
    <footer></footer>
</body>

</html>