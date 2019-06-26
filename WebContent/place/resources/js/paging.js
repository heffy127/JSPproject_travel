
function Paging(page, totalcount, pagecnt, pageSize) {

	var pagingHTML 		= "";
	var startIndex		= Number(page);
	var page 			= Number(page);
	var totalCount		= Number(totalcount);
	var pageBlock		= Number(pagecnt);
	var navigatorNum    = Number(pageSize);
	var firstPageNum	= 1;
	var lastPageNum		= Math.floor((totalCount-1)/pageBlock) + 1;
	var indexNum		= startIndex <= navigatorNum  ? 0 : parseInt((startIndex-1)/navigatorNum) * navigatorNum;
	var nextPageNum		= page == lastPageNum ? lastPageNum : indexNum+Number(pageSize) + 1;
	var previewPageNum  = page == 1 ? 1 : indexNum-Number(pageSize) + 1;
	
	if (totalCount > 1) {

		if ( (startIndex > 1) && (lastPageNum > navigatorNum) && (page > navigatorNum) ) {
			pagingHTML += '<a href="javascript:" class="btn_first ico" id="'+firstPageNum+'">처음</a>';
			pagingHTML += '<a href="javascript:" class="btn_prev ico" id="'+previewPageNum+'">이전</a>';
		}


		for (var i=1; i<=navigatorNum; i++) {

			var pageNum = i + indexNum;

			if (pageNum == startIndex) {
				pagingHTML += "<a class='on' href='javascript:' id='"+pageNum+"'>"+pageNum+"</a> ";
			} else {
				pagingHTML += "<a href='javascript:' id='"+pageNum+"'>"+pageNum+"</a>  ";
			}	

			if (pageNum==lastPageNum) {
				break;
			}
		}


		if ( (startIndex < lastPageNum) && (lastPageNum > navigatorNum) ) {
			pagingHTML += '<a href="javascript:" class="btn_next ico" id="'+nextPageNum+'">다음</a>';
			pagingHTML += '<a class="btn_last ico" href="javascript:" id="'+lastPageNum+'">끝</a>';
		}

	}

	$(".page_box").html(pagingHTML);

	$(".page_box a").click(function (e) {
		spage = $(this).attr('id');
		hpage = spage;
		getContentList();
		//Paging($(this).attr('id'),totalcount, pagecnt, pageSize);
	});
	
}

function Paging2(kind, page, totalcount, pagecnt, pageSize) {

	var pagingHTML 		= "";
	var startIndex		= Number(page);
	var page 			= Number(page);
	var totalCount		= Number(totalcount);
	var pageBlock		= Number(pagecnt);
	var navigatorNum    = Number(pageSize);
	var firstPageNum	= 1;
	var lastPageNum		= Math.floor((totalCount-1)/pageBlock) + 1;
	var previewPageNum  = page == 1 ? 1 : page-pageSize;
	var nextPageNum		= page == lastPageNum ? lastPageNum : page+Number(pageSize);
	var indexNum		= startIndex <= navigatorNum  ? 0 : parseInt((startIndex-1)/navigatorNum) * navigatorNum;

	if (totalCount > 1) {

		if ( (startIndex > 1) && (lastPageNum > navigatorNum) && (page > navigatorNum) ) {
			pagingHTML += '<a href="javascript:" class="btn_first ico" id="'+firstPageNum+'">처음</a>';
			pagingHTML += '<a href="javascript:" class="btn_prev ico" id="'+previewPageNum+'">이전</a>';
		}


		for (var i=1; i<=navigatorNum; i++) {

			var pageNum = i + indexNum;

			if (pageNum == startIndex) {
				pagingHTML += "<a class='on' href='javascript:' id='"+pageNum+"'>"+pageNum+"</a> ";
			} else {
				pagingHTML += "<a href='javascript:' id='"+pageNum+"'>"+pageNum+"</a>  ";
			}	

			if (pageNum==lastPageNum) {
				break;
			}
		}


		if ( (startIndex < lastPageNum) && (lastPageNum > navigatorNum) ) {
			pagingHTML += '<a href="javascript:" class="btn_next ico" id="'+nextPageNum+'">다음</a>';
			pagingHTML += '<a class="btn_last ico" href="javascript:" id="'+lastPageNum+'">끝</a>';
		}

	}

	$(".page_box").html(pagingHTML);

	$(".page_box a").click(function (e) {
		spage = $(this).attr('id');
		getListShowcase(kind);
		//Paging($(this).attr('id'),totalcount, pagecnt, pageSize);
	});	
}