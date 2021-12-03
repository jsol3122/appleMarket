<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>사과마켓 사고/팔기</title>
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

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/main.js"></script>

    <!-- bootstrap grid -->
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/star-rating.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="css/main.css">

</head>

<body>
    <header>
        <nav class="main_navigation">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="gnb">
                        <h1 class="logo"><a href="index.jsp">Shopy Logo</a></h1>
                        <ul>
                            <li><a href="">사과마켓</a></li>
                            <li><a href="">사고/팔기</a></li>
                            <li><a href="">조잘조잘</a></li>
                            <li><a href="">우리동네</a></li>
                        </ul>
                    </div>
                    <ul class="shopping_nav">
                        <input type="text" id="value" placeholder="지역, 상품, 업체등을 검색해보세요.">
                        <li><span class="search_btn sprites">search</span></li>
                        <li><a href="" class="mypage sprites">mypage</a></li>
                        <li><a href="" class="cart sprites" data-cart="5">cart</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <form action="#" method="get">
            <input type="text">
            <input type="button" id="saleboardBtn" value="검색" class="search_btn sprites">
        </form>
    </header>

    <main class="container">
        <section class="filters">
            <h2 class="hidden">category filter</h2>
            <div class="list_filters">
                <div class="combi_filters">
                    <div class="size_filter" data-filter-group="size">
                        <h3>카테고리</h3>
                        <input type="checkbox" id="sizeall" name="size" value="*">
                        <span class="box">box</span>
                        <label for="sizeall">All</label>

                        <input type="checkbox" id="small" name="size" value=".small">
                        <span class="box">box</span>
                        <label for="small">가구</label>

                        <input type="checkbox" id="medium" name="size" value=".medium">
                        <span class="box">box</span>
                        <label for="medium">전자기기</label>

                        <input type="checkbox" id="large" name="size" value=".large">
                        <span class="box">box</span>
                        <label for="large">의류</label>

                        <input type="checkbox" id="xlarge" name="size" value=".xlarge">
                        <span class="box">box</span>
                        <label for="xlarge">기타</label>

                    </div>
                    <div class="brand_filter" data-filter-group="brand">
                        <h3>사고/팔고</h3>
                        <input type="checkbox" id="brandall" name="size" value="*">
                        <span class="box">box</span>
                        <label for="brandall">All</label>

                        <input type="checkbox" id="reebok" name="brand" value=".reebok">
                        <span class="box">box</span>
                        <label for="reebok">팔기</label>

                        <input type="checkbox" id="addidas" name="brand" value=".addidas">
                        <span class="box">box</span>
                        <label for="addidas">사기</label>
                    </div>
                </div>
            </div>
        </section>
        <section class="new_arrivals">
            <h2 class="content_title"><span>사과마켓</span> 사고/팔고</h2>
            <p class="content_desc">사과마켓은 신뢰할 수 있는 물품들만 제공합니다. </p>
            <div id="productsDiv">
            <ul class="new_arrivals_list row">
                <li id="product_02" class="col-md-3 medium reebok">
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
                <li id="product_03" class="col-md-3 medium reebok">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/TV1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>TV 1개월 사용 A급 상태(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>130만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_04" class="col-md-3 medium reebok">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/냉장고1-1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>삼성 SIH-8700 상태최고(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>200만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_05" class="col-md-3 large addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/롱패딩1-1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>이런 롱패딩 사요~(사기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>3만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_02" class="col-md-3 small reebok">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/가구2-1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>가구가구 팔아용~(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>11만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_03" class="col-md-3 medium addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/공기청정기1-1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>이런 공기청정기 사구싶어여ㅠ(사기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>7만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_04" class="col-md-3 xlarge reebok ">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/화분1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>귀요미 화분 싸게넘겨용~(팔기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>1만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_05" class="col-md-3 medium addidas">
                    <div class="list_contents">
                        <div class="default">
                            <img src="img/시계2-1.jpg" style="width: 200px; height: 180px;" alt="jacket">
                            <h3>이런 시계 누가 안파나용?(사기)</h3>
                            <h3>경기도 안양시 동안구</h3>
                            <h4>2만원</h4>
                        </div>
                        <div class="hover">
                            <ul>
                                <li><a href="" class="sprites addcart">addcart</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li id="product_02" class="col-md-3 medium reebok">
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
                <li id="product_03" class="col-md-3 medium reebok">
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
                <li id="product_04" class="col-md-3 medium reebok">
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
                <li id="product_05" class="col-md-3 medium reebok">
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
            </div>
            <button id="load_more"><span class="sprites load_more">Load more</span></button>
        </section>
        <!--
        <section class="hot_deal_banner">
            <h2 class="hidden">Hot deal banner</h2>
        </section>
        <section class="best_sales">
            <h2>Best Sales</h2>
            <div class="rating large star-icon direction-rtl value-3 color-default label-top">
                <div class="label-value">3</div>
                <div class="star-container">
                    <div class="star">
                        <i class="star-empty"></i>
                        <i class="star-half"></i>
                        <i class="star-filled"></i>
                    </div>
                    <div class="star">
                        <i class="star-empty"></i>
                        <i class="star-half"></i>
                        <i class="star-filled"></i>
                    </div>
                    <div class="star">
                        <i class="star-empty"></i>
                        <i class="star-half"></i>
                        <i class="star-filled"></i>
                    </div>
                </div>
            </div>
        </section>
        <section class="newsletter">
            <h2>Rating</h2>
            <form action="" class="rateform">
                <p class="vote">
                    <span data-rate="1">&hearts;</span>
                    <span data-rate="2">&hearts;</span>
                    <span data-rate="3">&hearts;</span>
                    <span data-rate="4">&hearts;</span>
                    <span data-rate="5">&hearts;</span>
                </p>
                <input type="number" name="rate" value="" class="hidden">
                <button type="submit">vote</button>
            </form>
        </section>
        -->
    </main>
    <footer></footer>
</body>
<script type="text/javascript">
function boardPaging(param_pg) {
	location.href = '/appleMarket/saleboard/saleboardList?pg='+param_pg;
}

$(function(){
	$('#saleboardSearchBtn').click(function(){
		$.ajax({
			url: '/appleMarket/saleboard/saleboardSearch',
			type: 'post',
			data: {'value': $('#value').val()},
			success: function(data) {
				console.log(JSON.stringify(data));
				
				if(data == ''){
					$('#productsDiv').text('검색 결과가 없습니다.');
					$('#productsDiv').css('color', 'red');
					$('#productsDiv').css('font-weight', 'bold');
				}else{
					location.href='/appleMarket/saleboard/saleboardSearch';
				}	
			},
			error : function(err){
				console.log(err);
			} 
		});
	});
});


<%-- <div style="width: 750px; text-align: center;">
<%for(int i=1; i <= totalP; i++) {%>
	<%if(pg==i){ //현재 페이지 %>
		[<a id="currentPaging" href="boardWriteList.jsp?pg=<%=i %>"><%=i %></a>]
	[<%=i %>]
	<%}else{ %>
		[<a id="paging" href="boardList.jsp?pg=<%=i %>"><%=i %></a>]
	<%} %>
<%}//for %>

</div> --%>

</script>
</html>