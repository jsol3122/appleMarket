<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
    
    
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>사과마켓 사고</title>
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
    <script type="text/javascript" src="/appleMarket/js/buyerboardList.js"></script>
    <script src="/appleMarket/js/app.js"></script>

    <!-- bootstrap grid -->
    <link rel="stylesheet" href="/appleMarket/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/appleMarket/css/star-rating.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/appleMarket/css/buyandsell.css">
</head>

<body>
 <!-- 상단 -->
<%@include file="/includes/header.jsp" %>
    <main class="container">
        <section class="filters">
            <h2 class="hidden">category filter</h2>
            <div class="list_filters">
                <div class="combi_filters">
                    	<div class="category_filter" data-filter-group="category">
                        <h3>카테고리</h3>                      
                        <input type="checkbox" class="test"id="buyerboard_category_all" name="buyerboard_category" value="*" onclick='getCheckboxValue(event)' autocomplete="off" checked/>
                        <span class="box">box</span>
                        <label for="buyerboard_category_all">All</label>

                        <input type="checkbox" class="test" id="tech" name="buyerboard_category" value="tech" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="tech">디지털기기/생활가전</label>

                        <input type="checkbox" class="test" id="furniture" name="buyerboard_category" value="furniture" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="furniture">가구/인테리어</label>

                        <input type="checkbox" class="test" id="baby" name="buyerboard_category" value="baby" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="baby">유아동</label>

                        <input type="checkbox" class="test" id="living" name="buyerboard_category" value="living" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="living">생활/가공식품</label>
                         </div>
                        <div class="category_filter">
                        <h3></h3>
                        <input type="checkbox" class="test" id="female" name="buyerboard_category" value="female" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="female">여성패션/잡화</label>
                        
                        <input type="checkbox" class="test" id="male" name="buyerboard_category" value="male" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="male">남성패션/잡화</label>
                        
                        <input type="checkbox" class="test" id="hobby" name="buyerboard_category" value="hobby" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="hobby">게임/취미</label>
                        
                        <input type="checkbox" class="test" id="sports" name="buyerboard_category" value="sports" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="sports">스포츠/레저</label>
                         </div>
                        <div class="category_filter">
                        <h3></h3>
                        <input type="checkbox" class="test" id="beauty" name="buyerboard_category" value="beauty" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="beauty">뷰티/미용</label>
                        
                        <input type="checkbox" class="test" id="pet" name="buyerboard_category" value="pet" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="pet">반려동물용품</label>
                        
                        <input type="checkbox" class="test" id="book" name="buyerboard_category" value="book" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="book">도시/티켓/음반</label>
                        
                        <input type="checkbox" class="test" id="etc" name="buyerboard_category" value="etc" onclick='getCheckboxValue(event)' autocomplete="off"/>
                        <span class="box">box</span>
                        <label for="etc">기타중고물품</label>
                        
						<input type="text" id='searchcategory_result'>
						<!-- style="display:none;" -->
						</div>
                    </div>
                </div>
           
        </section>
        <section class="new_arrivals">
            <h2 class="content_title"><span>사과마켓</span> 사고/팔고</h2>
            <p class="content_desc">사과마켓은 신뢰할 수 있는 물품들만 제공합니다. </p>
            <input type="hidden" id="session_id" value="${member_id}" />            
            <input type="button" value="물품등록" class="sbm" id="buyerboardWriteBtn" />
            <ul class="new_arrivals_list row"></ul>
        </section>
    </main>
    <script>


	
	

    </script>
</body>

</html>