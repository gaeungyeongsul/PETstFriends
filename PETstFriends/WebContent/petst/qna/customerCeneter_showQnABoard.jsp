<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">
<title>1:1문의</title>
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
<style type="text/css">

/* input[type="button"] { */
/* 	border: 0; */
/* 	/* opacity: 0.5; */ */
/* 	color: balck; */
/* 	background: #00ff0000; */
/* 	float: right; */
/* 	cursor: pointer; */
/* } */
/* button{ */
/* 	border: 0; */
/* 	/* opacity: 0.5; */ */
/* 	color: balck; */
/* 	background: #00ff0000; */
/* 	float: right; */
/* 	cursor: pointer; */
/* } */
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var commentDis = function(){
			if(${qnA.qnA_reply == null }){
				$('#replyBox').css('display', 'inline');
				$('#replySucBox').css('display', 'none');
			}else{
				$('#replyBox').css('display', 'none');
				$('#replySucBox').css('display', 'inline');
			}
		}
		commentDis();
		var commentContent = '${qnA.qnA_reply}';
		$('#replyBtn').click(function(){
			var qnA_reply = $('#qnA_reply').val();
			commentContent = qnA_reply;
			$.ajax({
				type : 'GET',
				url : 'writeQnAComment.do',
				data : {
					"qnA_reply" : qnA_reply,
					"qnA_boardno" : ${qnA_boardno}
				},
				success : function(data) {
					$('#replySucBox').css('display', 'inline');
					$('#replySpan').append(qnA_reply);
					$('#qnA_reply').empty();
					$('#replyBox').css('display', 'none');
					
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
		})
		
		$('#modifyCom').click(function(){
			alert(commentContent)
			$('#replyBox').css('display', 'inline');
			$('#replySpan').empty();
			$('#replySucBox').css('display', 'none');
			$('#qnA_reply').val(commentContent)
		})
		
		$('#deleteCom').click(function(){
			var result = confirm('삭제하시겠습니까?');
			if(result){
			$.ajax({
				type : 'GET',
				url : 'writeQnAComment.do',
				data : {
					"qnA_boardno" : ${qnA_boardno}
				},
				success : function(data) {
					$('#replyBox').css('display', 'inline');
					$('#replySpan').empty();
					$('#replySucBox').css('display', 'none');
					commentContent = '';
					$('#qnA_reply').val(commentContent);
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});
			}else{
			}
		})
		
		$('#deleteBtn').click(function(){
			var result = confirm('삭제하시겠습니까?');
			if(result){
				location.href='deleteQnABoard.do?qnA_boardno='+${qnA_boardno};
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
               <h2 align="left"><font style="font-family: 'NanumSquareRound', sans-serif ;font-size:20px;"> <b>1:1 문의</b> </font></h2>
					</div>
					</div>
					</div>
					<br>
					
									<div style="height: 200px;">
						<div style="display: inline-block; height: 180px; width: 750px; text-align: right;  ">
			<table class="table" >
				<tr align="center" style="font-family: 'monaco';" bgcolor="white">
				<td></td>
					<td style="width: 400px; text-align: left;"><b>${qnA.qnA_title }</b></td>
					<td style="width: 100px"></td>
					<td style="width: 200px">	<c:set var="str1" value="${qnA.qnA_writeDate }"/>
						${qnA.qnA_writeDate }</td>
	
				</tr> 
				<tr>
				<td></td>
					<td align="left" colspan="5" style="height:100px; width:700px;">
					<br><br>
						${qnA.qnA_content  } <br> <br> <br>
						</td>
						</tr>
<!-- 						<tr> -->
<!-- 									<td colspan="5"> -->
<!-- 						</td> -->
<!-- 						</tr> -->
			</table>
				</div>
				</div>
					
					
					

<%-- 					<h2 style="text-align: center;">${qnA.qnA_title }</h2> --%>
<!-- 					<div style="display: inline-block; height: 20px; width: 48%;"> -->
<%-- 						 ${qnA.qnA_writeDate }</div> --%>
<!-- 					<div style="border-bottom: 1px solid red; height: 5px;"></div> -->
<!-- 					<div style="height: 20px;"></div> -->
<%-- 					<div class="post-thumb">${qnA.qnA_content }</div> --%>
<!-- 					<div style="border: 1px solid red;"></div> -->
				
							<div class="bottom-comment" style="background-color: #FAFAFA; height: 200px; width: 780px;">
<!-- 							<div class="leave-comment" -->
<!-- 						style=" width:850px; height:150px;  background-color: #FAFAFA;"> -->
								<div id="replyBox">
									<div class="form-group">
										<div class="col-md-12">
										<div style="height: 20px;"></div>
											<textarea class="form-control" rows="10" id="qnA_reply" style="width: 700px; height:100px; "
												name="qnA_reply "></textarea><br>
										</div>
										<br>
										<div style="width : 700px;" align="right">
									<button type="button" id="replyBtn">답하기</button>
									<input type="button" id="deleteBtn" value="글삭제">
								<input type="button" value="목록"
									onclick="location.href='showQnAList.do?page=${page }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }'">
									</div>
									</div>
								</div>
														<div style="height: 20px;"></div>
														<div style="border: 1px solid #bebebe;  height:50%;">
							<div id="replySucBox" >
							<br>
								<span id="replySpan" style="width: 100%; height:150px;" >
								${qnA.qnA_reply }
								</span>
						
							</div>
							</div>
								<div style="height: 20px;"></div>
												<div class="text-center" style="text-align: right; width: 740px; ">
																<button id="deleteCom">답변삭제</button>
								<button id="modifyCom">답변수정</button>
								<input type="button" id="deleteBtn" value="글삭제">
								<input type="button" value="목록"
									onclick="location.href='showQnAList.do?page=${page }&boardname=${boardname }&type=${type }&keyword=${keyword }&numb=${numb }'">
	
						</div>
				
		
<!-- 						<div style="height: 20px;"></div> -->
<!-- 					</div> -->
		
			</div>
				



				</div>
			</div>
		</div>
		</div>
		</div>
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