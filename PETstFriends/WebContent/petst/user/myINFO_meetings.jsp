<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">
     <link rel="shortcut icon" href="./assets/images/favicon.png">
      <link rel="shortcut icon" href="./assets/images/favicon.png">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>내가 참여한 모임 글 </title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
    <link rel="stylesheet" href="./Boot/css/bootstrap.min.css">
    <link rel="stylesheet" href="./Boot/css/font-awesome.min.css">
    <link rel="stylesheet" href="./Boot/css/animate.min.css">
    <link rel="stylesheet" href="./Boot/css/owl.carousel.css">
    <link rel="stylesheet" href="./Boot/css/owl.theme.css">
    <link rel="stylesheet" href="./Boot/css/slicknav.css">
    <link rel="stylesheet" href="./Boot/style.css">
    <link rel="stylesheet" href="./Boot/css/responsive.css">
    

</head>
<!-- <style> -->
<!-- /* .layer{ */ -->
<!-- /*   position:absolute; */ -->
<!-- /*   top:50%;  */ -->
<!-- /*   left:40%;  */ -->
<!-- /*   width:400px; */ -->
<!-- /*   height:300px; */ -->
<!-- /*   background:; */ -->
<!-- /*   margin:-50px 0 0 -50px; */ -->
<!-- /* } */ -->

<!-- </style> -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">


</script>
<style type="text/css">
    .bs-example{
    	margin: 10px;
    	
    }
.nav  {
  display: table;
  margin-left: auto;
  margin-right: auto;
}
 @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;

article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	background-color: #white;
	padding: 20px 10px;
}

table {
	width: 100%;
	background-color: transparent;
}

th {
	background-color: #CD853F;
	border: none;
	color: white;
}

th, td {
	/* 	border: 1px gray solid; */
	text-align: center;
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: #EBC680;
}

tr a:hover {
	color: #EBC680;
}

.button {
	float: right;
	padding: 10px;

}

h2,h4, ul, li {
	font-family: 'NanumSquareRound', sans-serif;
}

input::-ms-input-placeholder {
	color: #EBC680;
}

input::-webkit-input-placeholder {
	color: #EBC680;
}

input::-moz-placeholder {
	color: #EBC680;
}

.wrapper {
	font-family: 'NanumSquareRound', sans-serif;
}
</style>
<body>


<div class="wrapper">
 
<!--        <header id="header"> -->
<%@ include file="/petst/header.jsp" %>
    <!--header section end-->
<div class="bs-example">
	<ul class="nav nav-tabs navbar-" style ="font-weight:bold;">
        <li><a href="userPwCheck.do">내정보수정</a></li>
        <li ><a href="myWritesList.do">내가쓴게시글</a></li>
        <li ><a href="myinquiry.do">내가문의한글</a></li>
         <li ><a href="myLikesList.do">내가좋아요한글</a></li>
          <li class="active"><a href="myMeetingApply.do">내가참여한모임</a></li>
	</ul>
</div>

<center>

<colgroup>
<col width = "7%">
<col width = "*%">
<col width = "17%">
<col width = "10%">
<col width = "7%">

</colgroup>



	<div class="wrapper">
		<div class="container"style="border: 1px solid white; width:900px;">
		<table class = "table">
		

	<tr>
				
			<th style="width:700px;text-align:left; ">제 목</th>
				<th style="width:150px; text-align:center;">작성자</th>
				<th style=" width:200px; text-align:center;">작성일</th>
			
				
	</tr>
	
<c:forEach items="${myMeetingApplyList}" var="like">
				<tr>
							<td style = "text-align:left;">
		<c:if test="${empty like.title}"><a href="meetingview.do?meeting_boardno=${like.boardno}">제목없음</a></c:if>
		<c:if test="${not empty  like.title}"><a href="meetingview.do?meeting_boardno=${like.boardno}">${ like.title }</a></c:if>	
					<input type="hidden" value = "${like.meeting_boardno}"  id = "boardno">
					
					</td>
				
				
				
					<td align="center">${like.userId }</td>
					<td align="center">
<%-- 					<fmt:parseDate value ="${like.writeDate }" var = "wriedate" pattern = "yyyyMMdd" ></fmt:parseDate> --%>
<%-- 					<fmt:formatDate value="${like.writeDate }" pattern="yyyy-MM-dd" /> --%>
					${like.writeDate }
					</td> 
							
				
				</tr>
</c:forEach>
			</table>
			
		
		<ul class="pagination">
					<c:if test="${start != 1 }">
						<li><a href="myMeetingApply.do?page=1">[처음]</a></li>
						<li><a href="myMeetingApply.do?page=${start-1 }">[이전]</a></li>
					</c:if>
					
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
									<li><a style="background-color: #EBC680;">[${i }]</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="myMeetingApply.do?page=${i }">[${i }]</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${end != last }">
						<li><a href="myMeetingApply.do?page=${end+1 }">[다음]</a></li>
						<li><a href="myMeetingApply.do?page=${last }">[끝]</a></li>
					</c:if>
			
				
	</ul>

</div>

</center>

<!--   <footer id="footer"> -->
<%@ include file="/petst/footer.jsp" %>
    <!--footer end-->
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