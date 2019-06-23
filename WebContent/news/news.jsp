 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () { // 실시간 유튜브 목록 가져오는 코드
	$.ajax({
		url: 'https://www.youtube.com/feeds/videos.xml?channel_id=UCpM3JSTxMd3lC9WXYBwPRfA',
		dataType: 'xml',
		success: function (data) {
			var size = $(data).find("title").length
			var titleArr = new Array()
			var linkArr = new Array()		
			var i = 0
			$.each($(data).find("entry"), function (idx, val) { // 각각의 entry값을 가져오기
					var title = $(this).find("title").text()
					var link = $(this).find("link").attr('href') // href 속성 값 가져오기
					titleArr[i] = title
					linkArr[i] = link
					console.log(titleArr[i])
					console.log(linkArr[i])
			})
				
		}
	})
})
</script>
</head>
<body>
	<div id="title">
	</div>
	<br>
	<div id="link">
	</div>
</body>
</html>

	$.ajax({
				url: "board_editor_youtube.jsp",
				data: {
					"title" : titleArr,
					"link" : linkArr
				}
			})