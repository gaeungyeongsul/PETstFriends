<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    	   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫프 모여라 후기 글쓰기</title>
	<%@ include file="/petst/header.jsp" %>
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
<style type="text/css">
#title {
	font-family: 'Merriweather', serif;
	font-size: 14px;
	font-weight: 700;
 	line-height: 30px;
	padding: 0 22px;
	letter-spacing: 0.5px;
	color: #666666;
}
</style>
<body>
<script type="text/javascript" src="naverEditor/js/naverEditor.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="naverEditor/WebContent/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
			<div class="wrapper">
		<div class="container" style="border: 1px solid white; width: 900px;">
		<br>
				<div style="border-bottom: 2px solid brown; width: 25%;">
               <div style="border-bottom: 5px solid #FFD232; width: 630px;">
               <h2 style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold;">펫프 모여라 후기 글쓰기 !</h2>
               <input type="hidden" id="meeting_boardno" value="${meeting_boardno }">
               </div>
               </div>
				<div style="height:500px; width: 90%;">

					<form action="writeCatFreeBoard.do" method="post"
						id="insertBoardFrm" enctype="multipart/form-data">
						<div style="height: 20px;"></div>
						<table class="table">
							<tr>
								<th style="background-color: #EBC680">제목</th>
								<td align="left" class="title"><input type="text" 
									id="title" maxlength="23" style="width: 94%; "
									></td>
							</tr>
							<tr>
								<th style="background-color: #bebebe; align-items: baseline;">내용</th>
								<td colspan="2"><textarea name="ir1" id="ir1"
										style="width: 99%; height: 350px;  border: none;" ></textarea></td>
							</tr>
						</table>
		
						<div style="height: 10px;"></div>
						<div align="center"></div>
					</form>
				</div>
<center>
				<input type="button" id="insertBoard" onclick="submitContents(this);" value="등록" />
				<input type="button" id="insertBoard" onclick="location.href='meetingview.do?meeting_boardno=${meeting_boardno }&trigger=1'" value="취소" />
</center>
	</div>
		<!-- container끝 -->
	</div>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
var oEditors = [];

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "naverEditor/WebContent/resources/editor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
	var title = $("#title").val();
	var content = $("#ir1").val();
	var boardno = $("#meeting_boardno").val();
		$.ajax({
			type : "get",
			url : "writeReviewMBC.do",
			data : {
				"meetingReview_title" : title,
				"meetingReview_content" : content,
				"meeting_boardno" : boardno
			},
			success : function(data){
				window.location.href="http://localhost:8080/PETstFriends/reviewView.do?meeting_boardno="+data.boardno+"&meetingReview_no="+data.reviewno
						
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})
}
</script>
<%@ include file="/petst/footer.jsp"%>
</body>
</html>