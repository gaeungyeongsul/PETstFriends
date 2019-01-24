<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Rubel Miah">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boot/images/favicon.png">
    
	<title> 꿀 TIP 글쓰기 페이지</title>
	   
	    <!-- common css -->
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">    
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
<script type="text/javascript"
	src="./naverEditor/WebContent/resources/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>	
<script type="text/javascript">
$(function() {
	//전역변수
	var obj = [];
	//스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : obj,
		elPlaceHolder : "editor",
		sSkinURI : "./naverEditor/WebContent/resources/editor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부
			bUseVerticalResizer : false,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부
			bUseModeChanger : true,
		}
	});
	//전송버튼
	$("#write-btn").click(function() {
		if($('#tipBoard_title').val().replace(/ /g, '') == "" ){
		    alert('제목을 입력해주세요.');
		}else{
		//id가 smarteditor인 textarea에 에디터에서 대입
		obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		//폼 submit
		$("#insertTipBoardFrm").submit();
		}
	});
});
</script>

<style type="text/css">
#title {
	font-family: 'Merriweather', serif;
	font-size: 14px;
	font-weight: 700;
	line-height: 60px;
	padding: 0 22px;
	letter-spacing: 0.5px;
	color: #666666;
}
.wrapper {
	font-family: 'NanumSquareRound', sans-serif;
	}
	th{
	text-align: center;
	}
/* @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); */

/* @import */
/* 	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css') */
/* 	; */

/* table { */
/* 	width: 100%; */
/* 	background-color: transparent; */
/* } */

/* th, td { */
/* 	/* 	border: 1px gray solid; */ */
/* 	text-align: center; */
/* 	padding: 8px */
/* } */

/* ul, li { */
/* 	font-family: 'NanumSquareRound', sans-serif; */
/* } */

/* input::-ms-input-placeholder { */
/* 	color: #CD853F; */
/* } */

/* input::-webkit-input-placeholder { */
/* 	color: #CD853F; */
/* } */

/* input::-moz-placeholder { */
/* 	color: #CD853F; */
/* } */

/* .wrapper { */
/* 	font-family: 'NanumSquareRound', sans-serif; */
/* } */

/* #footer { */
/* 	font-family: 'NanumSquareRound', sans-serif; */
/* } */

/* .footer-widget-section { */
/* 	font-family: 'NanumSquareRound', sans-serif; */
/* } */

/* .write-btn { */
/* 	font-family: 'NanumSquareRound', sans-serif; */
/* 	font-weight: bold; */
/* 	height: 34px; */
/* 	width: 130px; */
/* 	 background-color:#CD853F; */
/* 	/*     margin: 30px 0; */ */
/* 	/*     padding: 20px; */ */
/* 	color:white; */
/* 	border: 1px solid #eeeeee; */
/* 	border-radius: 0; */
/* 	/*     text-transform: uppercase; */ */
/* 	/*     transition: all .4s; */ */
/* 	font-size: 16px; */
/* 	line-height: 34px; */
/* 	padding: 0; */
/* 	margin: 0; */
/* 	-webkit-transition: all 0.3s; */
/* 	-moz-transition: all 0.3s; */
/* 	-o-transition: all 0.3s; */
/* 	transition: all 0.3s; */
/* 	border:1; border-color:#CD853F; border-radius: 5px;" > */
	
/* } */


/* #filebox label { */
/* 	display: inline-block; */
/* /* 	padding: .5em .75em; */ */
/* 	color: #999; */
/* 	font-size: inherit; */
/* 	line-height: normal; */
/* 	vertical-align: middle; */
/* 	background-color: #fdfdfd; */
/* 	cursor: pointer; */
/* 	border: 1px solid #ebebeb; */
/* 	border-bottom-color: #e2e2e2; */
/* 	border-radius: .25em; */
/* } */

/* #filebox input[type="file"] { /* 파일 필드 숨기기 */ */
/* 	position: absolute; */
/* 	width: 1px; */
/* 	height: 1px; */
/* 	padding: 0; */
/* 	margin: -1px; */
/* 	overflow: hidden; */
/* 	clip: rect(0, 0, 0, 0); */
/* 	border: 0; */
/* } */
</style>	
</head>
<body>
<%@ include file="/petst/header.jsp"%>
<div class="wrapper">
    <!--main content start-->

           <div class="container"style="border: 1px solid white; width:900px;">
         	<form action="WriteTipBoard.do" enctype="multipart/form-data" method="post" class="form-horizontal contact-form" id="insertTipBoardFrm">                   
							<div 
								style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; color: #CD853F;">
								<!--leave comment-->
								<div class="heading-text text-center text-uppercase">
							<div style="border-bottom: 2px solid brown; width: 33%;">
               <div style="border-bottom: 5px solid #FFD232; width: 70%;">
               <div style="border:1px solid white ;  height: 50px; ">
								<h2
										style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; font-size: 20px; color: black">
						<c:if test="${tipBoard_boardname eq '7'}">
							강아지
						</c:if> 
						<c:if test="${tipBoard_boardname eq '8'}">
						고양이
						</c:if>
						<c:if test="${tipBoard_boardname eq '9'}">
						토끼
						</c:if>
										 꿀 TIP 정보 쓰기 </h2>
								</div></div></div></div></div>
								<br>
								<input type="hidden" 
												id="tipBoard_nickname" name="tipBoard_nickname"
												placeholder="${nickName}" readonly="readonly">
<!-- 												<input type="hidden"  id="tipBoard_title" -->
<!-- 												name="tipBoard_title" placeholder="title"> -->
												<jsp:useBean id="toDay" class="java.util.Date" />
											<input type="hidden" 
												id="tipBoard_writeDate" name="tipBoard_writeDate"
												value="<fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" />"
												readonly="readonly">
												
												

									<div style="width:850px ; border: 1px solid white;">
									<div style="height: 20px;"></div>
									<table class="table">

									<tr>
								<th style="background-color: #EBC680">제목</th>
											<td class="title"><input type="text" id="tipBoard_title"
												name="tipBoard_title" maxlength="100" style="width: 74%;"
									class="txt"></td>
										</tr>
										
									
								<tr>
									<th style="background-color: #bebebe; align-items: baseline;">	 썸네일</th>
												<td class="title"><input type="file"
												id="tipBoard_contentPic" name="tipBoard_contentPic"
												placeholder="미리보기로 보여질 썸네일사진을 등록하세요" maxlength="100" style="width: 74%;"
									class="txt" value=""></td>
									</tr>
								
									<tr>
									<th style="background-color: #bebebe; align-items: baseline;"> Youtube</th>
											<td class="title"><input type="text" 
												id="tipBoard_YoutubeUrl" name="tipBoard_YoutubeUrl"
												placeholder="첨부하실 Youtube URL을 입력하세요" maxlength="100" style="width: 74%;"
									class="txt" value=""></td>
												</tr>
									
									<tr>
									<th style="background-color: #bebebe; align-items: baseline;">내용</th>
											<td colspan="2"><textarea name="editor" id="editor" style="width: 99%; height: 350px;  border: none;"></textarea></td>
										</tr>
									<tr>	
								<td><input type="hidden" id="tipBoard_boardname" name="tipBoard_boardname"
										value="${tipBoard_boardname}" /> </td></tr>
									
								

								     </table>
						
							<!--end leave comment-->
				
                          <center>
                               <input type="submit" value="글 작성" class="write-btn" id="write-btn">
                              <input type="button" value="목록으로"  class="write-btn" onclick="location.href='TipBoardList.do?tipBoard_boardname=${tipBoard_boardname}'"></a>
                                <input type="button" value="뒤로가기"  class="write-btn"  onclick="history.back();">
                          
                </center>
                     </div>
                     

					</form>	
				
             </div>
        </div>
 
    <!--main content end-->
    

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