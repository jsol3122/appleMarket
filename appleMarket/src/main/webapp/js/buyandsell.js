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


    // init Isotope
    var $filters = $('.combi_filters input');
    var filters = {};

    var $grid = $('.new_arrivals_list').isotope({
        itemSelector: '.new_arrivals_list > li'
    });
    

   $filters.click(function() {
        var $button = $(this);

        //get group key
        var $buttonGroup = $button.parent('div');
        var filterGroup = $buttonGroup.attr('data-filter-group');
  	
        // set filter for grouop
        filters[filterGroup] = $button.val();
	    var filterValue = concatValues(filters);
        // combine filters
        // set filter for Isotope
        $grid.isotope({ filter: filterValue });
        $grid.isotope( 'updateSortData', filterValue);

        if ($button.val() == '*') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(0).prop('checked', false);
        }

        if ($button.val() == '디지털기기/생활가전') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(1).prop('checked', false);
        }

        if ($button.val() == '가구/인테리어') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(2).prop('checked', false);
        }

        if ($button.val() == '유아동') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(3).prop('checked', false);
        }

        if ($button.val() == '생활/가공식품') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(4).prop('checked', false);
        }

        if ($button.val() == '여성패션/잡화') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(5).prop('checked', false);
        }

        if ($button.val() == '남성패션/잡화') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(6).prop('checked', false);
        }
        
        if ($button.val() == '게임/취미') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(7).prop('checked', false);
        }
        
        if ($button.val() == '스포츠/레저') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(8).prop('checked', false);
        }
        
        if ($button.val() == '뷰티/미용') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(9).prop('checked', false);
        }
        
        if ($button.val() == '반려동물용품') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(10).prop('checked', false);
        }
        
        if ($button.val() == '도시/티켓/음반') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(11).prop('checked', false);
        }
        
        if ($button.val() == '기타중고물품') {
            $button.parent('div').find('input').prop('checked', false);
            $button.prop('checked', true);
        } else {
            $button.parent('div').find('input').eq(12).prop('checked', false);
        }
        
        }); //filter click
        
         

   

    // flatten object by concatting values
    function concatValues(obj){
        var value = '';
        for (var list in obj) {
            value += obj[list];
        }
        console.log("value"+value);
        return value;
    }

}); //document ready function
