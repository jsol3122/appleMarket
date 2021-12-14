//수정이 필요하지만 일단 잘 작동됨


var nav = $("#nav ul li");
var cont = $("#contents > div");

if($(this.hash).offset()) {
nav.click(function(e) {
    e.preventDefault();
    var target = $(this);
    var index = target.index();
    //alert(index);
    var section = cont.eq(index);
    var offset = section.offset().top;
    //alert(offset);
    $("html,body").animate({ scrollTop: offset }, 600, "easeInOutBack");
});


$(window).scroll(function() {
    var wScroll = $(this).scrollTop();


    if (wScroll >= cont.eq(0).offset().top) {
        nav.removeClass("active");
        nav.eq(0).addClass("active");
    }
    if (wScroll >= cont.eq(1).offset().top) {
        nav.removeClass("active");
        nav.eq(1).addClass("active");
    }
    if (wScroll >= cont.eq(2).offset().top) {
        nav.removeClass("active");
        nav.eq(2).addClass("active");
    }
    if (wScroll >= cont.eq(3).offset().top) {
        nav.removeClass("active");
        nav.eq(3).addClass("active");
    }
    if (wScroll >= cont.eq(4).offset().top) {
        nav.removeClass("active");
        nav.eq(4).addClass("active");
    }
    if (wScroll >= cont.eq(5).offset().top) {
        nav.removeClass("active");
        nav.eq(5).addClass("active");
    }
});


}
$(".ham").click(function() {
    //메뉴를 보여주는 방법
    // $(".menu").css("display","block");
    // $(".menu").show();
    // $(".menu").fadeIn();
    // $(".menu").slideDown();
    // $(".menu").toggle();
    // $(".menu").fadeToggle();
    $(".menu").slideToggle();
});

$(".ham").click(function() {
    $(this).toggleClass("active")
});

/*
$(window).resize(function() {
    var wWidth = $(window).width();
    //화면 크기가 830 이상일 때
    if (wWitdh > 830 && $(".menu").is(";hidden")) {
        $(".menu").removeAttr("style");
    }
});
*/