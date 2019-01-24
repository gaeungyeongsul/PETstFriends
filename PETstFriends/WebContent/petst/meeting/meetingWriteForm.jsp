<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Ne3L3fT_ARphRLHIt9DR&submodules=geocoder"></script>
<title>펫프 모여라 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
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
<body>

<!-- 프로필사진 업로드  -->
<script type="text/javascript">
function getThumbnailPrivew(input, targetId) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var element = window.document.getElementById(targetId);
            element.setAttribute("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function filterNumner(event){
	event.preventDefault();
}

</script>
<style>
 input[type="date"]::-webkit-inner-spin-button {
     display: none;
     appearance: none;
 }
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;

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
</style>
<div class="wrapper">
 <div class="main-content">
        <div class="container"  style="border: 1px solid white; width: 900px;">
            <div class="row">
             <article class="post" style="border: 1px solid #eeeeee;">

					<div style="border-bottom: 2px solid brown; width: 22%;">
						<div style="text-align:left; border-bottom: 5px solid #FFD232; width: 630px;">
							<h2 style="font-family: 'NanumSquareRound', sans-serif; font-weight: bold; ">펫프 모여라 글쓰기</h2>
						</div>
					</div>
					<div style="background: rgba(22, 18, 13, 0.001); border: 1px solid #eeeeee; border-radius: 25px;" align="center">


<table>
<tr>
<td width="350px" height="350px" rowspan="5">
<img alt="프로필 사진" src="Boots/images/user-empty.png" id="avatar_image"  width="350px" height="350px">
<form id="fileForm" action="fileUpload" method="post" enctype="multipart/form-data">
<input width="350px" height="350px" type="file" id="fileUp" name="fileUp" style="display:inline;" accept=".bmp, .gif, .jpg, .png" onchange="getThumbnailPrivew(this, 'avatar_image');">
</form>
</td>
</tr>

<tr><td width="140px" style="font-weight: bold; background-color:#dcdcdc; color:black; border:1; border-color:#CD853F;"> 모임명 </td><td width="410px;" height="50">
<input type="text"  id="title" maxlength="23" style="width: 400px; height: 40px; padding-left:10px; font-size: 16px;
background-color:white; color:black; border:1; border-color:#dcdcdc; border-radius:5px;"></td></tr>
<%SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd"); String dat = date.format(new Date()); %>
<%int day=1000*60*60*24; String dat2 = date.format((new Date().getTime()/day+1)*day); %>
<tr><td width="140px" style="padding-left:10px; font-weight: bold; background-color:#dcdcdc; color:black; border:1; border-color:#dcdcdc;"> 모임일시 </td><td height="50" >
<input class="dat" id="startmeetingdate" type="date" min="<%=dat2 %>" value="<%=dat2 %>" onkeydown="filterNumner(event);" style="
background-color:white; color:black; border:1; width: 125px;height:30px; border-color:#dcdcdc; border-radius:5px;">
<select class="dat"  id="startmeetingdate2" style="background-color:white; color:#black; border:1; width: 60px;height:30px; border-color:#dcdcdc; border-radius:5px;">
<%
int a0=0;
String b0="00";
int c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
}
%>
<option value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
<%} %>

</select> ~ <input class="dat"  id="endmeetingdate" type="date" min="<%=dat2 %>" value="<%=dat2 %>" onkeydown="filterNumner(event);" style="
background-color:white; color:black; border:1; width: 125px;height:30px; border-color:#dcdcdc; border-radius:5px;">
<select class="dat"  id="endmeetingdate2" style="background-color:white; color:black; border:1; width: 60px;height:30px; border-color:#dcdcdc; border-radius:5px;">
<%
a0=0;
b0="00";
c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
} %>
<option value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
<%} %>
</select>

</td></tr>

<tr><td width="140px" style="padding-left:10px; font-weight: bold; background-color:#dcdcdc; color:black; border:1; border-color:#dcdcdc;"> 접수기간 </td><td id="acceptdate" height="50" >
<input class="dat"  id="startmeetingacceptdate" type="date" min="<%=dat %>" value="<%=dat %>" onkeydown="filterNumner(event);" style="
background-color:white; color:black; border:1; width: 125px;height:30px; border-color:#dcdcdc; border-radius:5px;">
<select class="dat"  id="startmeetingacceptdate2" style="background-color:white; color:black; border:1; width: 60px;height:30px; border-color:#dcdcdc; border-radius:5px;">
<%
a0=0;
b0="00";
c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
}
%>
<option  
 value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
<%} %>
</select>
 ~ <input class="dat"  id="endmeetingacceptdate" type="date" min="<%=dat %>" value="<%=dat %>" onkeydown="filterNumner(event);" style="
background-color:white; color:black; border:1; width: 125px;height:30px; border-color:#dcdcdc; border-radius:5px;">
 <select class="dat"  id="endmeetingacceptdate2" style="background-color:white; color:black; border:1; width: 60px;height:30px; border-color:#dcdcdc; border-radius:5px;">
 <%
 a0=0;
 b0="00";
 c=1;
for(int i =0; i<48;i++){
	b0="00";
	if(i%2==1){
		b0="30";
	}
if(i!=0&&i%2==0){
a0 = i-c;
c++;
}
%>
 <option value="<%=a0%>:<%=b0%>"><%=a0%>:<%=b0%></option>
 <%} %>
 </select>
</td></tr>
<tr><td style="padding-left:10px; font-weight: bold; background-color:#dcdcdc; color:black; border:1; border-color:#CD853F;" > 모임장소 </td><td id="place">
<form name="form" id="form" method="post">
	<table style="width: 410px; "  >
			<tbody>
				<tr height="50px">
					<td style="border-color:#CD853F; border-radius:5px;padding: 5px; background-color:white; color:black; border:1; border-color:#dcdcdc; border-radius:5px;" >도로명주소</td>
					<td><input type="button"  value="주소검색" onclick="goPopup();" style=" padding: 5px 10px; 
									 border-radius: 5px; "></td>
			   </tr><tr>
					<td colspan="2"><input type="hidden" id="confmKey" name="confmKey" value=""  >
					<input readonly="readonly" type="text" id="roadAddrPart1" style="width:400px; background-color:white; color:black; font-family: 'NanumSquareRound',sans-serif; padding: 4px; border:1; 
	border-color:#dcdcdc; border-radius: 5px;"></td></tr>
				<tr>
					<td colspan="2" width="140" style="background-color:white; color:black; border:1; border-color:#dcdcdc; border-radius:5px;" >상세주소<input type="hidden" id="btn"></td></tr>
					<tr><td colspan="2">
						<input type="text" id="addrDetail" style="width:400px; background-color:white; color:#CD853F; font-family: 'NanumSquareRound',sans-serif; padding: 4px; border:1; 
	border-color:#dcdcdc; border-radius: 5px;" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form>
</td></tr>
</table>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="naverEditor/js/naverEditor.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="naverEditor/WebContent/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>


<table style="margin: auto; width: 100%; border-color:#CD853F;"><tr><td>
<tr>
<td width="100%" height="50" style="font-size:16px; font-weight: bold; background-color:#dcdcdc; color:black; border-radius:5px;">모임상세 내용 입력</td></tr>
<tr><td>
	<textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:400px; display:none; background-color:white;"></textarea>
	<p align="center">
		<input type="button" onclick="location.href='meeting.do'" style="font-size: 14pt" value="취소" />
		<input type="button" onclick="submitContents(this);" style="font-size: 14pt" value="개설 완료" />
</p>
</td></tr></table>	
</div>
</article>
</div>
</div>
</div>
</div>






<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">

$(document).mouseup(".dat", function(){
	setInterval(function() {
		var sd = $("#startmeetingdate").val();
		var ed = $("#endmeetingdate").val();
		var sd2 = $("#startmeetingdate2").val();
		var ed2 = $("#endmeetingdate2").val();
		var sad = $("#startmeetingacceptdate").val();
		var ead = $("#endmeetingacceptdate").val();
		var sad2 = $("#startmeetingacceptdate2").val();
		var ead2 = $("#endmeetingacceptdate2").val();
		if(sad>ead){
			$("#endmeetingacceptdate").val(sad);
			ead = $("#endmeetingacceptdate").val();
		}
		if(sad2>ead2){
			if(sad==ead){
				$("#endmeetingacceptdate2").val("-");
				ead2=$("#endmeetingacceptdate2").val();
			}
		}
		if(sd<=ead){
			$("#startmeetingdate").val(ead);
			$("#startmeetingdate2").val(ead2);
			sd=$("#startmeetingdate").val();
			sd2=$("#startmeetingdate2").val();
		}
		if(sd>ed){
			$("#endmeetingdate").val(sd);
			ed=$("#endmeetingdate").val();
		}
		if(sd2>ed2){
			if(sd==ed){
				$("#endmeetingdate2").val("-");
			}
		}
	}, 1000);

	
})




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
	var startmeetingdate = $("#startmeetingdate").val();
	var endmeetingdate = $("#endmeetingdate").val();
	var startmeetingacceptdate = $("#startmeetingacceptdate").val();
	var endmeetingacceptdate = $("#endmeetingacceptdate").val();
	var startmeetingdate2 = $("#startmeetingdate2").val();
	var endmeetingdate2 = $("#endmeetingdate2").val();
	var startmeetingacceptdate2 = $("#startmeetingacceptdate2").val();
	var endmeetingacceptdate2 = $("#endmeetingacceptdate2").val();
	var place = $("#roadAddrPart1").val()+"/"+$("#addrDetail").val();
		$.ajax({
			type : "post",
			url : "writeMBC.do",
			data : {
				"title" : title,
				"content" : content,
				"place" : place,
				"startmeetingdate" : startmeetingdate,
				"startmeetingdate2" : startmeetingdate2,
				"endmeetingdate" : endmeetingdate,
				"endmeetingdate2" : endmeetingdate2,
				"startmeetingacceptdate" : startmeetingacceptdate,
				"startmeetingacceptdate2" : startmeetingacceptdate2,
				"endmeetingacceptdate" : endmeetingacceptdate,
				"endmeetingacceptdate2" : endmeetingacceptdate2
			},
			success : function(data){
				fileSubmit();
				window.location.href="http://localhost:8080/PETstFriends/meetingview.do?meeting_boardno="+data.meeting.meeting_boardno
						
			},
			error : function(request){
				alert("에러 : "+request.status);
			}
		})
}
function fileSubmit() {
    var formData = new FormData($("#fileForm")[0]);
    $.ajax({
        type : 'post',
        url : 'fileUpload.do',
        data : formData,
        processData : false,
        contentType : false,
        success : function(html) {
//             alert("파일 업로드하였습니다.");
        	 console.log(html);
        },
        error : function(error) {
//             alert("파일 업로드에 실패하였습니다.");
            console.log(error);
        }
    });
}
  function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	    var pop = window.open("petst/meeting/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	    
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
							, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		$('#btn').trigger("click");
	}
  $(document).ready(function() {
  var map = new naver.maps.Map("map", {
	    center: new naver.maps.LatLng(37.3595316, 127.1052133),
	    zoom: 10,
	    mapTypeControl: true
	});


	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});

	map.setCursor('pointer');

    
	// search by tm128 coordinate
	function searchCoordinateToAddress(latlng) {
	    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
	    infoWindow.close();

	    naver.maps.Service.reverseGeocode({
	        location: tm128,
	        coordType: naver.maps.Service.CoordType.TM128
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        var items = response.result.items,
	            htmlAddresses = [];
            document.getElementById('roadAddrPart1').value = items[0].address;
	        for (var i=0, ii=1, item, addrType; i<ii; i++) {
	            item = items[i];
	            htmlAddresses.push(item.address);
	        }

	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                htmlAddresses.join('<br />'),
	                '</div>'
	            ].join('\n'));

	        infoWindow.open(map, latlng);
	    });
	}

	// result by latlng coordinate
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
// 	            return alert('Something Wrong!');
	        }

	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);

	            
	        infoWindow.setContent([
	                '<div style="padding:10px;min-width:200px;line-height:150%;">',
	                addrType +' '+ item.address +'<br />',
	                '</div>'
	            ].join('\n'));
	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}
    

	function initGeocoder() {
	    map.addListener('click', function(e) {
	        searchCoordinateToAddress(e.coord);
	    });
	    $('#btn').on('click', function(e) {
	        e.preventDefault();

	        searchAddressToCoordinate($('#roadAddrPart1').val());
	    });
	    searchAddressToCoordinate('서울');
	}

	naver.maps.onJSContentLoaded = initGeocoder;
  });

      </script>
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