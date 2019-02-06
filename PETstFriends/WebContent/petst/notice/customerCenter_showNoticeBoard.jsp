<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="assets/images/favicon.png">

<title>공지사항</title>

<!-- common css -->
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

<!-- HTML5 shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.js"></script>
    <![endif]-->
<style type="text/css">
.sub {
	border-bottom: 1px solid red;
	padding-left: 15px;
	padding-top: 10px;
	font-size: 17px;
}

h4 {
	text-align: center;
	font-size: 30px;
	background: white;
}
input[type="button"]{
margin:  5px 5px 6px; 
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
$('#deleteBtn').click(function(){
	var result = confirm('삭제하시겠습니까?');
	if(result){
		location.href='deleteNoticeBoard.do?notice_boardno='+${notice_boardno};
	}
	else{
	}
})
});
</script>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
	<div class="container"style="border: 1px solid white; width:1200px;">
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
					style="border-left: 1px solid gray; width: 80%; display: inline-block;">
					<div style="border-bottom: 2px solid brown; width: 20%;">
					<div style="border-bottom: 5px solid #FFD232; width: 70%;">
					               <div style="border:1px solid white ;  height: 50px; ">
               <h2 align="left"><font style="font-family: 'NanumSquareRound', sans-serif ;font-size:20px;"> <b>공지사항</b> </font></h2>
					</div>
					</div>
					</div>
					<br>
					<div style="border: 1px solid white;">
						<div style="display: inline-block; width: 750px; text-align: right; ">
			<table class="table" >
				<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td></td>
					<td style="width: 400px; text-align: left;"><b>${noticeBoard.notice_title }</b></td>
					<td style="width: 100px"></td>
					<td style="width: 200px">	<c:set var="str1" value="${noticeBoard.notice_writeDate }"/>
						 ${fn:substringBefore(str1, '.0')} </td>
					<td style="width: 150px">조회수 : ${noticeBoard.notice_readCount }</td>
				</tr> 
				<tr>
				<td style="height: 100%;"></td>
					<td align="left" colspan="5" style="width:700px; height: 100%;">
					<br><br>
						${noticeBoard.notice_content } <br> <br> <br>
						</td>
						</tr>
						<tr>
									<td colspan="5">
						</td>
						</tr>
			</table>
				</div>
				</div>
								<div style="width: 750px; "align="right">
						<c:if test="${adminCheck != null}">
							<input type="button" id="deleteBtn" value="삭제">
							<input type="button" value="수정"
								onclick="location.href='modifyNoticeBoardForm.do?notice_boardno=${noticeBoard.notice_boardno }&page=${page }&type=${type }&keyword=${keyword }&numb=${numb }'">
						</c:if>
						<input type="button" value="목록"
							onclick="location.href='showNoticeList.do?page=${page }&type=${type }&keyword=${keyword }&numb=${numb }'">


					</div>


			</div>
		</div>
	</div>
	<!--main content end-->


	</div>
	</div>


	<!-- js files -->
	<script type="text/javascript" src="assets/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/smoothscroll.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.fitvids.js"></script>
	<script type="text/javascript" src="assets/js/jquery.stickit.min.js"></script>
	<script type="text/javascript" src="assets/js/scripts.js"></script>
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>