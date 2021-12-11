<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" media="all" href="https://d1unjqcospf8gs.cloudfront.net/assets/home/users/show-55066fc73da845f2ada2fc34ec3657a030b59f3c236bd32c414ed74bbcbb8699.css" />
      <script src="https://d1unjqcospf8gs.cloudfront.net/assets/home/users/show-1fd3ee71d0a705c147acdd56af6f8467080b112679ac3b813dcd40daaf3a1921.js"></script>
 
 <section id="content">
    <section id="user-profile">
      <h2 id="nickname">
        <span id="nickname_member_id">${sessionScope.login_info.member_id}</span>
        <span id="region_name"></span>
      </h2>
      <ul id="profile-detail">
        <li class="profile-detail-title">매너온도 <span class="profile-detail-count"></span></li>
      </ul>
      <div id="profile-image">
        <img alt="당근이" src="https://dnvefa72aowie.cloudfront.net/origin/profile/202109/23D6FCD4F145019383458B90F66961C9E8AD8DFA8122229A084C2DAA4507023E.jpg?q=82&amp;s=80x80&amp;t=crop" />
      </div>
    </section>

    <div id="user-records-detail">
      <section id="user-filter">
    <ul>
      <li><a class="active" href="/u/bdWKV03NAvZy1zjP">찜목록</a></li>
    </ul>
</section>
</div>
</section>

<section id="user-records" class="user-articles" data-total-page="1" data-current-page="1">
    <h3 class="hide">${sessionScope.login_info.member_id}님의 판매 물품 목록</h3>
      <section class="cards-wrap">
        <article class="card ">
        <section class="cards-wrap">
        <article class="card ">
  <a class="card-link " data-event-label="325118947" href="/articles/325118947">
    <div class="card-photo">
        <img alt="12월 나눔의 날, 추운 겨울이 무색해질 정도로 마음이 따듯해진 나눔 사연을 전해요💌" src="https://dnvefa72aowie.cloudfront.net/origin/article/202112/29e05b9ae2a196bd47c209ff63270c95d2055ffd63dc14cd03ef34c669cd1ea9.png?q=82&amp;s=300x300&amp;t=crop" />
    </div>
    <div class="card-desc">
      <h2 class="card-title">12월 나눔의 날, 추운 겨울이 무색해질 정도로 마음이 따듯해진 나눔 사연을 전해요💌</h2>
      <div class="card-price ">
        나눔
      </div>
      <div class="card-region-name">
           당근마켓
      </div>
   
    </div>
</a></article>
</section>
</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/profile.js"></script>
</body>
</html>

