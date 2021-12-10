$(function() {
    var $searchBtn = $('.shopping_nav .search_btn'),
        $searchForm = $('header form');

    $searchBtn.click(function() {
        $searchForm.toggleClass('active');
    });

    $('.main_slides ul').bxSlider({
        controls: false,
        mode: 'vertical'
    });

    var rateForm = $('.rateform'),
        rateBtn = rateForm.find('.vote span'),
        rateInput = rateForm.find('input');

    rateBtn.click(function() {
        var $this = $(this);
        var rateScore = $this.attr('data-rate');
        rateInput.val(rateScore);
        rateBtn.removeClass('active');

        rateBtn.each(function(idx) {
            if (idx < rateScore) {
                $(this).addClass('active');
            }
        });
    });

    //상품상세 이미지 변경
    var $productPictures = $('.product_pictures'),
        $bigImg = $productPictures.find('.big_img'),
        $thumbImgList = $productPictures.find('.thumb_img li');

    /*
    리스트를 클릭하면 
    클릭한 그 요소의 active 추가한다.
    클릭한 그 요소의 자식요소 img의 data-target속성의 값을 확인해서
    큰 이미지의 경로를 수정해야 한다.        
    */
    $thumbImgList.click(function() {
        $(this).addClass('active').siblings().removeClass('active');
        var targetImgPath = '/appleMarket/img/ware/' + $(this).find('img').attr('data-target');

        $bigImg.attr('src', targetImgPath);
    });

    //상품 수량 가격 변경하기
    var $quantity = $('.quantity'),
        $unitprice = $quantity.attr('data-unitprice'),
        $qtyBtn = $quantity.find('span'),
        $qytInput = $quantity.find('input'),
        $tagetTotal = $('.total_price .price');

    /*
    $qtyBtn클릭하면 그 요소가 class명 plus 있다면
    참이면 (플러스를 클릭했으면)
    $qytInput value 기존값에서 1증가
    거짓이면(마이너스를 클릭했으면)
    $qytInput value 기존값에서 1차감
    */
    $qtyBtn.click(function() {
        var currentCount = $qytInput.val();

        if ($(this).hasClass('plus')) {
            $qytInput.val(++currentCount);
        } else {
            if (currentCount > 1) {
                $qytInput.val(--currentCount);
            }
        }
        //수량*단가 변수 total에 저장하고 그걸 .price 값으로 변경되도록 한다.
        var total = (currentCount * $unitprice).toLocaleString('en');

        $tagetTotal.text(total + '$');

    }); // $qtyBtn.click

    //category filter

   /*

    $(".price_range").slider({
        range: true,
        min: 0,
        max: 1000,
        values: [80, 500],
        create: function(event, ui) {
            var slideVal = $('.price_range span');
            var slideFirstVal = slideVal.filter(':first-of-type');
            var slideLastVal = slideVal.filter(':last-of-type');

            slideVal.html('<i></i>');

            slideFirstVal.find('i').text($(".price_range").slider("values", 0) + '$');
            slideLastVal.find('i').text($(".price_range").slider("values", 1) + '$');
        },
        slide: function(event, ui) { // 값이 바뀔때 마다 할일
            $('#from').val(ui.values[0]);
            $('#to').val(ui.values[1]);

            var slideVal = $('.price_range span');
            var slideFirstVal = slideVal.filter(':first-of-type');
            var slideLastVal = slideVal.filter(':last-of-type');

            slideVal.html('<i></i>');

            slideFirstVal.find('i').text(ui.values[0] + '$');
            slideLastVal.find('i').text(ui.values[1] + '$');
        }
    });
    $('#from').val($(".price_range").slider("values", 0)); //초기값
    $('#to').val($(".price_range").slider("values", 1)); //초기값

    $('#from').change(function() {
        var userValue = $(this).val();
        $(".price_range").slider("values", 0, userValue);

        var slideVal = $('.price_range span');
        var slideFirstVal = slideVal.filter(':first-of-type');
        slideFirstVal.html('<i></i>');
        slideFirstVal.find('i').text(userValue + '$');
    });

    $('#to').change(function() {
        var userValue = $(this).val();
        $(".price_range").slider("values", 1, userValue);

        var slideVal = $('.price_range span');
        var slideLastVal = slideVal.filter(':last-of-type');
        slideLastVal.html('<i></i>');
        slideLastVal.find('i').text(userValue + '$');
    }); */

    /*
    var sizeFilter = $('.size_filter input');
    var targetList = $('.new_arrivals_list li');

    sizeFilter.click(function() {
        var targetValue = [];
        sizeFilter.filter(':checked').each(function() {
            targetValue.push('.' + $(this).val());
        }); //each
        var targetClass = targetValue.join(', ');

        targetList.hide();
        $(targetClass).fadeIn();


    }); //sizeFilter.click --9:13--

    */
    //카테고리
    // init Isotope
    var $filters = $('.category_filter input');
    var filters = {};

    var $grid = $('.new_arrivals_list').isotope({
        itemSelector: '.new_arrivals_list > li',
        stagger: 30
    });

   $filters.click(function() {
        var $button = $(this);

        //get group key
        var $buttonGroup = $button.parent('div');
        var filterGroup = $buttonGroup.attr('data-filter-group');

        // set filter for grouop
        filters[filterGroup] = $button.val();
        // combine filters
        var filterValue = concatValues(filters);
        // set filter for Isotope
        $grid.isotope({ filter: filterValue });
        // $grid.isotope( 'updateSortData', filterValue );

        if ($button.val() == '*') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(0).prop('checked', false);
        }

        if ($button.val() == 'tech') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(1).prop('checked', false);
        }

        if ($button.val() == 'furniture') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(2).prop('checked', false);
        }

        if ($button.val() == 'baby') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(3).prop('checked', false);
        }

        if ($button.val() == 'living') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(4).prop('checked', false);
        }

        if ($button.val() == 'female') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(5).prop('checked', false);
        }

        if ($button.val() == 'male') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(6).prop('checked', false);
        }
        
        if ($button.val() == 'hobby') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(7).prop('checked', false);
        }
        
        if ($button.val() == 'sports') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(8).prop('checked', false);
        }
        
        if ($button.val() == 'beauty') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(9).prop('checked', false);
        }
        
        if ($button.val() == 'pet') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(10).prop('checked', false);
        }
        
        if ($button.val() == 'book') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(11).prop('checked', false);
        }
        
        if ($button.val() == 'etc') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(12).prop('checked', false);
        }

    }); //filter click

    // flatten object by concatting values
    function concatValues(obj) {
        var value = '';
        for (var list in obj) {
            value += obj[list];
        }
        console.log(value);
        return value;
    }




}); //document ready function