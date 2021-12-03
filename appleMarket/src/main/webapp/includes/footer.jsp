<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!--챗봇-채널톡  -->
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