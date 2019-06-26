//즐겨찾기 추가
	function setFavoContent(contentid) {

		if( loginYn == 'N') {
			showLogin(2);
		} else {
			
			var pdata =
	        {
					cmd : 'FAVO_CONTENTINFO_SAVE',
					cotid : contentid
	        }
	    	var obj_st=JSON.stringify(pdata);

			$.ajax({
				url: mainurl+'/call',
				dataType: 'json',
				type: "POST",
				data: obj_st,
				success: function(data) {
					if( data.header.process == 'success' ) {
						alert('즐겨찾기에 추가 되었습니다.');
					} else if( data.header.rsFlag == 0 ) {
						alert('이미 즐겨찾기에 저장된 컨텐츠입니다.');
					}
					
					$('.btn_titview').removeClass('on');
					$('.dimmed2').remove();
				},
				complete: function() {
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}
	}

	//즐겨찾기 삭제
	function goFavoContentDelete(contentid) {
		
		var pdata =
        {
				cmd : 'FAVO_CONTENTINFO_DELETE',
				cotid : contentid
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				window.location.reload(true);
			},
			complete: function() {
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
		
	}
	
	//코스에 담기
	function goCartCourse(courseid, contentid, contenttype) {
		
		var pdata =
        {
				cmd : 'COURSE_SUB_SAVE',
				courseid : courseid,
				cotid : contentid,
				contenttype : contenttype+''
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				layerPopup.layerHide('cosChoice');
			},
			complete: function() {
				alert('코스에 담기가 완료되었습니다.');
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}	
		
	//마이코스삭제
	function goCourseDelete(courseid) {
		
		if( confirm("해당 코스를 삭제하시겠습니까 ?") == true) {
			
			var pdata =
	        {
					cmd : 'COURSE_CONTENT_DELETE',
					crsid : courseid
	        }
	    	var obj_st=JSON.stringify(pdata);

			$.ajax({
				url: mainurl+'/call',
				dataType: 'json',
				type: "POST",
				data: obj_st,
				success: function(data) {
					location.href = '../mypage/mypage_list_cos.do';
				},
				complete: function() {
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}
		
	}	

	//코스 생성
	function goCourseCreate(cosname) {
		
		var pdata =
        {
				cmd : 'COURSE_CONTENT_SAVE',
				title : chkword(cosname)
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				$('.makecos').hide();
			},
			complete: function() {
				window.location.reload(true);
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}
	
	//코스에 담기에 필요한 내 코스 리스트
	function myCourseList(functionkind, contenttype, contentid, oriCourseid) {
		
		if( loginYn == 'N') {
			showLogin(2);
		} else {
			if( sloginType == '10' ) {
				layerPopup.layerShow('cosConfirm4');
				return;
			} else {
				
				var pdata =
		        {
						cmd : 'MY_COURSE_LIST_VIEW',
						page : 1+'',
						cnt : 2000+''
		        }
		    	var obj_st=JSON.stringify(pdata);
	
				$.ajax({
					url: mainurl+'/call',
					dataType: 'json',
					type: "POST",
					data: obj_st,
					success: function(data) {
						goMyCourseListView(data, functionkind, contenttype, contentid, oriCourseid);
					},
					complete: function() {
					},
					error: function(xhr, textStatus, errorThrown) {
					}
				});
				
			}	
		}

	}
	
	//코스에 담기에 필요한 내 코스 리스트 보여주기
	function goMyCourseListView(data, functionkind, contenttype, contentid, oriCourseid) {
		
		var strHtml = "";
		
		if( data.body.result != undefined ) {

			$.each(data.body.result, function (index, items) {

				if( items.crsId != oriCourseid ) {
					strHtml += '<li>';
					strHtml += '<span>'+items.title+'</span>';
					strHtml += '<div class="area_btn">';
					if( functionkind == 'C' ) {	//코스에 담기
						strHtml += '    <button type="button" class="btn_def" onclick=goCartCourse("'+items.crsId+'","'+contentid+'","'+contenttype+'")>선택</button>';				
					} else {	//다른코스로 이동
						strHtml += '    <button type="button" class="btn_def" onclick=goCourseSubMove("'+items.crsId+'","'+contentid+'","'+contenttype+'","'+oriCourseid+'")>선택</button>';
					}
		
					strHtml += '</div>';
					strHtml += '</li>';
				}
			});

	        $('.list_choice ul').html(strHtml);
	        
	        layerPopup.layerShow('cosChoice');

		} else {
			//알림팝업
			layerPopup.layerShow('cosConfirm');

		} 
	    

		
	}
	
	
	//다른코스로 이동
	function goCourseSubMove(targetCourseid, contentid, contenttype, oriCourseid) {
		
		var pdata =
        {
				cmd : 'COURSE_SUB_UPDATE',
				oriCourseid : oriCourseid,
				cotid : contentid,
				targetCourseid : targetCourseid
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				window.location.reload(true);
			},
			complete: function() {
				alert('콘텐츠 이동이 완료되었습니다.');
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}	
	
	//상세 상단에서 코스에 담기 클릭시
	function myCourseCartDetail( functionkind, contenttype, oriCourseid ) {
		var contentid = sContentId;
		myCourseList(functionkind, contenttype, contentid, oriCourseid); 
	}
	
	//사용자코스의 콘텐츠 삭제
	function CourseSubDelete(courseid, contentid) {
		
		var pdata =
        {
				cmd : 'COURSE_SUB_DELETE',
				crsid  : courseid,
				cotid : contentid
        }
    	var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
			},
			complete: function() {
				alert('콘텐츠 삭제가 완료되었습니다.');
				window.location.reload(true);				
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
		
	}

	function goJikimi() {
		
		if( loginYn == 'N') {
			showLogin(2);
		} else {
			if( sloginType == '10' ) {
				location.href = "/partners/partners_jikimi_reg.do?cotid="+cotid;				
			} else {
				location.href = "/mypage/tourist_info_reg.do?cotid="+cotid;
			}
			
		}

	}