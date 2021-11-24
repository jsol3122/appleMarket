<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
동네 설정 (쟈스로 처리)


카테고리 (MAPPER select 문으로 처리)

글 검색 (쟈스로 처리? or 검색 리스트 받아와서 새 창 띄워야 함)

무한 스크롤 할거면 글쓰기 버튼이 위에 있거나 아니면 하단에 안 움직이는 바를 만들어야 할 듯?

   <section id="productsBox">
        <div class="inner">
            <h1>사과마켓 인기 매물</h1>
            <article>
                <a href=""> 
                <!-- 여기롤 seq param 값으로 걸어야 한다. 
                	그 다음에 json 으로 데이터 받아와서 여기에 뿌리는데 어케할지?
                	단위가 article 이다. article 마다 데이터를 뿌려줘야함.
                --> 
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



<p><a href="/jihyun/saleboard/saleboardView">글 클릭 (view로 이동)</a></p>

<p><a href="/jihyun/saleboard/saleboardWriteForm">글 쓰기 (writeForm으로 이동 ) </a></p>
</body>
</html>