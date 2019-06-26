//taglist 가져오기
	function getMainTag(kind,callkind) {
		
		var pdata =
        {
				cmd : 'MAIN_TAG_VIEW',
				kind : kind+''
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				if( callkind == 'allMain' ) {
					goAllMainTagListView(kind,data);
				} else  if( callkind == 'main') {
					goMainTagListView(kind,data);
				} else {
					goTagListView(kind, data);
				}
			},
			complete: function() {
				//if( callkind == 'main') {
					//if( $('.area_tagTop ul').height() > 60 ) {
					//	tagheight = $('.area_tagTop ul').height();
					//	TagAreaResize(tagareaheight);
					//} else {
						$('#tagBtnMore').hide();
					//}
				//} 
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}
	
	//tag list 보여주기
	function goTagListView(kind, data) {

		var maintype = '';
		
		if( kind == 'Recom') {
			maintype = '1';
		} else if( kind == 'Course') {
			maintype = '3';
		} else if( kind == 'Tour') {
			maintype = '2';
		} else if( kind == 'Festival') {
			maintype = '4';
		}

		tagListViewYN = 'Y';
		
		var strHtml = '';

        var tagid = stagId.split(",");  

        var otdid = '0a01eb7b-96de-11e8-8165-020027310001';
        	
        if( data.body.result != undefined ) {

    		$.each(data.body.result, function (index, items) {
    			
                //for (var i in tagid) {  
        		//	if( tagid[i] == items.tagId ) {
                //   	strHtml += '<li id="'+items.tagId+'" otdid="'+otdid+'" maintype="'+maintype+'"><button type="button" class="btn active"><span>#'+items.tagName+'</span></button></li>';
        		//	} else {
        		//		strHtml += '<li id="'+items.tagId+'" otdid="'+otdid+'" maintype="'+maintype+'"><button type="button" class="btn"><span>#'+items.tagName+'</span></button></li>';
        		//	}	
                //}  
                strHtml += '<li id="'+items.tagId+'" otdid="'+otdid+'" maintype="'+maintype+'"><button type="button" class="btn"><span>#'+items.tagName+'</span></button></li>';
    		});

    		 $('#taglist').html(strHtml);
    		 
     		$("#taglist li button").each(function( index ) {
                for (var i in tagid) {
        			if( tagid[i] == $(this).parents().attr('id') ) {
        				if( $( this ).attr('class') != 'btn active' ) {
        					$( this ).addClass('active');
        				}
        			}	
                }  
    		});

        }
        
	}

	//메인 tag list 보여주기
	function goMainTagListView(kind, data) {

		var strHtml = '';
		var golistUrl = '';
		var maintype = '';	
		if( kind == 'Recom') {
			golistUrl = '/list/rem_list.do?choiceTag=';
			maintype = '1';
		} else if( kind == 'Course') {
			golistUrl = '/list/cs_list.do?choiceTag=';
			maintype = '3';
		} else if( kind == 'Tour') {
			golistUrl = '/list/ms_list.do?choiceTag=';
			maintype = '2';
		} else if( kind == 'Festival') {
			golistUrl = '/list/fes_list.do?choiceTag=';
			maintype = '4';
		}
		
		if(data.body.result != undefined ) {

			$.each(data.body.result, function (index, items) {

				if( index == 0 ) {
					strHtml += '<li class="tagAll" id="All"><a href="javascript:" onclick=goMainlist("'+maintype+'","'+golistUrl+'","","");>#전체</a></li>';
				}
				
				strHtml += '<li id="'+items.tagId+'"><a href="javascript:" onclick=goMainlist("'+maintype+'","'+golistUrl+'","'+items.tagId+'","'+items.tagName+'")>#'+items.tagName+'</a></li>';
			});

			 $('#taglist').html(strHtml);

		}
		
		subMainTagMore();
	}

	
	//각메인  리스트로가기
	function goMainlist( maintype, golistUrl, rtagid, rtagname ) {

		//위치별 태그 클릭수 save
		goTagOtherSectionLogSave(rtagid,'0a01eb7b-96de-11e8-8165-020027310001',maintype);

	  	setTimeout(function () {
			//태그 클릭수 save
			goTagLogSave(rtagid);
	  	}, 200) ;

	  	setTimeout(function () {
			location.href = golistUrl+rtagname+'&choiceTagId='+rtagid;
	  	}, 200) ;
		
	}

	
	//전체 메인 tag list 보여주기
	function goAllMainTagListView(otdid, data) {

		var strHtml = '';

		if( data.body.result != undefined ) {
			$.each(data.body.result, function (index, items) {

				if( index == 0 ) {
					strHtml += '<li class="tagAll" id="All"><a href="javascript:" onclick=goAlllist("","");>#전체</a></li>';
				}
				
				var tagname = items.tagName;

				strHtml += '<li id="'+items.tagId+'"><a href="javascript:" onclick="goAlllist(\''+items.tagId+'\',\''+tagname+'\');">#'+items.tagName+'</a></li>';
			});

			 $('#taglist').html(strHtml);
		}
		
		mainTagMore();
	}
	
	//전체  리스트로가기
	function goAlllist( rtagid, rtagname ) {

		//메인 tag 섹션 클릭 
		goMainLogSave('28d91274-9aa7-11e8-8165-020027310001');

	  	setTimeout(function () {
			//위치별 태그 클릭수 save
			goTagOtherSectionLogSave(rtagid,'0a01eb7b-96de-11e8-8165-020027310001','0');
	  	}, 200) ;

	  	setTimeout(function () {
			//태그 클릭수 save
			goTagLogSave(rtagid);
	  	}, 200) ;

		
		var golistUrl = '/list/all_list.do?choiceTag=';
	
	  	setTimeout(function () {
			//태그 클릭수 save
			location.href = mainurl+golistUrl+rtagname+'&choiceTagId='+rtagid+'&temp=';
	  	}, 200) ;

	}
	

	//메인 테그영역 리사이즈
	function TagAreaResize(val) {
		$('.area_tagTop').height(val);
	}

	//시군구리스트 가져오기
	function getSigungu() {
		
		var pdata =
        {
				cmd : 'RECOM_SIGUNGU_CODE'
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				sigunguObj = data;
				areaListViewYN = 'Y';
			},
			complete: function() {

				if( areacode != 'All') {
					//선택한 지역 표시하기
					goAreaChoiceView(areacode);
				}

			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}

	//월 클릭시 ..
	$(document).on("click","#monthlist li button",function(){  
		var month = $(this).parents().attr('id');
		selectListTopRemove();
		if( month == 'All') {
			selectMonthRemove();
			$(this).addClass('btn_all_active');
			smonth = 'All';
		} else {
			
			if( smonth == 'All') {
				selectAllMonthRemove();
				$(this).addClass('active');
			} else {
				if( $( this ).attr('class') == 'btn active' ) {
					$(this).removeClass('active');
				} else {
					$(this).addClass('active');					
				}

			}

			smonth = '';

			$("#monthlist li button").each(function( index ) {
				if( $( this ).attr('class') == 'btn active' ) {
					if(smonth.length == 0 ) {
						smonth =  $(this).parents().attr('id');
					} else {
						smonth +=  ','+$(this).parents().attr('id');
					}
				}
			});
		}
		if(smonth.length == 0) {
			smonth = 'All';
			$('#monthlist #All button').addClass('btn_all_active');	
		}

		spage = 1;
		
		if( sOtdid != 'b55ffe10-84c3-11e8-8165-020027310001' ) {
			$('.box_rightType1').removeClass('on');			
		}
		
		getContentList();
	});

	
	//tag 클릭시
	$(document).on("click","#taglist li button",function(){  
		var tagId = $(this).parents().attr('id');
		var otdId = $(this).parents().attr('otdid');
		var maintype = $(this).parents().attr('maintype');

		if( maintype == undefined || maintype == null || maintype == 'null' ) maintype = '0';
		
		selectListTopRemove();
		
		omoreTagName = 'All';
		
		if( $( this ).attr('class') == 'btn active' ) {
			$(this).removeClass('active');
		} else {
			$(this).addClass('active');			
			
			//위치별 태그 클릭수 save
			goTagOtherSectionLogSave(tagId,otdId, maintype);

		  	setTimeout(function () {
				goTagLogSave(tagId);
		  	}, 200) ;
		}

		stagId = '';	
		stagName = '';
		$("#taglist li button").each(function( index ) {
			if( $( this ).attr('class') == 'btn active' ) {
				if(stagId.length == 0 ) {
					stagName =  '<strong>'+$(this).text()+'</strong>';
					stagId =  '#'+$(this).parents().attr('id');
				} else {
					//stagName +=  ','+$(this).text();
					stagName +=  '<strong>'+$(this).text()+'</strong>';
					stagId +=  ','+'#'+$(this).parents().attr('id');
				}
			}
		});

		//$(".tit_cont h2").text(stagName.replace(/,/gi," "));
		$(".tit_cont .tag").html(stagName);
		if( stagId == '' ) stagId = 'All';
		
		spage = 1;
		
		if( sOtdid != 'b55ffe10-84c3-11e8-8165-020027310001' ) {
			$('.box_rightType1').removeClass('on');	
		} else {
			selectListTopRemove();
			selectBfreeKindRemove();
			selectBfreeTourKindRemove();
			
			bfreetitlekind = 'All';
			bfreetourkind = 'All';
			bfreekind = 'All';
			tagmenu1 = '';

		}

		getContentList();
	});


	//지역 클릭시
	$(document).on("click","#arealist li button",function(){  

		var mareacode = $(this).parents().attr('id');
		selectListTopRemove();

		if( mareacode == 'All') {
			selectAreaRemove();
			$(this).addClass('btn_all_active');
			
			$("#sigungulist li").remove();
			
			ssigunguCode = 'All';
			$('#sigungulist').slideUp(500);
		} else {
			selectAllAreaRemove();
			selectAreaRemove();
			$(this).addClass('btn_all_active');
			
		}

		if(mareacode.length == 0) {
			mareacode = 'All';
		}

		sareaCode = mareacode;
		
		if( mareacode == 'All') {
			
			$('#arealist #All button').addClass('btn_all_active');	
			$("#sigungulist li").remove();
			
			ssigunguCode = 'All';
			$('#sigungulist').slideUp(500);

			getContentList();
		} else {
			goSigunguListView(mareacode, sigunguObj);
		}	
	});
	
	
	//시군구코드 list 보여주기
	function goSigunguListView(mareacode, data) {

		var strHtml = '';

		strHtml += '<li id="All"><button type="button"><span>전체</span></button></li>';

		$.each(data.body.result, function (index, items) {
			if( items.areaCode == mareacode ) {
				strHtml += '<li id="'+items.sigunguCode+'"><button type="button" class="btn"><span>'+items.sigunguName+'</span></button></li>';
			}
		});
		
		$('#sigungulist').html(strHtml);
		$('.area_view_list').slideDown(500);
		
		$("#sigungulist li button").each(function( index ) {
			if(  $(this).parents().attr('id') == 'All' ) {
				$(this).addClass('btn_all_active');
			}
		});
		ssigunguCode = 'All';
		spage = 1;
		getContentList();
	}


	//시군구 클릭시
	$(document).on("click","#sigungulist li button",function(){  
		
		var msigungucode = $(this).parents().attr('id');
		selectListTopRemove();
		if( msigungucode == 'All') {
			selectSigunguRemove();
			$(this).addClass('btn_all_active');
			ssigunguCode = 'All';
		} else {
			if( ssigunguCode == 'All') {
				selectAllSigunguRemove();
				$(this).addClass('active');
			} else {
				selectAllSigunguRemove();
				if( $( this ).attr('class') == 'btn active' ) {
					$(this).removeClass('active');
				} else {
					$(this).addClass('active');					
				}

			}

			ssigunguCode = '';

			$("#sigungulist li button").each(function( index ) {
				if( $( this ).attr('class') == 'btn active' ) {
					if(ssigunguCode.length == 0 ) {
						ssigunguCode =  $(this).parents().attr('id');
					} else {
						ssigunguCode +=  ','+$(this).parents().attr('id');
					}
				}
			});
			
			if( ssigunguCode.length == 0 ) {
				ssigunguCode = 'All';
				
				$("#sigungulist li button").each(function( index ) {
					if( $(this).parents().attr('id') == 'All' ) {
						$(this).addClass('btn_all_active');
					}
				});	
			}
		}
		spage = 1;
		
		if( sOtdid != 'b55ffe10-84c3-11e8-8165-020027310001' ) {
			$('.box_rightType1').removeClass('on');			
		}
		
		getContentList();
	});
	
	
	//타부서 taglist 가져오기
	function getOtherMainTag(otdid,callkind) {
		
		var pdata =
        {
				cmd : 'OTHER_MAIN_TAG_VIEW',
				otdid : otdid
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				if( callkind == 'allMain' ) {
					goAllMainTagListView(otdid,data);
				} else if( callkind == 'main') {
					goOtherMainTagListView(otdid,data);
				} else {
					goOhterTagListView(otdid, data);
				}
			},
			complete: function() {
				//if( callkind == 'main') {
				//	if( $('.area_tagTop ul').height() > 30 ) {
				//		othertagheight = $('.area_tagTop ul').height();
				//		TagAreaResize(othertagareaheight);
				//	} else {
				//		$('#tagBtnMore').hide();
				//	}
				//} 
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}
	
	//tag list 보여주기
	function goOhterTagListView(otdid, data) {

		tagListViewYN = 'Y';
		
        var moretag = moreTagName.split("|");

        if( data.body.result != undefined ) {

    		$.each(data.body.result, function (index, items) {
    			
                for (var i in moretag) {  
                	stagId = stagId.replace('All,','');
        			if( moretag[i] == items.tagName ) {
        				if(stagId.length == 0 ) {
        					stagId =  items.tagId;
        				} else {
        					stagId +=  ','+items.tagId;
        				}
        			}	
                }  
                
    		});
    		moreTagName = 'All';	

    		var strHtml = '';

    		var tagid = stagId.split(",");
    		$.each(data.body.result, function (index, items) {
   				strHtml += '<li id="'+items.tagId+'" otdid="'+otdid+'"><button type="button" class="btn"><span>#'+items.tagName+'</span></button></li>';
     		});

      		$('#taglist').html(strHtml);
      		
    		$("#taglist li button").each(function( index ) {
                for (var i in tagid) {
        			if( tagid[i] == $(this).parents().attr('id') ) {
        				if( $( this ).attr('class') != 'btn active' ) {
        					$( this ).addClass('active');
        				}
        			}	
                }  
    		});

        }
	}

	//타부서 메인 tag list 보여주기
	function goOtherMainTagListView(rotdid, data) {

		var strHtml = '';
		var golistUrl = '';
		
		golistUrl = '/other/other_list.do?otdid='+rotdid+'&choiceTag=&temp=';
		
		if( data.body.result != undefined ) {

			$.each(data.body.result, function (index, items) {

				if( index == 0 ) {
					strHtml += '<li class="tagAll" id="All"><a href="'+golistUrl+'">#전체</a></li>';
				}
				var smid = '28d91274-9aa7-11e8-8165-020027310001';
				strHtml += '<li id="'+items.tagId+'"><a href="javascript:" onclick="goOtherlist(\''+smid+'\',\''+otdid+'\',\''+items.tagId+'\',\''+items.tagName+'\');">#'+items.tagName+'</a></li>';
			});

			 $('#taglist').html(strHtml);

		}
		
		subMainTagMore();
	}

	//타부서 리스트로가기
	function goOtherlist(smid, rotdid, rtagid, rtagname ) {

		var golistUrl = '';
		
		golistUrl = '/other/other_list.do?otdid='+rotdid+'&choiceTag=';
		
		//타부서 메인 영역 클릭수 save
		goOtherDepartmentLogSave(smid, otdid);

	  	setTimeout(function () {
			//위치별 태그 클릭수 save
			goTagOtherSectionLogSave(rtagid,rotdid,'0');
	  	}, 200) ;

	  	setTimeout(function () {
			//태그 클릭수 save
			goTagLogSave(rtagid);
	  	}, 200) ;

	  	setTimeout(function () {
			location.href = golistUrl+rtagname+'&choiceTagId='+rtagid+'&temp=';
		}, 200) ;
		
	}
	
	
	$(document).on("click",".btn_represch",function(){ 
		
		selectMonthRemove();
		selectAreaRemove();
		selectSigunguRemove();
		selectTagRemove();
		selectListTopRemove();
		selectBfreeKindRemove();
		selectBfreeTourKindRemove();

		$('#sigungulist').slideUp(500);
		$('#arealist #All button').addClass('btn_all_active');	
		
		bfreetitlekind = 'All';
		bfreetourkind = 'All';
		bfreekind = 'All';
		omoreTagName = 'All';
		tagmenu1 = '';
		
		smonth = 'All';
		sareaCode = 'All';
		ssigunguCode = 'All';
		stagName = '';
		stagId = 'All';
		spage = 1;
		scnt = 10;
		
		getContentList();
		
	});
	
	
	//무장애 관광지, 음식, 숙박  클릭시
	$(document).on("click",".tag_list2 li .btn",function(){  

		var $this = $(this);
		var $thisSibilgs = $(this).parent().siblings().children();

		if($this.hasClass('active')){
			$this.removeClass('active');
			bfreetourkind = 'All';
		}else{
			$this.addClass('active');
			bfreetourkind = $(this).parent().attr("id");
			$thisSibilgs.removeClass('active');
		}

		spage = 1;
		selectTagRemove();
		stagId = 'All';
		omoreTagName = 'All';
		getContentList();
	});

	
	//무장애 타이틀종류 클릭시
	$(document).on("click","#bfreeKindTitle li .btn",function(){  
		
		var bfreetitle = $(this).parents().attr('tit');

		if( bfreetitle == 'All') {
			selectFreetitleRemove();
			$(this).addClass('btn_all_active');
			bfreetitlekind = 'All';
		} else {
			if( bfreetitlekind == 'All') {
				selectAllFreetitleRemove();
				$(this).addClass('active');
			} else {
				selectAllFreetitleRemove();
				if( $( this ).attr('class') == 'btn active' ) {
					$(this).removeClass('active');
				} else {
					$(this).addClass('active');					
				}

			}

			bfreetitlekind = '';

			$("#bfreeKindTitle li button").each(function( index ) {
				if( $( this ).attr('class') == 'btn active' ) {
					if(bfreetitlekind.length == 0 ) {
						bfreetitlekind =  $(this).parents().attr('tit');
					} else {
						bfreetitlekind +=  ','+$(this).parents().attr('tit');
					}
				}
			});
			
			if( bfreetitlekind.length == 0 ) {
				bfreetitlekind = 'All';
				
				$("#bfreeKindTitle li button").each(function( index ) {
					if( $(this).parents().attr('tit') == 'All' ) {
						$(this).addClass('btn_all_active');
					}
				});	
			}
		}
		
		spage = 1;
		
		if( sOtdid != 'b55ffe10-84c3-11e8-8165-020027310001' ) {
			$('.box_rightType1').removeClass('on');		
		}

		selectTagRemove();
		stagId = 'All';
		omoreTagName = 'All';
		
		getContentList();

	});
	
	function selectFreetitleRemove() {
		$("#bfreeKindTitle li button").each(function( index ) {
			$( this ).removeClass('active');
		});
	}	

	
	function selectAllFreetitleRemove() {
		$("#bfreeKindTitle li button").each(function( index ) {
			$( this ).removeClass('btn_all_active');
		});
	}	
