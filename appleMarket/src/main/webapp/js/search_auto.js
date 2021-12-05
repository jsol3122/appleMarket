
  $( function() {
    var availableTags = [
    	   "아이폰",
    	    "아동복",
    	    "옥수동",
    	    "강남구",
    	    "옥길동",
    	    "의자",
    	    "책상",
    	    "비트캠프"
    ];
    $( "#searchPrd" ).autocomplete({
      	source: availableTags
		/* focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
		},
		minLength: 1,// 최소 글자수
		delay: 100,	//autocomplete 딜레이 시간(ms)
		//disabled: true, //자동완성 기능 끄기 */
    });
  });
