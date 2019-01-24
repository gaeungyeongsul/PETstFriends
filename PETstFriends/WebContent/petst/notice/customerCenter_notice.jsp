<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
<link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
<link rel="stylesheet" href="./Boot/css/animate.min.css">
<link rel="stylesheet" href="./Boot/css/owl.carousel.css">
<link rel="stylesheet" href="./Boot/css/owl.theme.css">
<link rel="stylesheet" href="./Boot/css/slicknav.css">
<link rel="stylesheet" href="./Boot/style.css">
<link rel="stylesheet" href="./Boot/css/responsive.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<style type="text/css">
a {
	color: black;
}

a:hover {
	color: gray;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(function() {});
</script>

<body>

	<%@ include file="/petst/header.jsp"%>

	<div class="wrapper">
	<div class="container" style="border: 1px solid white; width:1200px;">
		<br>
		<div class="main-content">
			<div class="container1" style="background: white;">
					<div class="col-md-4 col-sm-5"
						style="display: inline-block; width: 20%;">
						<div class="widget" style="font-family: 'NanumSquareRound', sans-serif ;">
		<font style="font-family: 'NanumSquareRound', sans-serif ; font-size: 30px;"> 고객센터 </font><br>
							<ul>
								<li><a href="showNoticeList.do">공지사항</a></li>
								<li><a href="showOftenQnAList.do">자주하는 질문</a></li>
								<li><a href="qnA.do">1:1 문의</a></li>
							</ul>
						</div>
					</div>

				<div class="col-md-8 col-sm-8" 
					style="border-left: 1px solid #bebebe; width: 80%; display: inline-block;">
					<div style="border-bottom: 2px solid brown; width: 20%;">
					<div style="border-bottom: 5px solid #FFD232; width: 70%;">
					               <div style="border:1px solid white ;  height: 50px; ">
               <h2 align="left"><font style="font-family: 'NanumSquareRound', sans-serif ;font-size:20px;"> <b>공지사항</b> </font></h2>
					</div>
					</div>
					</div>
					<br>
					<div style="width: 800px;">
					<form action="showNoticeList.do" style="text-align: center;">
						<select name="type" style="height: 27px;">
							<option value="0">검색어 선택</option>
							<option value="1">제목으로 검색</option>
							<option value="2">내용으로 검색</option>
							<option value="3">제목,내용으로 검색</option>
						</select> <input type="text" name="keyword" style="height: 27px; color: black; cursor: text;">
						<select name="numb" style="height: 27px;">
							<option value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</select> <input type="submit" value="검색하기">
		

					</form>
					</div>
									<br>
					<table class="table" style="width: 800px;">
						<thead style="text-align: center">
							<tr>
							
								<th style="text-align:center;" width="100px">글 번호</th>
								<th style="text-align: center">제목</th>
								<th style="text-align: center;">글쓴이</th>
								<th style="text-align: center">작성일</th>
								<th style="text-align: center;">조회수</th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
							<c:forEach items="${noticeList }" var="notice">
								<tr>
									<td>${notice.notice_boardno }</td>
									<td width="50%;" align="left"><a
										href="showNoticeBoard.do?notice_boardno=${notice.notice_boardno }&page=${current}&type=${type }&keyword=${keyword }&numb=${numb }">
											${notice.notice_title }</a></td>
									<td>관리자</td>
									<%-- 								${notice.notice_adminId } --%>
									<td><c:set var="str1" value="${notice.notice_writeDate }" />
										${fn:substringBefore(str1, '.0')}</td>
									<td>${notice.notice_readCount }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
<div style="text-align: right; width:790px;">
						<div id="writeBox"></div>
						<c:if test="${adminCheck != null}">
							<input type="button" value="글쓰기"
								onclick="location.href='writeNoticeBoardForm.do'">
						</c:if>
					</div>

					<div align="center" style="width: 800px;">
						<ul class="pagination">
							<c:if test="${start != 1 }">
								<li><a
									href="showNoticeList.do?page=1&type=${type }&keyword=${keyword }&numb=${numb }">[처음]</a></li>
								<li><a
									href="showNoticeList.do?page=${start-1 }&type=${type }&keyword=${keyword }&numb=${numb }">[이전]</a></li>
							</c:if>
							<c:forEach begin="${start }" end="${end }" var="i">
								<c:choose>
									<c:when test="${i == current }">
										<li><a style="background-color: #EBC680">[${i }]</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="showNoticeList.do?page=${i }&type=${type }&keyword=${keyword }&numb=${numb }">
												[${i }]</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${end < last}">
								<li><a
									href="showNoticeList.do?page=${end+1 }&type=${type }&keyword=${keyword }&numb=${numb }">[다음]</a></li>
								<li><a
									href="showNoticeList.do?page=${last }&type=${type }&keyword=${keyword }&numb=${numb }">[끝]</a></li>
							</c:if>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
		</div>
	</div>



	<%@ include file="/petst/footer.jsp"%>
</body>
</html>