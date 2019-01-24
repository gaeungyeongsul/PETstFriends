<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">

<!-- favicon icon -->
<link rel="shortcut icon" href="./Boot/images/favicon.png">

<title>Dosg-square</title>

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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

</script>

<style type="text/css">
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
/* input[type="button"] { */
/*    margin: 5px 5px 6px; */
/*   text-decoration: none; */
/*   border : 0; */
/*    background-color : #dcdcdc; */
/*    position: relative; */
/*   float: right; */
/*   padding: 0.438em 0.625em 0.438em 0.625em; */
/*  line-height: 1.125em; */
/*   cursor: pointer;  */
/*   color: white; */
/* } */
/* input[type="submit"] { */
/*    margin: 5px 5px 6px; */
/*   text-decoration: none; */
/*   border : 0; */
/*    background-color : #dcdcdc; */
/*    position: relative; */
/* /*   float: right; */ */
/*   padding: 0.438em 0.625em 0.438em 0.625em; */
/*  line-height: 1.125em; */
/*   cursor: pointer;  */
/*   color: white; */
/* } */

h2,h4, ul, li {
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





</style>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	<div class="wrapper">
<div class="container"style="border: 1px solid white; width:900px;">
		<br>
<!-- 		게시글 3개 -->
		<div style="border-bottom: 2px solid brown; width: 22%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <div style="border:1px solid white ;  height: 50px; ">
               <h2 align="left"> <font style="font-size: 20px;"> <b>BEST 3</b></font> <font style="font-size: 15px;">♥</font></h2>
               </div>
               </div>
               </div>
	<div align="center"  style="width:880px; border: 1px solid white;">
	
		<div class="portfolio">
			<div style="width: 30px; height: 100px; border: 1px solid white;">
	</div>
				<!--begin portfolio items-->
				<c:forEach items="${selectBoardLike }"  var="freeBoard">
		<div class="portfolio-item" align="right"
						style="width: 250px; height: 340px; border: 1px solid white; align-items: center;" >
						<div style=" height: 200px;">

								<div style="width: 250px; height: 250px; border: 1px solid white;">
									${freeBoard.freeBoard_content}</div>
							</div>
						<div align="center" class="form-group">
<!-- 						<div class="col-md-4" align="center" style="text-align: left; height: 40px;"> -->
<!-- 								<h5> -->
<!-- 									<font -->
<!-- 										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #8B5927;"> -->
<!-- 										</font> -->
<!-- 								</h5> -->
<!-- 							</div> -->
						<div class="col-md-8" style="text-align: left; height: 200px;">
								<h5>
									<font
										style="font-family: 'NanumSquareRound', sans-serif; font-size:23px; color: #8B5927;">
										${freeBoard.freeBoard_title}</font>
								</h5>
							</div>
						</div>
<!-- 						마우스올리면 오버레이~~ -->
	<div class="img-overlay" style="width: 250px; height: 300px;">
							<div class="portfolio-text">
								<h4><font style="font-family: 'NanumSquareRound', sans-serif;"> <font style="font-size: 20px; ">♥</font>${freeBoard.freeBoard_LikeCount }</font></h4>
								<a 
									href="selectOneBoard.do?freeBoard_boardno=${freeBoard.freeBoard_boardno }&freeBoard_boardname=${freeBoard.freeBoard_boardname }&page=${current}&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">click</a>
							</div>
						</div>
					</div>
					</c:forEach>
		</div>
		

		</div>
		<div style="border-bottom: 2px solid brown; width: 22%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
             <div style="border:1px solid white ;  height: 50px; ">
               <h2 align="left"> <font style="font-size: 20px;"><b>고양이광장</b></font> </h2>
               </div>
               </div>
               </div>
<br>
				<table class="table" style="text-align: right:; width: 850px;">
					<thead align="center" style="text-align: right:;">
						<tr>
							<th style="width: 100px">글 번호</th>
							<th  style="width: 450px;">제 목</th>
							<th  style="width: 100px">작성자</th>
							<th  style="width: 150px">작성일</th>
							<th  style="width: 100px">조회수</th>
	<th><font style="font-size: 15px; ">♥</font></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${catFreeBoardList}" var="freeBoard">
							<tr>
								<td>${freeBoard.freeBoard_boardno }</td>
								<td style="text-align: left;"><a
									href="selectOneBoard.do?freeBoard_boardno=${freeBoard.freeBoard_boardno }&freeBoard_boardname=${freeBoard.freeBoard_boardname }&page=${current}&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">
										<c:if
											test="${freeBoard.freeBoard_title != null &&  freeBoard.freeBoard_title ne '' }">
					${freeBoard.freeBoard_title }
					</c:if> <c:if
											test="${freeBoard.freeBoard_title == null ||freeBoard.freeBoard_title eq '' }">
					제목없음
					</c:if>
								</a></td>
								<td>${freeBoard.freeBoard_nickname }</td>
								<td>${freeBoard.freeBoard_writeDate }</td>
								<%--  <fmt:formatDate value="${FreeBoard.freeBoard_writeDate}" pattern="yyyy-MM-dd" /> --%>
								<td>${freeBoard.freeBoard_readCount }</td>
									<td>${freeBoard.freeBoard_LikeCount }</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
				<div class="numbers" align="center"  style=" width: 850px;">
																		<div align="right">
						<c:if test="${user_idCheck !=null }">
											
							<input type="button" id="aaa"  value="글쓰기"
								onclick="location.href='writeCatFreeBoardForm.do'">
		
						</c:if>
					
					</div>
					<ul class="pagination">
								<!-- 			스타트 엔드 페이지는 페이지값 보고!  -->
								<c:if test="${start != 1 }">
								
									<li><a href="catFreeBoardList.do?page=1&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[처음]</a></li>
									<li><a href="catFreeBoardList.do?page=${start-1 }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[이전]</a></li>
								</c:if>
												<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
								<li><a style="background-color: #EBC680;">[${i }]</a></li>
							</c:when>
							<c:otherwise>
								<li><a
									href="catFreeBoardList.do?page=${i }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[${i }]</a></li>
							</c:otherwise>
							
						</c:choose>
					</c:forEach>
									<c:if test="${end < last}">
						<a
							href="catFreeBoardList.do?page=${end+1 }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[다음]</a>
						<a
							href="catFreeBoardList.do?page=${last }&type=${type }&keyword=${keyword }&startDate=${startDate}&endDate=${endDate}">[끝]</a>
					</c:if>
							</ul>
					

									
									<form action="catFreeBoardList.do">
		
<!-- 		여기부터 수정 -->
					
							<div style="width: 850px;"align="center">
									<select name="type" style="height: 26px;">
											<option value="0">검색어 선택</option>
											<option value="1">제목</option>
											<option value="2">내용</option>
											<option value="3">제목+내용</option>
											<option value="4">글쓴이</option>
									</select>


									<input type="text" name="keyword"
										style="height: 26px; width: 250px ;">

									<input type="submit" value="검색" style="height: 26px; width: 60px">
	</div>
					</form>
				</div>
				
				<input type="hidden" id="freeBoard.freeBoard_boardname"
			name="freeBoard.freeBoard_boardname"
			value=" freeBoard.freeBoard_boardname"> <input type="hidden"
			id="freeBoard_userId" name="freeBoard_userId"
			value="freeBoard.freeBoard_userId ">

				
				
				
				<br>
				<br>

			</div>
			<!-- div style 끝 -->

			<br> <br> <br> <br>

		</div>
		<!-- container끝 -->
	</div>
	<!-- wrapper끝 -->

	<%@ include file="/petst/footer.jsp"%>

	<!-- js files -->
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