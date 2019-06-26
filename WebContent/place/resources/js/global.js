//visit
var mainurl = 'https://korean.visitkorea.or.kr';
var mainfileurl = 'https://support.visitkorea.or.kr';
var mainimgurl = 'https://support.visitkorea.or.kr/img/call?cmd=VIEW&id=';
var mainfileurlpath = 'https://support.visitkorea.or.kr/img/call?cmd=TEMP_VIEW&name=';
var mainUploadUrl = 'https://support.visitkorea.or.kr/img/call';
var domainIfno = 'https://korean.visitkorea.or.kr/json/jsp';
var domainIfno2 = 'https://korean.visitkorea.or.kr/json/jsp';
var facebookappid = '1628836140497717';


var imgmode = '&mode=raw';
var imgmodeThumb = '&mode=thumb';
var tagareaheight = 60;
var othertagareaheight = 30;
var tagheight = 60; 
var othertagheight = 30;
var detailheight = 610;
var detailareaheight = 610; 

var pagingSize = 5;
var locationx='0.0';
var locationy='0.0';
var appYn = 'N';
var mobileYn = 'N';
var uid = '';
var loginYn = 'N';
var getLocationYn = 'N';

var sContentTitle;
var sContentImg;
var sContentId;
var sContentType;
var sOtdid = '';
var sloginType = '';

var server = location.href;
var protocol = location.protocol;

//파라메타 값 가져오기
var getParameter = function (param) {
    var returnValue;
    var url = location.href;
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == param.toUpperCase()) {
            returnValue = parameters[i].split('=')[1];
            return decodeURIComponent(returnValue);
        }
    }
};

function fn_addMonth(pAddMonthCnt) {
	
	var yyyy,m,d;
	var dt = new Date();

	// Display the month, day, and year. getMonth() returns a 0-based number.
	var pMonth = dt.getMonth()+1;
	var pDay = dt.getDate();
	var pYear = dt.getFullYear();

	var oDate = new Date(pYear, pMonth, 1);
	oDate.setMonth(oDate.getMonth() + Number(pAddMonthCnt));
	yyyy = oDate.getFullYear(); 

	m = oDate.getMonth();
	d = oDate.getDate();
	
	if( pAddMonthCnt >= 0 ) {
		if( m == '0' ) { m = '12'; yyyy = yyyy + 1;}
	} else {
		if( m == '0' ) { m = '12'; yyyy = yyyy - 1;}
	}
	return yyyy + "-" + m + "-" + d;
}

//date(yyyyMMddhhmm형식)
//format(yyyyMMdd,yyyyMMddhhmm)
//splitStr(ko or '-' or '/')
function conDateFormat(date, format, splitStr) {
	var rtnDate = '';
	if( "yyyyMMdd" == format ) {
		if(date.length >= 8 ) {
			if("" == splitStr) {
				rtnDate += date.substring(0,4)+date.substring(4,6)+date.substring(6,8);
			} else {
				if("ko" == splitStr ) {
					rtnDate += date.substring(0,4) + '년';
					rtnDate += date.substring(4,6) + '월';
					rtnDate += date.substring(6,8) + '일';
				} else {
					rtnDate += date.substring(0,4) + splitStr;
					rtnDate += date.substring(4,6) + splitStr;
					rtnDate += date.substring(6,8);
				}
			}
		} else {
			rtnDate = date;
		}
	} else if( "yyyyMMddHHmm" == format ) {
		if(date.length >= 12 ) {
			if("" == splitStr) {
				rtnDate += date.substring(0,4)+date.substring(4,6)+date.substring(6,8)+date.substring(8,10)+date.substring(10,12);
			} else {
				if("ko" == splitStr ) {
					rtnDate += date.substring(0,4) + '년';
					rtnDate += date.substring(4,6) + '월';
					rtnDate += date.substring(6,8) + '일';
					rtnDate += date.substring(8,10) + '시';
					rtnDate += date.substring(10,12) + '분';
				} else {
					rtnDate += date.substring(0,4) + splitStr;
					rtnDate += date.substring(4,6) + splitStr;
					rtnDate += date.substring(6,8) + splitStr;
					rtnDate += date.substring(8,10) + splitStr;
					rtnDate += date.substring(10,12);
				}
			}
		} else {
			rtnDate = date;
		}
	} else {
	}
	
	return rtnDate;
}
	
//date(yyyyMMddhhmm형식)
//format(yyyyMMdd,yyyyMMddhhmm)
//splitStr(ko or '-' or '/')
function conDateFormat2(date, format, splitStr) {
	var rtnDate = '';
	if( "yyyyMMdd" == format ) {
		if(date.length >= 8 ) {
			if("" == splitStr) {
				rtnDate += date.substring(0,4)+date.substring(4,6)+date.substring(6,8);
			} else {
				if("ko" == splitStr ) {
					rtnDate += date.substring(0,4) + '년';
					rtnDate += date.substring(4,6) + '월';
					rtnDate += date.substring(6,8) + '일';
				} else {
					//rtnDate += date.substring(0,4) + splitStr;
					rtnDate += date.substring(4,6) + splitStr;
					rtnDate += date.substring(6,8);
				}
			}
		} else {
			rtnDate = date;
		}
	} else if( "yyyyMMddHHmm" == format ) {
		if(date.length >= 12 ) {
			if("" == splitStr) {
				rtnDate += date.substring(0,4)+date.substring(4,6)+date.substring(6,8)+date.substring(8,10)+date.substring(10,12);
			} else {
				if("ko" == splitStr ) {
					rtnDate += date.substring(0,4) + '년';
					rtnDate += date.substring(4,6) + '월';
					rtnDate += date.substring(6,8) + '일';
					rtnDate += date.substring(8,10) + '시';
					rtnDate += date.substring(10,12) + '분';
				} else {
					rtnDate += date.substring(0,4) + splitStr;
					rtnDate += date.substring(4,6) + splitStr;
					rtnDate += date.substring(6,8) + splitStr;
					rtnDate += date.substring(8,10) + splitStr;
					rtnDate += date.substring(10,12);
				}
			}
		} else {
			rtnDate = date;
		}
	} else {
	}
	
	return rtnDate;
}

function getLocation() {
	getLocationYn = 'Y';
	if( appYn == 'N') {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(setPosition, showError, showOptions);
	    } else {
	        showPositionNot(0,0);
	    }
	} else {
		location.href = "location:?getXY=location";
	}
}

function setPosition(position) {
	showPosition(position.coords.latitude, position.coords.longitude);
}

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            //alert("User denied the request for Geolocation.");
            break;
        case error.POSITION_UNAVAILABLE:
            //alert("Location information is unavailable.");
            break;
        case error.TIMEOUT:
            //alert("The request to get user location timed out.");
            break;
        case error.UNKNOWN_ERROR:
            //alert("An unknown error occurred.");
            break;
    }
    showPositionNot(0,0);		
}    


var showOptions = {
		  enableHighAccuracy: false,
		  timeout: 2500,
		  maximumAge: 2000
};


function setLocationXY( x, y, option) {
	var options = option;

	if( x == 0.000000 || y == 0.000000 ) {
		showPositionNot( 0.0, 0.0);
	} else {
		showPosition(x, y);
	}
}


function getDevice() {
	var agent = navigator.userAgent.toLowerCase();
	 if (agent.indexOf('iphone') != -1 || agent.indexOf('ipad') != -1) { // iPhone Device
		 mobileYn = 'Y';
		 return 'iOS';
	} else if (agent.indexOf('android') != -1) { // Google phones running Android OS
		mobileYn = 'Y';
		return 'Android';
	}
}	 

function getBrowser() {
	var agt = navigator.userAgent.toLowerCase(); 
	if (agt.indexOf("chrome") != -1) return 'Chrome'; 
	if (agt.indexOf("opera") != -1) return 'Opera'; 
	if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
	if (agt.indexOf("webtv") != -1) return 'WebTV'; 
	if (agt.indexOf("beonex") != -1) return 'Beonex'; 
	if (agt.indexOf("chimera") != -1) return 'Chimera'; 
	if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
	if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
	if (agt.indexOf("firefox") != -1) return 'Firefox'; 
	if (agt.indexOf("safari") != -1) return 'Safari'; 
	if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
	if (agt.indexOf("netscape") != -1) return 'Netscape'; 
	if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla'; 
	if (agt.indexOf("msie") != -1) { // 익스플로러 일 경우 var rv = -1; 
		if (navigator.appName == 'Microsoft Internet Explorer') { 
			var ua = navigator.userAgent; 
			var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})"); 
			if (re.exec(ua) != null) rv = parseFloat(RegExp.$1); 
		} return 'Internet Explorer '+rv; 
	}
}

function getAppYn() {
	var agent = navigator.userAgent.toLowerCase();
	//alert(agent);
	//alert(location.host);
	 if (agent.indexOf('visitkor') != -1 ) { 
		 appYn = 'Y';
		 mobileYn = 'Y';
	} 
}

function setDist(val) {
	var val2 = val+"";
	var distval;
	var dot = val2.indexOf(".");
	distval = val2.substr(0,dot);
	distval += val2.substr(dot,2);

	return distval;
	
}

function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

function numberWithCommas(x) {
	if( x == undefined || x == 'undefined' ) {
		return 0;
	} else {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");		
	}

}


getAppYn();
var device = getDevice();

var reqPart = '';
var reqUsrid = '';
//로그인시
function goLogin(loginkind) {
	//'000 :: FACEBOOK,\n001 :: TWITTER,\n002 :: INSTAGRAM,\n003 :: DAUM,\n004 :: NAVER,\n005 :: KAKAOTALK,\n006 :: GOOGLE

	if( appYn == 'N') {
		if( loginkind == 'naver' ) {
			//window.open(mainurl+'/SnsOauthAction?loginType=4&appYn=N');
			window.open(mainurl+'/ReqOauthAction?loginType=4&appYn=N&reqPart='+reqPart+'&reqUsrid='+reqUsrid);
			//openLogin = window.open(null);
			//openLogin.document.write('<iframe width="100%", height="100%" src="'+mainurl+'/ReqOauthAction?loginType=4&appYn=N'+'" frameborder="0" allowfullscreen></iframe>');
		} else if( loginkind == 'kakao' ) {
			window.open(mainurl+'/ReqOauthAction?loginType=5&appYn=N&reqPart='+reqPart+'&reqUsrid='+reqUsrid);
			//var ss = mainurl+'/ReqOauthAction?loginType=5&appYn=N';
			//openLogin = window.open(null);
			//openLogin.document.write('<iframe width="100%", height="100%" src="'+ss+'" frameborder="0" allowfullscreen></iframe>');
		} else if( loginkind == 'facebook' ) {
			window.open(mainurl+'/ReqOauthAction?loginType=0&appYn=N&reqPart='+reqPart+'&reqUsrid='+reqUsrid); 
		} else if( loginkind == 'twitter' ) {
			window.open(mainurl+'/ReqOauthAction?loginType=1&appYn=N&reqPart='+reqPart+'&reqUsrid='+reqUsrid); 
		} else if( loginkind == 'google' ) {
			window.open(mainurl+'/ReqOauthAction?loginType=6&appYn=N&reqPart='+reqPart+'&reqUsrid='+reqUsrid); 
		} else if( loginkind == 'instagram' ) {
			window.open(mainurl+'/ReqOauthAction?loginType=2&appYn=N&reqPart='+reqPart+'&reqUsrid='+reqUsrid); 
		}
	} else {
		if( loginkind == 'naver' ) {
			location.href = "opentab://"+mainurl+"/ReqOauthAction?loginType=4&appYn=Y&reqPart="+reqPart+"&reqUsrid="+reqUsrid; 
		} else if( loginkind == 'kakao' ) {
			location.href = "opentab://"+mainurl+"/ReqOauthAction?loginType=5&appYn=Y&reqPart="+reqPart+"&reqUsrid="+reqUsrid;
		} else if( loginkind == 'facebook' ) {
			location.href = "opentab://"+mainurl+"/ReqOauthAction?loginType=0&appYn=Y&reqPart="+reqPart+"&reqUsrid="+reqUsrid; 
		} else if( loginkind == 'twitter' ) {
			location.href = "opentab://"+mainurl+"/ReqOauthAction?loginType=1&appYn=Y&reqPart="+reqPart+"&reqUsrid="+reqUsrid; 
		} else if( loginkind == 'google' ) {
			location.href = "opentab://"+mainurl+"/ReqOauthAction?loginType=6&appYn=Y&reqPart="+reqPart+"&reqUsrid="+reqUsrid; 
		} else if( loginkind == 'instagram' ) {
			location.href = "opentab://"+mainurl+"/ReqOauthAction?loginType=2&appYn=Y&reqPart="+reqPart+"&reqUsrid="+reqUsrid; 
		}
	}
}

//로그인후 reload - web
function loginResult() {
//	if( window.location.href.indexOf('main/main.do') > -1 ) {
//		location.replace('/main/main.do');
//	} else {
		window.location.reload(true);
//	}
}

//로그인후 reload - app
function authByToken(token){
	
	var pdata =
    {
			cmd : 'SNS_SESSION_SAVE',
			uuid : token
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

//javascript 거리계산.
function calculateDistance(lat1, lon1, lat2, lon2) {
    var R = 6371; // km
    var dLat = (lat2-lat1).toRad();
    var dLon = (lon2-lon1).toRad(); 
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
            Math.sin(dLon/2) * Math.sin(dLon/2); 
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
    var d = R * c;
    return d;
  }
  Number.prototype.toRad = function() {
    return this * Math.PI / 180;
  }

  
  function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
	    function deg2rad(deg) {
	        return deg * (Math.PI/180);
	    }

	    var R = 6371; // Radius of the earth in km
	    var dLat = deg2rad(lat2-lat1);  // deg2rad below
	    var dLon = deg2rad(lng2-lng1);
	    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    var d = R * c; // Distance in km
	    return d;
	}

	function setLogintype(val) {
		if( val == null || val == 'null' || val == undefined || val == 'undefined' || val == '' ) {
			$('.box_menu .btn_log').text('로그인');
			$('#loginbuttonarea').show();
			$('#plogin').text('로그인');
			$('#modpart').text('Partners 신청');
			$('#modpart').attr('href','/partners/partners_ask.do');
			loginYn = 'N';
		} else {
			$('.box_menu .btn_log').text('로그아웃');
			$('#comment').attr('placeholder','댓글 쓰기');
			$('#plogin').text('로그아웃');
			$('#modpart').text('회원정보변경');
			$('#modpart').attr('href','/partners/partners_user_mod.do');
			
			loginYn = 'Y';
		}
	}
	
	$(document).on("click","#plogin",function(){
		if( $('#plogin').text() == '로그아웃' ) {
			
			if( confirm("로그아웃을 하시겠습니까 ?") == true) {
				
				var pdata =
			    {
						cmd : 'SNS_SESSION_DELETE'
			    }
				var obj_st=JSON.stringify(pdata);

				$.ajax({
					url: mainurl+'/call',
					dataType: 'json',
					type: "POST",
					data: obj_st,
					success: function(data) {
						loginYn = 'N';
						location.href = '/partners/partners_main.do';								
					},
					complete: function() {
					},
					error: function(xhr, textStatus, errorThrown) {
					}
				});
			}		
			
		} else {
			location.href = '/partners/partners_login.do';
		}
	});	
	
	function showLogin(kind) {
		if( loginYn == 'N' ) {
			if( kind == 1 ) {
				$('.box_cont .login div p').remove();
			} else {
				$('.box_cont .login div').html('<p>로그인이 필요한 기능입니다.<br>로그인 후 재 진행 바랍니다. </p>');
			}
			layerPopup.layerShow('login');
			//$('.pop_log').show();			
		} else {
			if( confirm("로그아웃을 하시겠습니까 ?") == true) {
				
				var pdata =
			    {
						cmd : 'SNS_SESSION_DELETE'
			    }
				var obj_st=JSON.stringify(pdata);

				$.ajax({
					url: mainurl+'/call',
					dataType: 'json',
					type: "POST",
					data: obj_st,
					success: function(data) {
						loginYn = 'N';
						if( location.href.indexOf("mypage") > -1 ) {
							//if( appYn == 'N') {
								location.href = '/main/main.do';								
							//} else {
							//	location.href = 'app://index';
							//}

						} else {
							window.location.reload(true);							
						}

					},
					complete: function() {
					},
					error: function(xhr, textStatus, errorThrown) {
					}
				});
			}		
			
		}

	}
	
	// 0716 추가
	/* Navigation Layer Popup */
	function showNevi() {
		layerPopup.layerShow('popNavi');
		//$('.pop_navi').show();
		//$('.layerpop').css('top', (($(window).height() - $('.layerpop').height())/2) + Number($(window).scrollTop()));
	}

	
	//로딩화면 show
	function showLoding() {
		$('.loading').show();
	}

	//로딩화면 show
	function hideLoding() {
		$('.loading').hide();
	}

	function ctrim(stringToTrim) {
	    //return stringToTrim.replace(/^\s+|\s+$/g,"");
		return stringToTrim.replace(/(\s*)/g,"");
	}
	
	function shareHistory(kind, shareCotid) {
		var sharekind;

		if( kind == 'facebook' ) {
			sharekind = 0;
		}else if( kind == 'twitter') {
			sharekind = 1;
		}else if( kind == 'kakaostory') {
			sharekind = 2
		}else if( kind == 'kakaotalk') {
			sharekind = 3
		}else if( kind == 'band') {
			sharekind = 4
		}


		var pdata =
	    {
				cmd : 'SHARE_HISTORY_SAVE',
				sharekind : sharekind+'',					//SNS 타입 : 000 :: FACEBOOK,	001 :: TWITTER,	002 :: KAKAOSTORY ,	003 :: KAKAOTALK, 004 :: BAND' 
				cotid : shareCotid	
	    }
		var obj_st=JSON.stringify(pdata);

		$.ajax({
			url: mainurl+'/call',
			dataType: 'json',
			type: "POST",
			data: obj_st,
			success: function(data) {
				$("#conShare").text(Number($("#conShare").text())+1);
			},
			complete: function() {
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}	
	
	//타부서 메인 영역 클릭수 save
	function goOtherDepartmentLogSave( smid, rotdid ) {
		if( rotdid == '' || rotdid == null || rotdid == undefined ) {
		} else {
			
			var pdata =
		    {
					cmd : 'OTHER_DEPARTMENT_LOG_SAVE',
					smid : smid,
					otdid : rotdid
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
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}	
		
	}

	function goTagLogSave( rtagid ) {
		if( rtagid == '' || rtagid == null || rtagid == undefined ) {
		} else {
			
			var pdata =
		    {
					cmd : 'TAG_LOG_SAVE',
					tagid : rtagid,
					otdid : '0a01eb7b-96de-11e8-8165-020027310001'
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
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}
		
	}
	
	//전체메인 메인 영역 클릭수 save
	function goMainLogSave( smid ) {
		if( smid == '' || smid == null || smid == undefined ) {
		} else {
			
			var pdata =
		    {
					cmd : 'MAIN_LOG_SAVE',
					smid : smid
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
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}	
		
	}

	
	//전체메인 자자체 섹션 영역 클릭수 save
	function goLocalGovernmentLogSave( rareacode, section, rurl, rtitle ) {
		if( rareacode == '' || rareacode == null || rareacode == undefined ) {
		} else {
			
			var pdata =
		    {
					cmd : 'LOCAL_GOVERNMENT_LOG_SAVE',
					areaCode : rareacode+'',
					section : section+'',
					linkurl : rurl+'',
					title : rtitle
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
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}	
	}
	
		
	//전체메인 자자체 섹션(시군구) 영역 클릭수 save
	function goLocalGovernmentSubLogSave( rareacode, rsigungucode, rtitle ) {
		if( rareacode == '' || rareacode == null || rareacode == undefined ) {
		} else {
			
			var pdata =
		    {
					cmd : 'LOCAL_GOVERNMENT_SUB_LOG_SAVE',
					areaCode : rareacode+'',
					sigunguCode : rsigungucode+'',
					title : rtitle
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
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}	
	}


	//홍보배너 영역 클릭수 save
	function goBannerLogSave( rsection, rlinkUrl, rtitle ) {
		if( rsection == '' || rsection == null || rsection == undefined ) {
		} else {
			
			var pdata =
		    {
					cmd : 'BANNER_LOG_SAVE',
					section : rsection+'',
					linkurl : rlinkUrl+'',
					title : rtitle
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
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}	
	}
	
			
	function goSubMainMarketingSave( rkind, rlinkurl, rtitle, rcotid, rcontenttype ) {
		
		var maintitle = '';
		
		if( rkind == 'Recom') {
			maintitle = '추천메인';
		} else if( rkind == 'Course') {
			maintitle = '코스메인';
		} else if( rkind == 'Tour') {
			maintitle = '명소목록';
		} else if( rkind == 'Notice') {
			maintitle = '소식목록';
		}
		
		goBannerLogSave( maintitle,rlinkurl, rtitle);
		
	  	setTimeout(function () {
			if( rcotid == 'undefined' || rcotid == 'null' ) {
				if( rlinkurl.indexOf(mainurl) > -1  ) {
					location.href = rlinkurl;
				} else {
					window.open(rlinkurl)
				}
			} else {
				if( rcontenttype == '12' || rcontenttype == '14' || rcontenttype == '28' || rcontenttype == '38' || rcontenttype == '39' || rcontenttype == '32' || rcontenttype == '2000') {
					location.href = mainurl+'/detail/ms_detail.do?cotid='+rcotid;
				} else if( rcontenttype == '15' ) {
					location.href = mainurl+'/detail/fes_detail.do?cotid='+rcotid;
				} else if( rcontenttype == '25' ) {
					location.href = mainurl+'/detail/cs_detail.do?cotid='+rcotid;
				} else {
					location.href = mainurl+'/detail/rem_detail.do?cotid='+rcotid+'&temp=';
				}
			}
	  	}, 200) ;
	}
	
	
	function goMypage() {
		
		if( loginYn == 'N') {
			layerPopup.layerShow('login');			
		} else {
			if( sloginType == '10' ) {
				layerPopup.layerShow('cosConfirm4');
				return;
			} else {
				location.href = "/mypage/mypage_main.do";
			}	
		}

	}
	
	
	function quotReplace(Str) {
		if( Str == undefined || Str == 'undefined' || Str == null || Str == '' ) {
			return '';
		} else {
			return Str.replace(/\"/g,"&quot;").replace(/\'/g,"&#39;");			
		}

	}	

	
	function chkword(srch_val) {
    	var reselt = "";

       	return srch_val.replace(/</g, "&lt;").replace(/>/g, "&gt;");    		

/*
		if( srch_val.toLowerCase().indexOf('script') > -1 || 
				srch_val.toLowerCase().indexOf('innerhtml') > -1 ||
				srch_val.toLowerCase().indexOf('iframe') > -1 ||
				srch_val.toLowerCase().indexOf('frame') > -1 || 
				srch_val.toLowerCase().indexOf('eval') > -1 ||
				srch_val.toLowerCase().indexOf('javascript') > -1 || 
				srch_val.toLowerCase().indexOf('cookie') > -1 || 
				srch_val.toLowerCase().indexOf('onload') > -1 ||
				srch_val.toLowerCase().indexOf('src') > -1 ||
				srch_val.toLowerCase().indexOf('meta') > -1 ||
				srch_val.toLowerCase().indexOf('vbscript') > -1 ) {
			reselt = "N";
		}
		
        return reselt;
*/        
    }
	
	
	function chkwordDecode(srch_val) {
    	var reselt = "";
    	return srch_val.replace(/&lt;/g, "<").replace(/&gt;/g, ">");
/*
		if( srch_val.toLowerCase().indexOf('script') > -1 || 
				srch_val.toLowerCase().indexOf('innerhtml') > -1 ||
				srch_val.toLowerCase().indexOf('iframe') > -1 ||
				srch_val.toLowerCase().indexOf('frame') > -1 || 
				srch_val.toLowerCase().indexOf('eval') > -1 ||
				srch_val.toLowerCase().indexOf('javascript') > -1 || 
				srch_val.toLowerCase().indexOf('cookie') > -1 || 
				srch_val.toLowerCase().indexOf('onload') > -1 ||
				srch_val.toLowerCase().indexOf('src') > -1 ||
				srch_val.toLowerCase().indexOf('meta') > -1 ||
				srch_val.toLowerCase().indexOf('vbscript') > -1 ) {
			reselt = "N";
		}
		
        return reselt;
*/        
    }	
	
	
	//접속지역 save
	function goConnectLocationLogSave( gaddress, gaddress2 ) {
		
		var pdata =
	    {
				cmd : 'CONNECT_LOCATION_LOG_SAVE',
				areaname : gaddress+'',
				sigunguname : gaddress2+''
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
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}
	
	
	function setPrintContentLogSave( rcotid ) {
		
		var pdata =
	    {
				cmd : 'PRINT_CONTENT_LOG_SAVE',
				cotid : rcotid
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
			},
			error: function(xhr, textStatus, errorThrown) {
			}
		});
	}	

	function goTagOtherSectionLogSave( rtagid, rotdid, rsection ) {
		
		if( rtagid == '' || rtagid == null || rtagid == undefined ) {
		} else {

			var pdata =
		    {
					cmd : 'TAG_OTHER_SECTION_LOG_SAVE',
					tagid : rtagid,
					otdid : rotdid,
					section : rsection+''
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
				},
				error: function(xhr, textStatus, errorThrown) {
				}
			});
		}	
	}
	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}                
