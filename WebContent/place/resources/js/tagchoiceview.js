//파라메터로 넘어온 지역 class 변경
	function goAreaChoiceView(areacode) {
		selectAllAreaRemove();
		
		$("#arealist li").each(function( index ) {
			if( areacode == $( this ).attr('id') ) {
				$( this ).children().addClass('btn_all_active');
				
				goSigunguListView(areacode, sigunguObj);
			}
		});

	}

	//파라메터로 넘어온 이달의 명소등 class 변경
	function goTopKindChoiceView(tourkind) {
		selectMonthRemove();
		selectAreaRemove();
		selectSigunguRemove();
		selectTagRemove();
		selectListTopRemove();

		$(".tag_menu li").each(function( index ) {
			if( tourkind == $( this ).attr('id') ) {
				$( this ).addClass('blueTxt');
			}
		});
	}

	//파라메터로 넘어온 이달의 축제등 class 변경
	function goMonthChoiceView(month) {
		selectMonthRemove();
		selectListTopRemove();
		
		$("#monthlist li").each(function( index ) {
			if( pad(month,2) == $( this ).attr('id') ) {
				$( this ).addClass('active');
			}
		});
	}

	//홍보배너가져오기
	function getMarketing(kind) {
		
		var pdata =
        {
				cmd : 'MARKETING_VIEW',
				kind : kind+''
        }
    	var obj_st=JSON.stringify(pdata);


		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				goMarketingView(data,kind);
			},
			complete: function() {
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
		
	}

	
	function selectMonthRemove() {
		$("#monthlist li button").each(function( index ) {
			$( this ).removeClass('active');
		});
	}

	function selectAllMonthRemove() {
		$("#monthlist li button").each(function( index ) {
			$( this ).removeClass('btn_all_active');
		});
	}

	function selectAreaRemove() {
		$("#arealist li button").each(function( index ) {
			$( this ).removeClass('btn_all_active');
			//if( $(this).parents().attr('id') == 'All' ) $(this).addClass('btn_all_active');
		});
	}
	

	function selectAllAreaRemove() {
		$("#arealist li button").each(function( index ) {
			$( this ).removeClass('btn_all_active');
		});
	}

	function selectSigunguRemove() {
		$("#sigungulist li button").each(function( index ) {
			$( this ).removeClass('active');
			//if( $(this).parents().attr('id') == 'All' ) $(this).addClass('btn_all_active');
		});
	}	

	function selectAllSigunguRemove() {
		$("#sigungulist li button").each(function( index ) {
			$( this ).removeClass('btn_all_active');
		});
	}

	function selectTagRemove() {
		$("#taglist li button").each(function( index ) {
			$( this ).removeClass('active');
		});
	}	
	
	function selectListTopRemove() {
		$(".tag_menu li button").each(function( index ) {
			$( this ).removeClass('active');
		});
		$(".tit_cont h2").text('');
	}	

	function selectBfreeKindRemove() {
		$(".tag_menu li").each(function( index ) {
			$(this).removeClass('on');
		});
		var $viewList = $('.tag_menu_viewlist');
		$(".tag_menu_viewlist li").remove();
		$viewList.slideUp(500);
	}	
	
	function selectBfreeTourKindRemove() {
		$(".tag_list2 li .btn").each(function( index ) {
			$(this).removeClass("active");
		});
	}

