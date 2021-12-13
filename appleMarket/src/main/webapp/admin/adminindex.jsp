<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=5.0">

    <!-- CSS -->
    <link rel="stylesheet" href="/appleMarket/css/adminStyle.css">

    <title>AppleMarket Admin</title>
</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav_admin">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo">AppleMarket</a>
                </div>
                <div class="nav__list">
                	 <a href="/appleMarket/adminNoticeList" class="nav__link active">
                        <ion-icon name="clipboard-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Notice</span>
                    </a>
                    <a href="/appleMarket/adminMemberList" class="nav__link" onclick="refresh()">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Member Manage</span>
                    </a>
                    
                    <a href="/appleMarket/adminWarningList" class="nav__link">
                        <ion-icon name="alert-circle-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Warning</span>
                    </a>
                    
                    <a href="/appleMarket/adminSaleBoardList" class="nav__link">
                        <ion-icon name="cash-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">SaleBoard</span>
                    </a>


                    <a href="/appleMarket/adminBuyerBoardList" class="nav__link">
                        <ion-icon name="wallet-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">BuyerBoard</span>
                    </a>
                    
                    <div href="#" class="nav__link collapse">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">LocalCommunity</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="/appleMarket/adminLocalCommunityList" class="collapse__sublink">board</a>
                            <a href="/appleMarket/adminLocalCommunityCommentList" class="collapse__sublink">comment</a>
                        </ul>
                    </div>
                    
					<div href="#" class="nav__link collapse">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Community</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu">
                            <a href="/appleMarket/adminCommunityBoardList" class="collapse__sublink">board</a>
                            <a href="/appleMarket/adminCommunityCommentList" class="collapse__sublink">comment</a>
                        </ul>
                    </div>
                </div>
                

                <a href="/appleMarket/index" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">AppleMarket</span>
                </a>
            </div>
        </nav>
    </div>

    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
	<script src="/appleMarket/js/adminMain.js"></script>

</body>
</html>