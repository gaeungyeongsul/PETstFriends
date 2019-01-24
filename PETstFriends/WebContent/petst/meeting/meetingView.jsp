<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="model.MeetingComment"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="model.MeetingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫프 모여라 게시판</title>

<%@ include file="/petst/header.jsp"%>
</head>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
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
<style type="text/css">
.rereply_save {
	background-color: #CD853F;
	color: white;
	font-size: 15px;
	font-weight: bold;
	border: 1;
	border-color: #CD853F;
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
	/* 	left: 22%; */
	/* 	margin-left: -375px; */
	text-align: center;
}

.chooseYourDesc a {
	color: #fff;
	background-color: #FFD232;
	border: 1px solid #FFD232;
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
	color: #fff;
	border: 1px solid #d2d2d2;
	background-color: #d2d2d2;
}

.reTD {
	width: 10%;
}

.btnTD {
	width: 20%;
}

a {
	color: #BDBDBD;
	cursor: pointer;
}
/* a { */
/* 	color: black; */
/* 	cursor: pointer; */
/* } */
.dropbtn {
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

input[type="submit"] {
	margin: 5px 5px 6px;
	text-decoration: none;
/* 	border: 0; */
/* 	background-color: #dcdcdc; */
	position: relative;
	/*   float: right; */
	padding: 0.438em 0.625em 0.438em 0.625em;
	line-height: 1.125em;
	cursor: pointer;
/* 	color: white; */
}

#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

#mask2 {
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
	top: 50px;
	margin-left: -500px;
	width: 1000px;
	height: 700px;
	background-color: #FFF;
	z-index: 10000;
}

.window2 {
	display: none;
	position: absolute;
	left: 50%;
	top: 300px;
	margin-left: -300px;
	width: 600px;
	height: 220px;
	background-color: #FFF;
	z-index: 10000;
}
.window3 {
	display: none;
	position: absolute;
	left: 50%;
	top: 100px;
	margin-left: -300px;
	width: 600px;
	height: 500px;
	background-color: #FFF;
	z-index: 10000;
}
</style>
<body>
	<div class="wrapper">
		<div class="main-content">
			<div class="container" style="border: 1px solid white; width: 900px;">
				<div class="row">
					<%
						MeetingBoard meeting = (MeetingBoard) request.getAttribute("meeting");
						String place = meeting.getMeetingBoard_place();
						StringTokenizer values = new StringTokenizer(place, "/");
						String place1 = values.nextToken();
						String place2 = values.nextToken();
					%>
					<div style="border-bottom: 2px solid brown; width: 34%;">
						<div style="text-align:left; border-bottom: 5px solid #FFD232; width:70%;">
							<h2  style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold;" id="moim">모임 게시판</h2>
						</div>
					</div>
					<div style="background: rgba(22, 18, 13, 0.001); border: 1px solid #eeeeee; border-radius: 25px;" align="center">

						<table>
							<tr>
								<td width="350px;" rowspan="8" id="proPic"><img
									src="img/${meeting.meetingBoard_proPic}" width="350"
									height="350"></td>
								<td colspan="2" id="title" height="50px" align="center"><h2
										style="margin-top: 0px; color: black; font-family: 'NanumSquareRound', sans-serif; font-weight: bold;">${meeting.meetingBoard_title}</h2></td>
							</tr>

							<tr>
								<td width="140" style="font-size: 20px;" align="center"><img
									width="20px" height="20px" src="img/meeting-icon.png">모임
									기간 :</td>
								<td id="meetingdate" height="50"
									style="font-size: 20px; padding-left: 20px">${meeting.meetingBoard_startMeetingDate }
									~ ${meeting.meetingBoard_endMeetingDate }</td>
							</tr>
							<tr>
								<td width="140" style="font-size: 20px;" align="center"><img
									width="20px" height="20px" src="img/place-icon.png">모임장소
									:</td>
								<td id="place" height="50"
									style="font-size: 20px; padding-left: 20px"><%=place1%> <%=place2%></td>
							</tr>
							<tr>
								<td width="140" style="font-size: 20px;" align="center"><img
									width="20px" height="20px" src="img/meeting-icon.png">신청기간
									:</td>
								<td id="acceptdate" height="50"
									style="font-size: 20px; padding-left: 20px">${meeting.meetingBoard_startAcceptingDate }
									~ ${meeting.meetingBoard_endAcceptingDate }</td>
							</tr>
							<tr>
								<td rowspan="2" align="right" style="text-align: left; font-size: 20px;">개설자
									정보 &nbsp</td>
<!-- 							</tr> -->
<!-- 							<tr> -->
								<td height="30px"
									style="text-align: left; font-size: 20px; padding-left: 15px"><img
									width="20px" height="20px" src="img/tel-icon.png">${meeting.meetingBoard_phone}</td>
<!-- 							</tr> -->
							<tr>
								<td height="30px"
									style="text-align: left; font-size: 20px; padding-left: 15px"><img
									width="20px" height="20px" src="img/email-icon.png">${meeting.meetingBoard_email}</td>
							</tr>
							<tr>
								<td style="font-size: 20px;" align="center">
								<img width="20px" height="20px" src="img/accept-icon.png">신청인원 : </td>

								<td id="applyinone" height="50"
									style="font-size: 20px; padding-left: 15px">
									${applycount }명 신청중
									
					    <c:if test="${user_idCheck !=null }">
					    <c:if test="${user_idCheck==meeting.meetingBoard_userId}">
					    				<button class="openMask3" style="display: inline; font-size: 20px">신청자 목록</button>
											<div class="window3">
											<center>
												<p style="font-size: 20px;">
												※신청자 목록
												</p>
												<table><tr><td width="100px"></td>
												<td>신청자 닉네임</td>
												<td>신청자 이메일</td>
												<td  width="100px"></td>
												</tr>
												<c:forEach items="${applyinone}" var="applyinone">
                                                 <tr><td></td>
                                                 <td>applyinone.meetingBoardApply_nickname</td>
                                                 <td>applyinone.meetingBoardApply_email</td>
                                                 <td></td></tr>
					                            </c:forEach>
					                           </table>
												 <br>
												<button class="close3"
													style=" padding: 5px 10px; font-size: 20px">닫기</button>
											</center>
										</div>
					    
					    </c:if>
					     <c:if test="${user_idCheck!= meeting.meetingBoard_userId}">
									<button class="openMask2" style="display: inline; font-size: 20px">신청하기</button>
								<div class="window2">
											<br>
											<center>
												<a style="color: #00BFFF; font-size: 33px;">※신청하기를
													누를시, 모임 개최자에게 <br> 닉네임과 이메일 정보가 전달됩니다.
												</a><br> <br>
												<button id="applybutton"
													style="height: 50px;  padding: 5px 10px;  font-size: 20px">신청하기</button>
												<button class="close2"
													style="height: 50px;  padding: 5px 10px;  font-size: 20px">닫기</button>
											</center>
										</div>
										 <c:if test="${user_idCheck== applyCheck.meetingBoardApply_userId}">
										 <button id="applyDeletebutton"
											style="height: 50px;  border: none; padding: 5px 10px; border-radius: 5px; font-size: 20px">신청취소</button>
										 </c:if>
										
										

										
										
										
						</c:if>
						</c:if>
						<c:if test="${user_idCheck==null }">
						</c:if>
									
									

</td>
							</tr>



						</table>



						<table width="900px" height="400px">
							<tr>
								<td><br></td>
							</tr>


							<tr>
								<td id="contentview" width="200px" height="50px"
									style="font-size: 20px; cursor: pointer; border: #dcdcdc solid 1px"
									align="center" onmousedown="fnMove('#content')">모임상세 정보</td>
								<td id="mapview" width="200px"
									style="font-size: 20px; cursor: pointer; border: #dcdcdc solid 1px"
									align="center" onmousedown="fnMove('#mapview')">지도 보기</td>
								<td id="commentview" width="200px"
									style="font-size: 20px; cursor: pointer; border: #dcdcdc solid 1px"
									align="center" onmousedown="fnMove('#comment')">댓글 보기</td>
								<!-- <td id="applyview" height="50" style="cursor: pointer;">참여신청/취소 안내</td> -->
								<td id="reviewview" width="200px" height="50" align="center"
									style="font-size: 20px; border: #dcdcdc solid 1px"><div
										id="mask"></div>
									<div class="window">
										<div style="border-bottom: 2px solid brown; width: 33%;">
											<div style="border-bottom: 5px solid #FFD232; width: 70%;">
											
												<h2 style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold;">후기 게시판</h2>	
		
											</div>
										</div>
										<div style="height: 30px;"></div>
										<table id="listTable" width="1000px">
											<thead align="center" style="text-align: center;">
												<tr style="text-align:center; background-color: #CD853F; color: white;">
													<th style="width: 100px">글 번호</th>
													<th style="width: 470px;">제 목</th>
													<th style="width: 100px">작성자</th>
													<th style="width: 150px">작성일</th>
													<th style="width: 80px">조회수</th>
												</tr>
											</thead>


											<c:forEach items="${review}" var="review">
												<tr height="50px" class="reviewtr"
													style="font-size: 15px; cursor: pointer; border-bottom: 1px solid #ddd; text-align:center;"
													onclick="location.href='reviewView.do?meeting_boardno=${meeting.meeting_boardno }&meetingReview_no=${review.meetingReview_no }'">
													<td>${review.meetingReview_no }</td>
													<td>${review.meetingReview_title }</td>
													<td>${review.meetingReview_nickname }</td>
													<td>${review.meetingReview_writeDate }</td>
													<td>${review.meetingReview_count }</td>
												</tr>

											</c:forEach>

										</table>
			<div>
									<div align="right">
						<c:if test="${user_idCheck !=null }">
										
							<input style="font-size: 14px;" type="button" id="aaa"  value="글쓰기"
								onclick="location.href='writeReviewForm.do?meeting_boardno=${meeting.meeting_boardno }'">
		<input type="button" style="font-size: 14px;" class="close1" value="닫기">
						</c:if>
			</div>
					</div>	
<div align="center" style="background-color: #FAFAFA;">
				<ul class="pagination">
				<c:if test="${start ne 1 }">
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=1&&trigger=1">[처음]</a></li>
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${start-1 }&&trigger=1">[이전]</a></li></c:if>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:if test="${i <= rlast}">
							<c:choose>
								<c:when test="${i == rcurrent  }">
								<li><a  style="background-color: #eeeeee;">[${i }]</a></li>
							</c:when>
								<c:otherwise>
									<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${i }&&trigger=1">[${i }]</a></li>
								</c:otherwise>
							</c:choose>
						</c:if></c:forEach>
						<c:if test="${start+9 < rlast }">
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${end+1 }&trigger=1">[다음]</a></li>
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&rpage=${rlast }&trigger=1">[끝]</a></li></c:if>
					</ul>
</div>

									</div> <!--                 팝업내용 끝//리뷰 --> <a href="#"
									class="openMask" id="re"
									style="font-size: 20px; cursor: pointer; color: black">모임후기</a>
								<td></td>
							</tr>
							<tbody>
								<tr>
									<td id="content" colspan="5" height="300px;"
										style="text-align: left; min-height: 300px; padding-left: 20px">
										${meeting.meetingBoard_content }</td>
								</tr>
								<tr>
									<td colspan="1"	width="200px"style="font-size: 20px; cursor: pointer; "
									align="center">
										지도 보기</td>
									
								</tr>
								<tr>
									<td colspan="5">
										<div id="map" style="width: 100%; height: 450px;"></div>
									</td>
								</tr>
							</tbody>
						</table>

						<table>
							<tr>
								<td align="right"><input type="button"
									onclick="location.href='meeting.do'" value="목록"
									style="margin: 5px 5px 6px; text-decoration: none; position: relative; float: right; padding: 0.438em 0.625em 0.438em 0.625em; line-height: 1.125em; cursor: pointer; ">
									<c:if test="${user_idCheck==meeting.meetingBoard_userId}">
									<form action="modifyForm.do" style="display: inline">
										<input type="hidden" name="meeting_boardno"
											value="${meeting.meeting_boardno }"> 
											<input
											type="submit" value="수정"
											style="margin: 5px 5px 6px; text-decoration: none; position: relative; float: right; padding: 0.438em 0.625em 0.438em 0.625em; line-height: 1.125em; cursor: pointer;">
									</form>
										
									<form action="deleteMBC.do" style="display: inline">
										<input type="hidden" name="meeting_boardno"
											value="${meeting.meeting_boardno }"> <input
											type="submit" value="삭제"
											style="margin: 5px 5px 6px; text-decoration: none; position: relative; float: right; padding: 0.438em 0.625em 0.438em 0.625em; line-height: 1.125em; cursor: pointer;">
									</form></c:if></td>
							</tr>
						</table>

						<table id="commentTable" width="100%" align="center">
							<tr>
								<td id="comment" style="padding-left: 20px">댓글</td>
							</tr>

							<c:forEach items="${comment}" var="comment">
								<c:set var="thestring" value="${comment.meetingComment_content}" />
								<c:set var="thenum" value="0" />
								<tr id="${comment.meetingComment_commentno}">
									<c:if test="${fn:contains(thestring,'&nbsp&nbsp') }">
										<c:set var="thenum" value="1" />
									</c:if>
									<c:choose>
										<c:when test="${thenum ne 1 }">
											<td  style="padding-left: 10px" colspan="1">
												${comment.meetingComment_nickname }<br>
												&nbsp&nbsp&nbsp${comment.meetingComment_content}</td>
											<td  colspan="1"	width="200px;"	
											style="text-align: right; padding-left: 30px; font-style: gray;">날짜
												${comment.meetingComment_writeDate }	
												 <c:if test="${user_idCheck !=null }">											
													<button id="recomment" class="reComBtn"
														value="${comment.meetingComment_commentno}/${comment.meetingComment_nickname }">답글</button>
														</c:if>
														<c:if test="${user_idCheck== comment.meetingComment_userId}">
													<button id="recommentmodify" class="modifyComBtn"
														value="${comment.meetingComment_commentno}/${comment.meetingComment_content}/${comment.meetingComment_nickname }/${comment.meetingComment_writeDate }">수정</button>
													<button id="recommentdelete" class="deleteComBtn"
														value="${comment.meetingComment_commentno}/">삭제</button>
														</c:if>
												</td>
										</c:when>

										<c:when test="${thenum eq 1 }">
											<td id="modify${comment.meetingComment_commentno}">
												<div style="padding-left: 50px;">
													<i class="fa fa-level-up fa-rotate-90"></i>
													${comment.meetingComment_nickname }<br>

													&nbsp&nbsp&nbsp${comment.meetingComment_content}
												</div>
											</td>
											<td 
												style="text-align:right; width: 150px; padding-left: 30px;  font-style: gray">
												<div>
													날짜 ${comment.meetingComment_writeDate }<br>
													   <c:if test="${user_idCheck !=null }">
													<button id="recomment" class="reComBtn"
														value="${comment.meetingComment_commentno}/${comment.meetingComment_nickname }">답글</button>
														</c:if>
													<c:if test="${user_idCheck== comment.meetingComment_userId}">	
													<button id="recommentmodify" class="modifyComBtn"
														value="${comment.meetingComment_commentno}/${comment.meetingComment_content}/${comment.meetingComment_nickname }/${comment.meetingComment_writeDate }">수정</button>
													<button id="recommentdelete" class="deleteComBtn"
														value="${comment.meetingComment_commentno}/">삭제</button>
														</c:if>
												</div>
											</td>
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</table>
				<div align="center" style="background-color: #FAFAFA;">
				<ul class="pagination">
				<c:if test="${start ne 1 }">
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=1&tri=1">[처음]</a></li>
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${start-1 }&tri=1">[이전]</a></li></c:if>
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:if test="${i <= last}">
							<c:choose>
								<c:when test="${i == current  }">
								<li><a style="background-color: #eeeeee;">[${i }]</a></li>
							</c:when>
								<c:otherwise>
									<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${i }&tri=1">[${i }]</a></li>
								</c:otherwise>
							</c:choose>
						</c:if></c:forEach>
						<c:if test="${start+9 < last }">
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${end+1 }&tri=1">[다음]</a></li>
						<li><a href="meetingview.do?meeting_boardno=${meeting.meeting_boardno }&page=${last }&tri=1">[끝]</a></li></c:if>
					</ul>

<div id="mask"></div>
</div>			
					<div id="testComment" class="top-comment"
					style="border: none; background-color: #FAFAFA;" align="center">
					<div style="border: none; background-color: #FAFAFA; width: 80%;">
					<!--top comment-->
   <c:if test="${user_idCheck !=null }">
						<p align="left" style="font-size: 16px;">
							닉네임${user_nickname}
						<p align="left">
							<textarea id="commentcontent" rows="3" cols="120"
								style="color: black; resize: none;" name="reply_content";
								placeholder="댓글을 입력하세요."></textarea>
						</p>
						<button class="reply_save" id="commentbtn">댓글 등록</button>
						</c:if>
					</div>
				</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ne3L3fT_ARphRLHIt9DR&submodules=geocoder"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script type="text/javascript">

function wrapWindowByMask(){	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    
    //윈도우 같은 거 띄운다.
    $(".window").show();
    fnMove('#moim');
}
function wrapWindowByMask2(){	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    
    //윈도우 같은 거 띄운다.
    $(".window2").show();
    fnMove('#moim');
}
function wrapWindowByMask3(){	 
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);    
    //윈도우 같은 거 띄운다.
    $(".window3").show();
    fnMove('#moim');
}
function fnMove(se){
    var offset = $(se).offset();
    $('html, body').scrollTop(offset.top);
}
var trigge = ${trigge};
if(trigge==1){
	wrapWindowByMask();
}
var tri = ${tri};
if(tri==1){
	fnMove('#comment');
}
var triapply=${triapply};
if(triapply==1){
	fnMove('#proPic');
}

$(document).on('click', '#applyDeletebutton', function(event) {
	var boardno = ${meeting.meeting_boardno };
	$.ajax({
		type : "get",
		url : "deleteApplyMBC.do",
		data : {
			"meeting_boardno" : boardno
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&triapply=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});
$(document).on('click', '#applybutton', function(event) {
	var boardno = ${meeting.meeting_boardno };
	$.ajax({
		type : "get",
		url : "insertApplyMBC.do",
		data : {
			"meeting_boardno" : boardno
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&triapply=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});

$(document).on('click', '#recommentmodifybtn', function(event) {
	var boardno = ${meeting.meeting_boardno };
	var commentno = $(this).attr('value');
    var recommentcontent = $('#recommentmodifycontent'+commentno).val();
	$.ajax({
		type : "get",
		url : "commentModifyMBC.do",
		data : {
			"meeting_boardno" : boardno,
			"meetingComment_commentno" : commentno,
			"meetingComment_content" : recommentcontent
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});
$(document).on('click', '#recommentdelete', function(event) {
	var boardno = ${meeting.meeting_boardno };
	var commentnonickname = $(this).attr('value');
	var spilt = commentnonickname.split('/');
	var commentno = spilt[0];
	$.ajax({
		type : "get",
		url : "commentDeleteMBC.do",
		data : {
			"meeting_boardno" : boardno,
			"meetingComment_commentno" : commentno
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
});

$(document).on('click', '#recommentbtn', function(event) {
	var boardno = ${meeting.meeting_boardno };
	var commentnonickname = $(this).attr('value');
	var spilt = commentnonickname.split('/');
	var commentno = spilt[0];
	var nickname = spilt[1];
	var recommentcontent = $('#recommentcontent'+commentno).val();
	$.ajax({
		type : "get",
		url : "commentWriteMBC.do",
		data : {
			"meeting_boardno" : boardno,
			"meetingComment_commentno" : commentno,
			"meetingComment_nickname" : nickname,
			"meetingComment_content" : recommentcontent
		},
		success : function(data){
			window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
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
		var boardno = ${meeting.meeting_boardno };
		var commentcontent = $('#commentcontent').val();
		$.ajax({
			type : "get",
			url : "commentWriteMBC.do",
			data : {
				"meeting_boardno" : boardno,
				"meetingComment_content" : commentcontent
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.boardno+"&tri=1"
				fnMove('#comment');
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})	
	})
    //검은 막 띄우기
    $(".openMask").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
    });
	$(".openMask2").click(function(e){
        e.preventDefault();
        wrapWindowByMask2();
    });
	$(".openMask3").click(function(e){
        e.preventDefault();
        wrapWindowByMask3();
    });

    //닫기 버튼을 눌렀을 때
    $(".window .close1").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window").hide();
    });   
    $(".window2 .close2").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window2").hide();
    });  
    $(".window3 .close3").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window3").hide();
    });  

    //검은 막을 눌렀을 때
    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();
        $(".window2").hide();
        $(".window3").hide();  
    });      


var map = new naver.maps.Map("map", {
	    center: new naver.maps.LatLng(37.3595316, 127.1052133),
	    zoom: 10,
	    mapTypeControl: true
	});
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});
	map.setCursor('pointer');
	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
//	            return alert('Something Wrong!');
	        }

	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);

	            
	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                addrType +' '+ item.address +'<br>',
	                '</div>'
	            ].join('\n'));
	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}
  

	function initGeocoder() {
	    map.addListener('click', function(e) {
<%-- 	        searchCoordinateToAddress('<%=place1%>'); --%>
	    });

	    searchAddressToCoordinate('<%=place1%>');
	}

	naver.maps.onJSContentLoaded = initGeocoder;
});
</script>
	<%@ include file="/petst/footer.jsp"%>
	<script type="text/javascript" src="./Boot/js/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="./Boot/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./Boot/js/smoothscroll.js"></script>
	<script type="text/javascript" src="./Boot/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="./Boot/js/imagesloaded.pkgd.js"></script>
	<script type="text/javascript" src="./Boot/js/isotope.2.2.2min.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery.fitvids.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery.stickit.min.js"></script>
	<script type="text/javascript" src="./Boot/js/jquery.slicknav.js"></script>
	<script type="text/javascript" src="./Boot/js/scripts.js"></script>
</body>
</html>