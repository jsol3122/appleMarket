<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abel" rel="stylesheet">
    <script src="https://kit.fontawesome.com/674d94d429.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/x-icon" href="/appleMarket/img/shortcut_icon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" href="/appleMarket/css/style.css">
    <title>사고팔고마켓</title>
</head>

<body>
    <header id="headBox">
        <div class="inner">
            <h1>
                <a href="#"><img class="logo" src="/appleMarket/img/logo-basic.png" alt="사과마켓"></a>
            </h1>
            <form action="#" method="get" class="search_box">
                <fieldset>
                    <legend>검색창</legend>
                    <label class="hidden" for="searchPrd">지역, 상품, 업체등을 검색해보세요.</label>
                    <input type="text" id="searchPrd" name="searchPrd" placeholder="지역, 상품, 업체등을 검색해보세요.">
                    <button type="submit"><i class="fas fa-search"></i><span class="hidden">검색버튼</span></button>
                </fieldset>
            </form>
            <ul class="category">
                <li><a href="#">사고</a></li>
                <li><a href="#">팔고</a></li>
                <li><a href="#">우리동네</a></li>
                <li><a href="#">조잘조잘</a></li>
            </ul>
            <ul class="login">
                <li><a href="/appleMarket/view/user/writeForm.jsp" rel="modal:open">회원가입</a></li>
                <li><a href="/appleMarket/view/user/loginForm.jsp" rel="modal:open">로그인</a></li>

            </ul>
            <!-- <div class="btnbox_search"> 수정해야하지만 일단 잘 돌아감 -->
            <div class="btnbox_search">
                <!-- 캐러셀 -->
                <button type="button"><i class="fas fa-search"></i><span class="hidden">검색창 펼치기</span></button>
            </div>

            <nav id="nav">
                <!-- <h1></h1> -->
                <div class="ham">
                    <span class="bar1"></span>
                    <span class="bar2"></span>
                    <span class="bar3"></span>
                </div>
                <ul class="menu">
                    <li class="active"><a href="#">사고/팔고</a></li>
                    <li><a href="#">조잘조잘</a></li>
                    <li><a href="#">우리동네</a></li>
                    <li><a href="#">문의하기</a></li>
                </ul>
            </nav>

        </div>
    </header>

    <section id="visualBox">
        <div class="inner">
            <h1>우리 동네 중고 직거래 마켓</h1>
            <p>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</p>
            <div class="btnbox_down">
                <a href="">사과마켓 물품보러 가기</a>
            </div>
            <div class="visual_img">
                <!-- 앱 미리보기 이미지 -->
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="/appleMarket/img/phone-ee2960c1cbf1e932ac291ad59eacc55ef6dc3cab3e9e4ea4284c4e0256bb9f4c.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/appleMarket/img/environmentday.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/appleMarket/img/applemarketmain1.png" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
                </div>
            </div>
            <article class="rank_box">
                <h2><a href="#">오늘의 인기 검색어</a></h2>
                <ol class="rank_list">
                    <li>
                        <a href="">
                            <p class="keyword">자전거</p>
                            <p class="rank">
                                <span class="hidden">이전 대비 순위</span>
                                <span class="nochange">
                                    <span class="hidden">변동없음</span>
                                </span>
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <p class="keyword">노트북</p>
                            <p class="rank">
                                <span class="hidden">이전 대비 순위</span>
                                <span class="up"><span class="hidden">오름</span></span>
                                <span class="change">1</span>
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <p class="keyword">의자</p>
                            <p class="rank">
                                <span class="hidden">이전 대비 순위</span>
                                <span class="down"><span class="hidden">떨어짐</span></span>
                                <span class="change">1</span>
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <p class="keyword">컴퓨터</p>
                            <p class="rank">
                                <span class="hidden">이전 대비 순위</span>
                                <span class="up"><span class="hidden">오름</span></span>
                                <span class="change">3</span>
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <p class="keyword">냉장고</p>
                            <p class="rank">
                                <span class="hidden">이전 대비 순위</span>
                                <span class="new">NEW</span>
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <p class="keyword">아이패드</p>
                            <p class="rank">
                                <span class="hidden">이전 대비 순위</span>
                                <span class="up"><span class="hidden">오름</span></span>
                                <span class="change">1</span>
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <p class="keyword">자전거</p>
                            <p class="rank">
                                <span class="hidden">이전 대비 순위</span>
                                <span class="down"><span class="hidden">떨어짐</span></span>
                                <span class="change">2</span>
                            </p>
                        </a>
                    </li>
                </ol>
            </article>
        </div>
    </section>
    <section id="hotBox">
        <div class="inner">
            <h1>사과마켓 인기 매물</h1>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목1줄상품 제목1줄상품 제목1줄상품 제목1줄상품 제목1줄</h3>
                        <p class="address">수원시 원천동 영통구 어쩌구 1줄</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article>
                <a href="">
                    <div class="img_prd">
                        <img src="http://placehold.it/224X160" alt="임시 이미지">
                    </div>
                    <div class="prd_information">
                        <h3 class="title">상품 제목(1줄)</h3>
                        <p class="address">수원시 원천동 어쩌고(1줄)</p>
                        <p class="price">1,000원</p>
                        <div class="interaction">
                            <p class="attention">
                                <span>관심 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="comment">
                                <span>댓글 </span>
                                <span class="count">0</span>
                            </p>
                            <p class="chatting">
                                <span>채팅 </span>
                                <span class="count">0</span>
                            </p>
                        </div>
                    </div>
                </a>
            </article>
            <article class="more">
                <a href="">
                    <h3>사과마켓<br>인기 매물<br>더 보기</h3>
                </a>
            </article>
        </div>
    </section>
    <section id="introductionBox">
        <div class="inner">
            <h1>사과마켓은 이런 점이 달라요!</h1>
            <article>
                <div class="icon"></div>
                <h2>동네 인증</h2>
                <p>설정한 동네를 인증한<br>주민만 거래할 수 있어요.</p>
            </article>
            <article>
                <div class="icon"></div>
                <h2>거래 매너 온도</h2>
                <p>거래하기 전, 프로필에 있는<br>매너 온도를 확인해보세요.</p>
            </article>
            <article>
                <div class="icon"></div>
                <h2>1:1 채팅하기</h2>
                <p>거래할 상대방과 부담 없이<br>대화할 수 있어요.</p>
            </article>
            <article>
                <div class="icon"></div>
                <h2>가격 하락 알림</h2>
                <p>관심 게시물의 가격이 떨어지면<br>가격 하락 알림을 받을 수 있어요.</p>
            </article>
            <article>
                <div class="icon"></div>
                <h2>나눔의 날</h2>
                <p>매월 11일, 안쓰는 물건을 나누고<br>이웃과 추억도 공유해보세요.</p>
            </article>
            <article>
                <div class="icon"></div>
                <h2>감사 인사</h2>
                <p>거래 후에는 서로에게<br>감사 인사를 보내보세요.</p>
            </article>
        </div>
    </section>
    <section id="reviewBox">
        <div class="inner">
            <h1>사과마켓 사용자 후기</h1>
            <ul>
                <li>
                    <p class="content">어디 속잎나고, 만천하의 뿐이다. 미인을 대한 작고 위하여서. 몸이 있는 튼튼하며, 장식하는 위하여, 황금시대다. 청춘 굳세게 영원히 보는 밥을 할지라도 그들의 원질이 칼이다. 청춘의 아름답고 그들의 트고, 웅대한 내려온 이것이다.</p>
                    <p class="address">광주 관천동</p>
                </li>
                <li>
                    <p class="content">새 듣기만 석가는 칼이다. 같이, 원대하고, 우리 보는 새 역사를 것이다. 피가 피가 속잎나고, 보라. 작고 수 것은 곧 따뜻한 않는 있는 것이다.보라, 철환하였는가? 길을 뛰노는 예가 청춘은 할지니, 같지 뼈 황금시대를 미인을 있으랴?</p>
                    <p class="address">서울 잠실3동</p>
                </li>
                <li>
                    <p class="content">피부가 크고 얼음 이성은 있을 가슴에 곳이 말이다. 피가 힘차게 대한 위하여, 만물은 자신과 이 봄바람이다. 봄날의 가진 바로 것이다. 튼튼하며, 우리는 부패를 이것이다. 기쁘며, 같이, 그들의 하는 아름답고 때문이다. 방황하여도, 보이는 따뜻한 얼마나 철환하였는가? 청춘의 인간은 얼음 있는 능히 스며들어 피어나기 인생의 모래뿐일 보라.</p>
                    <p class="address">제주 노형동</p>
                </li>
                <li>
                    <p class="content">피부가 아니한 거친 그들의 듣는다. 않는 무엇이 행복스럽고 꾸며 우리 뛰노는 용기가 뿐이다. 얼음에 구하지 무엇을 산야에 용기가 구할 심장은 아름다우냐? 피고, 청춘 목숨이 가는 발휘하기 그들은 예가 꽃이 것이다. 봄날의 할지라도 이는 사람은 우리는 수 위하여서. 할지니, 있는 못할 현저하게 설레는 길지 발휘하기 청춘 그리하였는가?</p>
                    <p class="address">울산 삼산동</p>
                </li>
                <li>
                    <p class="content">온갖 대고, 불어 철환하였는가? 청춘은 이는 대한 피에 사랑의 찬미를 말이다. 돋고, 피고, 그들은 못할 풀이 품으며, 보라. 우리의 풀밭에 것이 인생을 고동을 새 속잎나고, 두기 것이다. 만물은 창공에 어디 청춘에서만 힘있다.</p>
                    <p class="address">광명 철산3동</p>
                </li>
                <li>
                    <p class="content">그와 붙잡아 수 봄바람이다. 심장의 굳세게 설산에서 것이다. 창공에 듣기만 그들을 있으며, 것은 꽃이 얼음 무엇을 같은 그리하였는가? 일월과 듣기만 수 안고, 가치를 칼이다. 석가는 방지하는 물방아 원대하고, 영원히 품고 튼튼하며, 것이다. 위하여 봄바람을 광야에서 약동하다. 튼튼하며, 이상의 봄날의 일월과 투명하되 방황하였으며, 운다.</p>
                    <p class="address">부산 부전제1동</p>
                </li>
                <li>
                    <p class="content">마디씩 무엇인지 이름과, 듯합니다. 별에도 위에도 이름과, 흙으로 잔디가 듯합니다. 강아지, 이 아무 까닭입니다. 계절이 이웃 그리고 못 그리워 가슴속에 있습니다. 프랑시스 옥 차 이름과, 봅니다.</p>
                    <p class="address">분당 정자동</p>
                </li>
                <li>
                    <p class="content">많은 잠, 지나가는 차 하나에 별 까닭입니다. 이름자를 마리아 어머니, 아이들의 토끼, 이국 봅니다. 이런 소학교 차 했던 청춘이 시인의 있습니다. 추억과 북간도에 하나의 하늘에는 내린 않은 겨울이 다 듯합니다. 이름을 벌레는 이국 소녀들의 계십니다. 나는 했던 시와 별 어머님, 것은 쉬이 버리었습니다. 나는 헤일 아름다운 애기 버리었습니다.</p>
                    <p class="address">대전 둔산2동</p>
                </li>
                <li>
                    <p class="content">노루, 계절이 하나에 사람들의 이웃 밤이 이름자를 지나고 까닭입니다. 속의 하나에 이름과, 봅니다. 비둘기, 릴케 밤을 강아지, 다하지 어머님, 봅니다. 못 나의 언덕 마디씩 있습니다. 소녀들의 우는 못 아무 밤이 많은 라이너 있습니다. 이름과, 별 하나에 무성할 있습니다. 불러 하늘에는 파란 별에도 듯합니다.</p>
                    <p class="address">인천 주안2동</p>
                </li>
            </ul>
        </div>
    </section>
    <footer id="footBox">
        <h1 class="hidden">사과마켓 하단 정보</h1>
        <ul id="inb">
            <li><a href="">이용약관</a></li>
            <li><a href="">개인정보처리방침</a></li>
            <li><a href="">위치기반서비스 이용약관</a></li>
            <li><a href="">광고주센터</a></li>
            <li><a href="">ABOUT US</a></li>
        </ul>
        <ul class="addresss_list">
            <li>사업자 등록번호 : XXX-XX-XXXXX</li>
            <li>서울 강남구 강남대로94길 20 삼오빌딩 903호</li>
            <li>
                <p>고객문의 : <a href="mailto:xx@xxxxxxx.com">cs@xxxxxxx.com</a></p>
                <p>제휴문의 : <a href="mailto:xx@xxxxxxx.com">contact@xxxxxxx.com</a></p>
            </li>
        </ul>
        <p>(주)사과마켓 대표 전진솔, 이지현, 유혜림, 김현정, 맹주혁, 이상진</p>
        <small class="copyright">
            Copyright &copy; Apple Market Inc. All rights reserved.
        </small>
        <ul class="sns_list">
            <li><a href=""><i class="fab fa-facebook-square"></i><span class="hidden">페이스북</span></a></li>
            <li><a href=""><i class="fab fa-instagram"></i><span class="hidden">인스타그램</span></a></li>
            <li><a href=""><i class="fas fa-blog"></i><span class="hidden">블로그</span></a></li>
        </ul>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="/appleMarket/js/app.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/appleMarket/js/user.js"></script>

<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
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
<!-- End Channel Plugin -->
</body>
</html>