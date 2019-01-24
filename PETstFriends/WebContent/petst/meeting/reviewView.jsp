<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
        	   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫프 모여라 후기게시판</title>
<%@ include file="/petst/header.jsp" %>
</head>
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
<body>
<style type="text/css">
.rereply_save {
/* 	background-color: #CD853F; */
/* 	color: white; */
	font-size: 15px;
	font-weight: bold;
	border: 1;
/* 	border-color: #CD853F; */
	border-radius: 5px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

tr:nth-child(odd) {
	border-top: 1px dashed gray;
}

tr:nth-child(1) {
	border-top: none;
}

th, td {
	text-align: left;
	padding: 10px;
}

h4 {
	font-family: 'NanumSquareRound', sans-serif;
}

ul, li {
	font-family: 'NanumSquareRound', sans-serif;
}

input::-ms-input-placeholder {
	color: #CD853F;
}

input::-webkit-input-placeholder {
	color: #CD853F;
}

input::-moz-placeholder {
	color: #CD853F;
}

.wrapper {
	font-family: 'NanumSquareRound', sans-serif;
}

#footer {
	font-family: 'NanumSquareRound', sans-serif;
}

.footer-widget-section {
	font-family: 'NanumSquareRound', sans-serif;
}

.main-content {
	position: relative;
	left: 22%;
	margin-left: -375px;
	text-align: center;
}

.chooseYourDesc a {
/* 	color: #fff; */
/* 	background-color: #FFD232; */
/* 	border: 1px solid #FFD232; */
	border-radius: 5px;
	font-family: 'NanumSquareRound', sans-serif;
	font-size: 15px !important;
	font-weight: bold;
	height: 35px;
	width: 130px;
	line-height: 35px;
	padding: 0;
	margin-right: 5px;
}

.chooseYourDesc a:hover {
/* 	color: #fff; */
/* 	border: 1px solid #d2d2d2; */
/* 	background-color: #d2d2d2; */
}

.reTD {
	width: 10%;
}

.btnTD {
	width: 20%;
}

a {
/* 	color: #BDBDBD; */
	cursor: pointer;
}
/* a { */
/* 	color: black; */
/* 	cursor: pointer; */
/* } */
.dropbtn{
	color: black;
	cursor: pointer;
}
.rereply_save, .reply_save, .reply_modi {
	margin: 5px 5px 6px;
	text-decoration: none;
/* 	border: 0; */
/* 	background-color: #dcdcdc; */
	position: relative;
	float: right;
	padding: 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
/* 	color: white; */
}

input[type="button"] {
	margin: 5px 5px 6px;
	text-decoration: none;
/* 	border: 0; */
/* 	background-color: #dcdcdc; */
	position: relative;
	float: right;
	padding: 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
/* 	color: white; */
}

.reComBtn, .modifyComBtn, .deleteComBtn {
/* 	border: 0; */
	/* opacity: 0.5; */
/* 	color: balck; */
/* 	background: #00ff0000; */
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #f9f9f9;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	font-size: 15px;
}

.dropdown-content a {
	color: black;
	padding: 6px 8px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #eeeeee;
}
#commentTable tr:nth-child(6) {
}
.close1{
	margin: 5px 5px 6px;
	text-decoration: none;
/* 	border: 0; */
	background-color: #dcdcdc;
	position: relative;
	height: 40px;
	padding : 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
	color: white;
	padding: 0.438em 0.625em 0.438em 0.625em;
}
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.window {
	display: none;
	position: absolute;
	left: 50%;
	top: 200px;
	margin-left: -300px;
	width: 600px;
	height: 370px;
	background-color: #FFF;
	z-index: 10000;
}
</style>
	<div class="wrapper">
		 <div class="container"style="border: 1px solid white; width:900px;">
			<br>
<div style="border-bottom: 2px solid brown; width: 33%;">
				<div style="border-bottom: 5px solid #FFD232; width: 70%;">
					<h2 style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold;">후기 게시판</h2>
				</div></div>
				<div style="height: 30px"></div>
<table class="table">
<tr align="center" style="font-family: 'monaco';" bgcolor="white">
<td width="100px;">
${review.meetingReview_no }
</td><td width="400px;">
${review.meetingReview_title }
</td><td width="100px;"></td>
<td  width="100px;">${review.meetingReview_writeDate }
</td><td  width="100px;"><span></span>
</td><td style="width: 100px">조회수 : ${review.meetingReview_count }</td>


</tr>
<tr><td colspan="6" align="left" height="200" width="700">
작성자 : ${review.meetingReview_nickname } 
					<br><br>
					<div><div style="width: 50px;  height: 20px;"></div><div style="padding-left:40px; height: 200px;">${review.meetingReview_content }</div></div>
						 <br> <br> <br>
						<div style="text-align: right; width: 100%;">
							<div class="bs-example">
								<!-- Button HTML (to Trigger Modal) -->
								<a
									href="writeReportForm.do?report_boardname=${freeBoard.freeBoard_boardname }&report_boardno=${freeBoard.freeBoard_boardno }&report_userId=${freeBoard.freeBoard_userId }"
									data-toggle="modal" data-target="#myModal" class="report">글 신고</a>

								<!-- Modal HTML -->
								<div id="myModal" class="modal fade">
									<div class="modal-dialog" style="background: white;">
										<div class="modal-header">
											<!-- 닫기(x) 버튼 -->
											<button type="button" class="close" data-dismiss="modal">×</button>
											<!-- header title -->
										</div>
										<div class="modal-body">
											<div class="modal-content">
												<!-- Content will be loaded here from "remote.php" file -->
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>

					</td></tr>
<tr><td  colspan="6" height="100px">

						<div class="LikesDiv" align="center">
						<c:if test="${user_idCheck!= null}">
						           <c:if test="${user_idCheck!= likeCheck.meetingLikes_userId()}">
									
									<i id="likebutton" style="font-size: 30px;  color: #FF895A; cursor: pointer;" class="fa fa-heart" ></i>
                                    </c:if>
                        
                                    <c:if test="${user_idCheck==likeCheck.meetingLikes_userId()}">		
									 <button id="likeDeletebutton" style="border:0; height:40px; background-color: #CD853F; border: none; padding: 5px 10px;
								      border-radius: 5px; color: white; font-size: 25px">좋아요 취소하기</button>
								      </c:if>
						</c:if>
			
								&nbsp;&nbsp;&nbsp;
								<button type="button"
									style="background: none; border-color: #FFD232; border-radius: 5px; text-transform: uppercase; transition: all .4s; height: 40px;">
									총 좋아요 수 <span id='like_cnt'>${likes }</span>
									Likes
								</button>
							</div>
</td></tr>
				<tr><td colspan="6" align="right">
<input type="button" id="hback"  value="뒤로가기">
<input type="button" onclick="location.href='meetingview.do?meeting_boardno=${review.meeting_boardno }&trigger=1'"  value="목록">
<form action="modifyReviewForm.do" style="display: inline">
<input type="hidden" name="meeting_boardno" value="${review.meeting_boardno }">
<input type="hidden" name="meetingReview_no" value="${review.meetingReview_no }">
<input style="margin:  5px 5px 6px; text-decoration: none; position: relative; float: right; padding: 0.438em 0.625em 0.438em 0.625em;
line-height: 1.125em; cursor: pointer; "type="submit" value="수정">
</form>
<form action="deleteReviewMBC.do" style="display: inline">
<input type="hidden" name="meeting_boardno" value="${review.meeting_boardno }">
<input type="hidden" name="meetingReview_no" value="${review.meetingReview_no }">
<input style="margin:  5px 5px 6px; text-decoration: none; position: relative; float: right; padding: 0.438em 0.625em 0.438em 0.625em;
line-height: 1.125em; cursor: pointer; " type="submit" value="삭제">
</form>
</td></tr>
	
</table>
<table id="commentTable" width="100%" align="center">
<tr><td id="comment" style="padding-left: 20px">
댓글
</td></tr>
<c:forEach items="${comment}" var="comment"><c:set var="thestring" value="${comment.reviewComment_content}"/><c:set var="thenum" value="0"/>
<tr id="${comment.reviewComment_commentno}"><c:if test="${fn:contains(thestring,'&nbsp&nbsp') }"><c:set var="thenum" value="1"/></c:if>
<c:choose>
<c:when test="${thenum ne 1 }">
<td  style="padding-left: 10px" colspan="2">
${comment.reviewComment_nickname }<br>
${comment.reviewComment_content}</td>
<td colspan="1" style="text-align:right; width:150px; padding-left: 30px; font-size: 9px; font-style: gray;">날짜 ${comment.reviewComment_writeDate }
<button class="reComBtn" id="recomment" value="${comment.reviewComment_commentno}/${comment.reviewComment_nickname }">답글</button> 
<button class="modifyComBtn" id="recommentmodify" value="${comment.reviewComment_commentno}/${comment.reviewComment_content}/${comment.reviewComment_nickname }/${comment.reviewComment_writeDate }">수정</button>
<button class="deleteComBtn" id="recommentdelete" value="${comment.reviewComment_commentno}/">삭제</button>
</td></c:when>

<c:when test="${thenum eq 1 }">
<td style="padding-left: 10px" colspan="2">
<div style="padding-left: 50px;"><i class="fa fa-level-up fa-rotate-90"></i>
${comment.reviewComment_nickname }<br> 
${comment.reviewComment_content}</div>
<td colspan="1" style="text-align:right; width:150px; padding-left: 30px; font-size: 9px; font-style: gray;">날짜 ${comment.reviewComment_writeDate }
<button class="reComBtn" id="recomment" value="${comment.reviewComment_commentno}/${comment.reviewComment_nickname }">답글</button> 
<button class="modifyComBtn" id="recommentmodify" value="${comment.reviewComment_commentno}/${comment.reviewComment_content}/${comment.reviewComment_nickname }/${comment.reviewComment_writeDate }">수정</button>
<button class="deleteComBtn" id="recommentdelete" value="${comment.reviewComment_commentno}/">삭제</button>
</td>
</c:when>
</c:choose>
</tr>
</c:forEach>
</table>
<div align="center" style="background-color: #FAFAFA;">
				<ul class="pagination">
				<c:if test="${start ne 1 }">
						<li><a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=1&tri=1">[처음]</a></li>
						<li><a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${start-1 }&tri=1">[이전]</a></li></c:if>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:if test="${i <= last}">
							<c:choose>
								<c:when test="${i == current  }">
								<li><a style="background-color: #eeeeee;">[${i }]</a></li>
							</c:when>
								<c:otherwise>
									<li><a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${i }&tri=1">[${i }]</a></li>
								</c:otherwise>
							</c:choose>
						</c:if></c:forEach>
						<c:if test="${start+9 < last }">
						<li><a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${end+1 }&tri=1">[다음]</a></li>
						<li><a href="reviewView.do?meeting_boardno=${review.meeting_boardno }&meetingReview_no=${review.meetingReview_no }&page=${last }&tri=1">[끝]</a></li></c:if>
					</ul>

<div id="mask"></div>
</div>
<%-- 			<c:if test="${user_idCheck != null }"> --%>
				<div id="testComment" class="top-comment"
					style="border: none; background-color: #FAFAFA;" align="center">
					<div style="border: none; background-color: #FAFAFA; width: 80%;">
					<!--top comment-->

						<p align="left" style="font-size: 16px;">
							닉네임${user_nickname}
						<p align="left">
							<textarea id="commentcontent" rows="3" cols="120"
								style="color: black; resize: none;" name="reply_content";
								placeholder="댓글을 입력하세요."></textarea>
						</p>
						<button class="reply_save" id="commentbtn">댓글 등록</button>
					</div>
				</div>
<%-- 					</c:if> --%>


<%-- <center> --%>
<!-- <table width="1000px"><tr><td> -->
<!-- <input type="button" id="hback"  value="뒤로가기"> -->
<%-- <input type="button" onclick="location.href='meetingview.do?meeting_boardno=${review.meeting_boardno }&trigger=1'"  value="목록"> --%>
<!-- <form action="modifyReviewForm.do" style="display: inline"> -->
<%-- <input type="hidden" name="meeting_boardno" value="${review.meeting_boardno }"> --%>
<%-- <input type="hidden" name="meetingReview_no" value="${review.meetingReview_no }"> --%>
<!-- <input type="submit" value="수정"> -->
<!-- </form> -->
<!-- <form action="deleteReviewMBC.do" style="display: inline"> -->
<%-- <input type="hidden" name="meeting_boardno" value="${review.meeting_boardno }"> --%>
<%-- <input type="hidden" name="meetingReview_no" value="${review.meetingReview_no }"> --%>
<!-- <input type="submit" value="삭제"> -->
<!-- </form> -->
<%-- </td></tr></table></center> --%>
</div>
		<div style="height: 30px;"></div>

		<br> <br>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(document).on('click', '#hback', function(event) {
		history.back();
	})
	$(document).on('click', '#likeDeletebutton', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		$.ajax({
			type : "get",
			url : "deleteReviewLikesMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno
			},
			success : function(data){
				$('#like_cnt').empty();
				
                $('#like_cnt').append(data.likes)
  
                location.reload();
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	});
	$(document).on('click', '#likebutton', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		$.ajax({
			type : "get",
			url : "ReviewLikesMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno
			},
			success : function(data){
				$('#like_cnt').empty();
				
                $('#like_cnt').append(data.likes)
                location.reload();
  
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	});
	$(document).on('click', '#recommentmodifybtn', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		var commentno = $(this).attr('value');
	    var recommentcontent = $('#recommentmodifycontent'+commentno).val();
		$.ajax({
			type : "get",
			url : "commentModifyReviewMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno,
				"reviewComment_commentno" : commentno,
				"reviewComment_content" : recommentcontent
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	});
	$(document).on('click', '#recommentdelete', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		var commentnonickname = $(this).attr('value');
		var spilt = commentnonickname.split('/');
		var commentno = spilt[0];
		$.ajax({
			type : "get",
			url : "commentDeleteReviewMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno,
				"reviewComment_commentno" : commentno
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	});

	$(document).on('click', '#recommentbtn', function(event) {
		var boardno = ${review.meeting_boardno };
		var reviewno = ${review.meetingReview_no}
		var commentnonickname = $(this).attr('value');
		var spilt = commentnonickname.split('/');
		var commentno = spilt[0];
		var nickname = spilt[1];
		var recommentcontent = $('#recommentcontent'+commentno).val();
		$.ajax({
			type : "get",
			url : "commentWriteReviewMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"reviewno" : reviewno,
				"reviewComment_commentno" : commentno,
				"reviewComment_nickname" : nickname,
				"reviewComment_content" : recommentcontent
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	})
	$(document).ready(function() {
		$(document).on('click', '#recommentmodify', function(event) {
			var recom = $(this).attr('value');
			var spilt = recom.split('/');
			var trid = spilt[0];
			var content = spilt[1];
			var nickname = spilt[2];
			var date = spilt[3]
			
			$('#'+trid+' *').remove();
			$('#'+trid).append(			
			"<td colspan=\"3\" style=\"padding-left: 20px;\" ><div><p align=\"left\" style=\"font-size: 16px;\">"+
			nickname+"</p><p align=\"right\" style=\"padding-right: 200px;\">"+
			"<textarea id=\"recommentcontent"+trid+"\"  rows=\"3\" cols=\"120\" style=\"width: 600px; display:inline-block; resize: none;\"\">"+content+
			"</textarea></p><p align=\"right\" style=\"padding-right: 150px;\"><button id=\"recommentbtn\" value=\""+trid+"\" >수 정</button></p></td>");
		})
		$(document).on('click', '#recomment', function(event) {
			var recom = $(this).attr('value');
			var spilt = recom.split('/');
			var commentno = spilt[0];
			$('#'+commentno+':last').after(
		"<tr><td colspan=\"3\" style=\"padding-left: 20px;\" ><div><p align=\"left\" style=\"font-size: 16px;\">"+
		"&nbsp<i class=\"fa fa-level-up fa-rotate-90\"></i>&nbsp user_nickname</p><p align=\"right\" style=\"padding-right: 200px;\">"+
		"<textarea id=\"recommentcontent"+commentno+"\"  rows=\"3\" cols=\"120\" placeholder=\"댓글을 입력하세요.\" style=\"width: 600px; display:inline-block; resize: none;\"\">"+
		"</textarea></p><p align=\"right\" style=\"padding-right: 150px;\"><button id=\"recommentbtn\" value=\""+recom+"\" >댓글 등록</button></p></td></tr>");
		})
		

		$('#commentbtn').click(function(){
			var boardno = ${review.meeting_boardno };
			var reviewno = ${review.meetingReview_no}
			var commentcontent = $('#commentcontent').val();
			$.ajax({
				type : "get",
				url : "commentWriteReviewMBC.do",
				data : {
					"meeting_boardno" : boardno,
					"reviewno" : reviewno,
					"reviewComment_content" : commentcontent
				},
				success : function(data){
					window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno+"&tri=1"
				},
				error : function(request){
					alert("에러 : "+request.status);
				}
			})	
		})
	})
	</script>
	
	<%@ include file="/petst/footer.jsp"%>
</body>
</html>