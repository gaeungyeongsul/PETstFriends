<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.awt.Window"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content=" ">
    <meta name="author" content="ShapedTheme">

<!-- favicon icon -->
<link rel="shortcut icon" href="assets/images/favicon.png">
<title>header</title>
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
    <link rel="stylesheet" href="./Boot/css/weather-icons.css">
    <link rel="stylesheet" href="./Boot/css/weather-icons-wind.css">
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 보기
$(document).on('click', '#msgview', function(event) {
	 var msg_no = $(this).find('input[type="hidden"]').val();
	$.ajax({
		type : "get",
		url : "showMsg.do",
		data:{
			"msg_no" : msg_no
		},
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>thead').empty();
			$('#msgtable>thead:last').append(
			"<tr><th  style=\"text-align: center;\" width=\"80px;\">쪽지 번호</th><th style=\"text-align: center;\">제 목</th><th  style=\"text-align: center;\">보낸 날짜</th></tr>"+
			"<tr><td  style=\"text-align: center;\" width=\"80px;\" height=\"50px\">"+data.showMsg.msg_no+ "</td>"+			
			"<td style=\"text-align: center; width=\"380px;\">"+data.showMsg.msg_title+"</td><td width=\"150px\">"+data.showMsg.msg_sendDate+
			"</td></tr><td colspan=\"3\" style=\"padding-left:20px;\" width=\"580px\"  height=\"245px\">"+data.showMsg.msg_contents+"</td></tr>");
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})
});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지함 목록 출력
$(document).on('click', '#msg', function(e) {
$.ajax({
		type : "get",
		url : "showMsgList.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>thead').empty();
			$('#msgtable>thead:last').append("<tr style=\"text-align: center;\"><th colspan=\"2\" width=\"70px\">쪽지번호</th><th width=\"250px\">쪽지 제목</th><th>보낸사람</th><th>보낸 날짜</th></tr>");
			var cur;
			if(10>data.showMsgList.length){
				cur=data.showMsgList.length;
			}else{
				cur=10;
			}
			for(var i = 0; i<cur;i++){
			$('#msgtable>thead:last').append(
			"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgList[i].msg_no+"\"></td>"+
			"<td width=\"55px;\" height=\"30px\">"+data.showMsgList[i].msg_no+			
			"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgList[i].msg_no+"\">"+data.showMsgList[i].msg_title+"</td>"+
			"<td width=\"100px\">관리자</td>"+
			"<td width=\"230px\">"+data.showMsgList[i].msg_sendDate+"</td></tr>");}
			$('#msgtablepage>tbody:last').append(
					"<tr><td>");
			if(data.start !=1){
						$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+1+"\">[처음]</a>"+
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.start-1+"\">[이전]</a>");
					}
			for(var i = data.start; i <data.end;i++){
				if(i<=data.last){
						$('#msgtablepage>tbody:last').append(
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+i+"\">["+i+"]</a>");
					
				}			
			}
			if(data.start+9<data.last){
				$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.end+"\">[다음]</a>"+
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.last+"\">[끝]</a>");
			}		
				$('#msgtablepage>tbody:last').append(
					"</td></tr>"
					);
			
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
})
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 목록출력 2
$(document).on('click', '#current', function(event) {

	var page = $(this).attr('value');
	$.ajax({
		type : "get",
		url : "showMsgList.do",
		data : {
			"page" : page
		},
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>thead').empty();
			$('#msgtable>thead:last').append(
					"<tr style=\"text-align: center;\"><th colspan=\"2\" width=\"70px\">쪽지번호</th><th width=\"270px\">쪽지 제목</th><th width=\"130px\">보낸사람</th><th>보낸 날짜</th></tr>");
			var cur;
			if(data.current*10>data.showMsgList.length){
				cur=data.showMsgList.length;
			}else{
				cur=data.current*10;
			}
			for(var i = data.current*10-10; i<cur;i++){
				$('#msgtable>tbody:last').append(
						"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgList[i].msg_no+"\"></td>"+
						"<td width=\"55px;\" height=\"30px\">"+data.showMsgList[i].msg_no+			
						"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgList[i].msg_no+"\">"+data.showMsgList[i].msg_title+"</td>"+
						"<td width=\"100px\">관리자</td>"+
						"<td width=\"230px\">"+data.showMsgList[i].msg_sendDate+"</td></tr>");}
						$('#msgtablepage>tbody:last').append(
								"<tr><td>");
						if(data.start !=1){
									$('#msgtablepage>tbody:last').append(
									"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+1+"\">[처음]</a>"+
									"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.start-1+"\">[이전]</a>");
								}
						for(var i = data.start; i <data.end;i++){
							if(i<=data.last){
									$('#msgtablepage>tbody:last').append(
											"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+i+"\">["+i+"]</a>");
								
							}			
						}
						if(data.start+9<data.last){
							$('#msgtablepage>tbody:last').append(
									"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.end+"\">[다음]</a>"+
									"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.last+"\">[끝]</a>");
						}		
							$('#msgtablepage>tbody:last').append(
								"</td></tr>"
								);
			
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
	
})	
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ쪽지 삭제
$(document).on('click', '#msgdeletebutton', function(event) {
  $("input[name=checkbox]:checked").each(function() {
		  var msg_no = $(this).val(); 
			$.ajax({
				type : "get",
				url : "deleteMsg.do",
				data : {
					"msg_no" : msg_no
				},
				success : function(data){
					data.deleteMsg
					$('#msgtable>thead').empty();
					$('#msgtablepage>tbody').empty();
//					alert(data.deleteMsg);
	
				},
				error : function(request){
					alert("에러 : "+request.status);
				}
			})
		  
		})
});
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ윈도우창, 검은막
function wrapWindowByMask01(){	 
  //화면의 높이와 너비를 구한다.
  var maskHeight = $(document).height();  
  var maskWidth = $(window).width();  
  //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
  $("#mask01").css({"width":maskWidth,"height":maskHeight});  
  //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
  $("#mask01").fadeIn(0);      
  $("#mask01").fadeTo("slow",0.6);    
  //윈도우 같은 거 띄운다.
  $(".window01").show();
}
$(document).on('click', ".openMask01", function(e) {
  e.preventDefault();
  wrapWindowByMask01();
});
$(document).on('click', ".window01 .close01", function(e) {
  //링크 기본동작은 작동하지 않도록 한다.
  e.preventDefault();  
  $("#mask01, .window01").hide();
	$('#msgtable>tbody').empty();
	$('#msgtablepage>tbody').empty();
	$('#msgtable>thead').empty();
	$.ajax({
		type : "get",
		url : "showMsgList.do",
		dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			$('#msgtable>tbody').empty();
			$('#msgtablepage>tbody').empty();
			$('#msgtable>thead').empty();
			$('#msgtable>thead:last').append("<tr style=\"text-align: center;\"><th colspan=\"2\" width=\"70px\">쪽지번호</th><th width=\"250px\">쪽지 제목</th><th>보낸사람</th><th>보낸 날짜</th></tr>");
			var cur;
			if(10>data.showMsgList.length){
				cur=data.showMsgList.length;
			}else{
				cur=10;
			}
			for(var i = 0; i<cur;i++){
			$('#msgtable>thead:last').append(
			"<tr style=\"text-align: center;\"><td width=\"15px\"><input type=\"checkbox\" name=\"checkbox\" value=\""+data.showMsgList[i].msg_no+"\"></td>"+
			"<td width=\"55px;\" height=\"30px\">"+data.showMsgList[i].msg_no+			
			"</td><td id=\"msgview\" style=\"cursor: pointer;\" width=\"500px;\"><input type=\"hidden\"  value=\""+data.showMsgList[i].msg_no+"\">"+data.showMsgList[i].msg_title+"</td>"+
			"<td width=\"100px\">관리자</td>"+
			"<td width=\"230px\">"+data.showMsgList[i].msg_sendDate+"</td></tr>");}
			$('#msgtablepage>tbody:last').append(
					"<tr><td>");
			if(data.start !=1){
						$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+1+"\">[처음]</a>"+
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.start-1+"\">[이전]</a>");
					}
			for(var i = data.start; i <data.end;i++){
				if(i<=data.last){
						$('#msgtablepage>tbody:last').append(
								"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+i+"\">["+i+"]</a>");
					
				}			
			}
			if(data.start+9<data.last){
				$('#msgtablepage>tbody:last').append(
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.end+"\">[다음]</a>"+
						"<imput style=\"cursor: pointer;\" type=\"text\" id=\"current\" value=\""+data.last+"\">[끝]</a>");
			}		
				$('#msgtablepage>tbody:last').append(
					"</td></tr>"
					);
			
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})	
}); 
$(document).on('click', "#mask01", function(e) {
  $(this).hide();  
  $(".window01").hide(); 
});   

// 	$(document).ready(function() {

// 		var lonnum;
// 		var latnum;
		
// 		var randomnum = makeRandom(1, 8);
// // 		alert(randomnum);
		
// 		function makeRandom(min, max){
// 		    var RandVal = Math.random() * (max- min) + min;
// 		    return Math.floor(RandVal);
// 		}
		
// 		//서울  37.566535,126.97796919999996
// 		//경기도 37.41379999999999,127.51829999999995
// 		//강원도 37.8228,128.15549999999996
// 		//충청도  36.562294,126.95410700000002
// 		//경상도 35.8059055,128.98767410000005
// 		//전라도 35.356425,126.95410700000002
// 		//제주도33.4890113,126.49830229999998
// 		//서울특별시: 37.566535,126.97796919999996
// 		//부산광역시 :35.1795543,129.07564160000004
// 		//인천광역시 :37.4562557,126.70520620000002
// 		//대구광역시 : 35.8714354,128.601445
// 		//대전광역시 : 36.3504119,127.38454750000005
// 		//광주광역시 : 35.1595454,126.85260119999998
// 		//울산광역시 : 35.5383773,129.31135960000006
// 		//제주도33.4890113,126.49830229999998
		
// 		switch (randomnum) {
// 		case 1:
// 			lonnum = "126.97796919999996";//서울
// 			latnum = "37.566535";
// 			break;
// 		case 2:
// 			lonnum = "129.07564160000004";//부산
// 			latnum = "35.1795543";
// 			break;
// 		case 3:
// 			lonnum = "126.70520620000002";//인천
// 			latnum = "37.4562557";
// 			break;
// 		case 4:
// 			lonnum = "128.601445";//대구
// 			latnum = "35.8714354";
// 			break;
// 		case 5:
// 			lonnum = "127.38454750000005";//대전
// 			latnum = "36.3504119";
// 			break;
// 		case 6:
// 			lonnum = "126.85260119999998";//광주
// 			latnum = "35.1595454";
// 			break;
// 		case 7:
// 			lonnum = "129.31135960000006";//울산
// 			latnum = "35.5383773";
// 			break;
// 		case 8:
// 			lonnum = "126.49830229999998";//제주
// 			latnum = "33.4890113";
// 			break;
// 		default:
// 			lonnum = "126.97796919999996";//서울
// 			latnum = "37.566535";
// 		}
		
// // 		alert("lon: "+lonnum+", "+"lat: "+latnum);
		
// 		var today = new Date();
// 		var week = new Array('일', '월', '화', '수', '목', '금', '토');
// 		var year = today.getFullYear();
// 		var month = today.getMonth() + 1;
// 		var day = today.getDate();
// 		var hours = today.getHours();
// 		var minutes = today.getMinutes();
// 		$('#weather-date').html(month + "." + day + ". (" + week[today.getDay()] + ")");

// 		//// 	$('#WT').on('click',function WT_func(){

// 		$.ajax({
// 			type : "GET",
// 			crossDomain : true,
// 	// 		url : "https://api2.sktelecom.com/weather/current/minutely",//분당날씨 요청할때.
// 			url : "https://api2.sktelecom.com/weather/summary",
// 			dataType : "json",
// 			async : false,
// 			data : {
// 				lon : lonnum,
// 				lat : latnum,
// 				stnid : "",
// 				version : 2
// 			},
// 			headers : {
// 				"appkey" : "281378b4-b2fb-4dd6-bbe6-5642ef236bba",
// 				"Accept" : "application/json",
// 				"Content-Type" : "application/json; charset=UTF-8"
// 			},
// 			beforeSend : function() {},
// 			success : function(result) {

// 				//		===========================================분별	
// 				// 			alert(result);
// 				//  		 var sky = result.weather.minutely[0].sky.name;
// 				//  		 var temperature = result.weather.minutely[0].temperature.tc;
// 				//  		 var temperature2 =result.weather.minutely[0].temperature.tmin;
// 				//  		 var city = result.weather.minutely[0].station.name;
// 				//  		 temperature = Math.floor(temperature);
// 				//  		 temperature2 = Math.floor(temperature2);

// 				//  		 $('#weather-t').html(temperature+" ℃");
// 				//  		 $('#weather-tmin').html(temperature2+" ℃");
// 				//  		 $('#weather-state-text').html(sky);
// 				//  		 $('#weather-city').html(city);		

// 				//		===========================================간편( 오늘 내일 내일모래)	

// 				var city = result.weather.summary[0].grid.city; //시(특별,광역), 도
// 				var country = result.weather.summary[0].grid.country; //시, 군, 구
// 				var village = result.weather.summary[0].grid.village; //읍, 면, 동

// 				var todaySky = result.weather.summary[0].today.sky.name;
// 				var todaySkyCode = result.weather.summary[0].today.sky.code;
// 				var todayTempmax = result.weather.summary[0].today.temperature.tmax;
// 				var todayTempmin = result.weather.summary[0].today.temperature.tmin;

// 				var tmrSky = result.weather.summary[0].tomorrow.sky.name;
// 				var tmrSkyCode = result.weather.summary[0].tomorrow.sky.code;
// 				var tmrTempmax = result.weather.summary[0].tomorrow.temperature.tmax;
// 				var tmrTempmin = result.weather.summary[0].tomorrow.temperature.tmin;

// 				var datSky = result.weather.summary[0].dayAfterTomorrow.sky.name;
// 				var datSkyCode = result.weather.summary[0].dayAfterTomorrow.sky.code;
// 				var datTempmax = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;
// 				var datTempmin = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;

// 				$('.CurrCity').html(city);
// 				$('#country').html(country);
// 				$('#village').html(village);
// 				$('#todaySky').html("오늘: " + todaySky);
// 				$('#todayMax').html("최고기온: " + todayTempmax + " ℃");
// 				$('#todayMin').html("최저기온: " + todayTempmin + " ℃");

// 				$('#tmrSky').html("내일: " + tmrSky);
// 				$('#tmrMax').html("최저기온: " + tmrTempmax + " ℃");
// 				$('#tmrMin').html("최고기온:  " + tmrTempmin + " ℃");

// 				$('#datSky').html("내일모래:  " + datSky);
// 				$('#datMax').html("최고기온: " + datTempmax + " ℃");
// 				$('#datMin').html("최저기온: " + datTempmin + " ℃");

// // 				하늘상태 코드명 SKY_D01:맑음,wi-day-sunny
// // 				 SKY_D02구름조금, wi-cloud
// // 				 SKY_D03:구름많음,wi-cloudy
// // 				 SKY_D04:흐림, wi-fog
// // 				SKY_D05:비, wi-rain
// // 				SKY_D06:눈,wi-snowflake-cold
// // 				 SKY_D07:비 또는 눈  wi-rain-mix	
// 				var one ="wi wi-day-sunny";
// 				var two ="wi wi-cloud";
// 				var three ="wi wi-cloudy";
// 				var four ="wi wi-fog";
// 				var five ="wi wi-rain";
// 				var six ="wi wi-snowflake-cold";
// 				var seven ="wi wi-rain-mix";
// // 				alert("todaySkyCode는: "+todaySkyCode);

// 				if(todaySkyCode=="SKY_D01"){
// 					 $('#todaySkyImage').attr('class',one);
// 					 $('#todaySkyImage2').attr('class',one);
					 
// 				}else if(todaySkyCode=="SKY_D02"){
// 					$('#todaySkyImage').attr('class',two);
// 					$('#todaySkyImage2').attr('class',two);
					
// 				}else if(todaySkyCode=="SKY_D03"){
// 					$('#todaySkyImage').attr('class',three);
// 					$('#todaySkyImage2').attr('class',three);
					
// 				}else if(todaySkyCode=="SKY_D04"){
// 					$('#todaySkyImage').attr('class',four);
// 					$('#todaySkyImage2').attr('class',four);
					
// 				}else if(todaySkyCode=="SKY_D05"){
// 					$('#todaySkyImage').attr('class',five);
// 					$('#todaySkyImage2').attr('class',five);
					
// 				}else if(todaySkyCode=="SKY_D06"){
// 					$('#todaySkyImage').attr('class',six);
// 					$('#todaySkyImage2').attr('class',six);	
					
// 				}else if(todaySkyCode=="SKY_D07"){
// 					$('#todaySkyImage').attr('class',seven);
// 					$('#todaySkyImage2').attr('class',seven);
					
// 				}else{
					
// 				}
				
// // 				alert("tmrSkyCode는: "+tmrSkyCode);
// 				if(tmrSkyCode=="SKY_M01"){
// 					 $('#tmrSkyImage').attr('class',one);
// 				}else if(tmrSkyCode=="SKY_M02"){
// 					$('#tmrSkyImage').attr('class',two);
// 				}else if(tmrSkyCode=="SKY_M03"){
// 					$('#tmrSkyImage').attr('class',three);
// 				}else if(tmrSkyCode=="SKY_M04"){
// 					$('#tmrSkyImage').attr('class',four);
// 				}else if(tmrSkyCode=="SKY_M05"){
// 					$('#tmrSkyImage').attr('class',five);
// 				}else if(tmrSkyCode=="SKY_M06"){
// 					$('#tmrSkyImage').attr('class',six);
// 				}else if(tmrSkyCode=="SKY_M07"){
// 					$('#tmrSkyImage').attr('class',seven);
// 				}else{
					
// 				}
				
// // 				alert("datSkyCode는: "+datSkyCode);	
				
// 				if(datSkyCode=="SKY_M01"){
// 					 $('#datSkyImage').attr('class',one);
// 				}else if(datSkyCode=="SKY_M02"){
// 					$('#datSkyImage').attr('class',two);
// 				}else if(datSkyCode=="SKY_M03"){
// 					$('#datSkyImage').attr('class',three);
// 				}else if(datSkyCode=="SKY_M04"){
// 					$('#datSkyImage').attr('class',four);
// 				}else if(datSkyCode=="SKY_M05"){
// 					$('#datSkyImage').attr('class',five);
// 				}else if(datSkyCode=="SKY_M06"){
// 					$('#datSkyImage').attr('class',six);
// 				}else if(datSkyCode=="SKY_M07"){
// 					$('#datSkyImage').attr('class',seven);
// 				}else{
					
// 				}
				
// 			},
// 			complete : function() {},
// 			error : function(request, status, error) {
// 				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
// 			}
// 		});


		// 	});	

// 	});
</script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
nav ul{padding-top:10px;


  }                  
         nav ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            border-left:1px solid #666666;    
 border-left:1px solid #666666;          /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
            font: bold 12px ;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding:0 10px;  
            color:black;
          font-weight:bold;
            font-family: 'NanumSquareRound', sans-serif;
                            /* 각 메뉴 간격 */
        }
         nav ul li:first-child{border-left:none;}  

.container{
	font-family: 'NanumSquareRound', sans-serif;
}
.main-menu{
	font-family: 'NanumSquareRound', sans-serif;
}
body {
	font-family: 'NanumSquareRound', sans-serif;
/* 	color: #CD853F; */
}
#mask01 {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
} 
.window01{
    display: none;
    position:absolute;  
    left:50%;
    top:100px;
    margin-left: -350px;
    width:700px;
    height:550px;
    background-color:#FFF;
    z-index:10000;  
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

/* tr:hover { */
/* 	background-color: #EBC680; */
/* } */

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
</head>
<body>
    <header id="header">
	<%
		boolean a = false;//어드민 이면     ture
		boolean b = false;//회원 이면 true
		if (session.getAttribute("user_id") != null && session.getAttribute("adminCheck") != null) {//아이디가 있고 어드민 있으므로 어드민
			a = true;
		} else if (session.getAttribute("user_id") != null) {
			b = true;
		}
		;
		pageContext.setAttribute("a", a);
		pageContext.setAttribute("b", b);
	%>
	
	<div class="main-logo text-center" style="background-color: white">

		<div class="container">
			<div class="menu-item-has-children" align="right">
				<nav>
				<ul>
				<c:choose>
					<c:when test="${a }">
						<li><a style="cursor: pointer;color: brown; font-size: 15px;"
						href="logout.do">로그아웃</a></li>
					</c:when>
					<c:when test="${b}">
						<li><a style="cursor: pointer;color: brown; font-size: 15px;"
						href="showNoticeList.do">고객센터</a></li>
						<li><a style="cursor: pointer;color: brown; font-size: 15px;"
						href="logout.do">로그아웃</a></li>
						<li><a style="cursor: pointer;color: brown; font-size: 15px;"
						href="userPwCheck.do">마이페이지</a></li>
						<li><button id="msg" class="openMask01" style="cursor: pointer;color: brown; font-size: 15px;border: 0; background: #00ff0000;">쪽지함</button></li>

						<div id="mask01"></div>
            <div class="window01">
             <center>
           <h3 align="left" style="padding-left:10px; font-family: 'NanumSquareRound', sans-serif; font-weight: bold;">쪽지함</h3></center>
              <center>
            <table id="msgtable"><thead>
            </thead>
            <tbody id="msgtablepage" align="center">
           </tbody>
          </table>
            </center><br>
                         				<button id="current" style="height: 35px; 
                                         font-size: 15px" value="1">쪽지 목록</button> 
             							<button id="msgdeletebutton" style="height: 35px; 
                                         font-size: 15px" value="1">쪽지 삭제</button> 
             							<button class="close01" style="height: 35px;
 									      font-size: 15px">닫기</button>
            </div>             
					</c:when>
					<c:otherwise>
						<li><a style="cursor: pointer; color: brown; font-size: 15px;"
						href="showNoticeList.do">고객센터</a></li>
						<li><a style="cursor: pointer; color: brown; font-size: 15px;"
						href="loginForm.do">로그인</a></li>
						<li><a style="cursor: pointer; color: brown; font-size: 15px;"
						href="joinwith.do">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
			</div>
		</div>

		<h1>
			<a href="main.do"><img src="./Boot/images/petstlogo_2.PNG" style="" alt="Ocean"></a>
		</h1>
	</div>

		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="main-menu text-uppercase">
						<ul id="menu">

							<li><a href="main.do">첫 화면으로</a></li>
							<li class="menu-item-has-children"><a href="meeting.do">펫프 모여라 </a></li>
							<li class="menu-item-has-children"><a href="#">펫프 광장 <i
									class="fa fa-angle-down"></i>
							</a>
								<ul class="sub-menu">
									<li><a href="dogFreeBoardList.do">강아지</a></li>
									<li><a href="catFreeBoardList.do">고양이</a></li>
									<li><a href="rabbitFreeBoardList.do">토끼</a></li>
									<li><a href="etcFreeBoardList.do">기타</a></li>
								</ul></li>

							<li class="menu-item-has-children"><a href="">펫프정보 <i
                                        class="fa fa-angle-down"></i></a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children"><a href="">강아지<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="dogInfoSquareSpecies.do">강아지 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=7">강아지 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">고양이<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="CatInfoSquareSpecies.do">고양이 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=8">고양이 Tip</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="">토끼<i
                                                class="fa fa-angle-right"></i></a>
                                            <ul class="sub-menu">
                                                <li><a href="RabbitInfoSquareSpecies.do">토끼 종정보</a></li>
                                                <li><a href="TipBoardList.do?tipBoard_boardname=9">토끼 Tip</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>

<!-- 							<li><a href="checkHospital.do">병원</a></li> -->
							<li class="menu-item-has-children"><a href="checkPlace.do">플레이스</a>
							<li><a href="shoppingList.do">펫프쇼핑비교</a></li>
<!-- 							<li class="menu-item-has-children"><a href="#"> -->
<!-- 							<span id="weather-date"></span>&nbsp;<i id="todaySkyImage" class=""></i><span id="CurrCity" class="CurrCity"></span> 날씨 -->
<!-- 							<i class="fa fa-angle-down"></i> -->
							</a>
								<ul class="sub-menu">
									<li><a href="#"><span id="todaySky"></span><i id="todaySkyImage2" class=""></i><br><span id="todayMax"></span><br><span id="todayMin"></span></a></li>
									<li><a href="#"><span id="tmrSky"></span><i id="tmrSkyImage" class=""></i><br><span id="tmrMax"></span><br><span id="tmrMin"></span></a></li>
									<li><a href="#"><span id="datSky"></span><i id="datSkyImage" class=""></i><br><span id="datMax"></span><br><span id="datMin"></span></a></li>
								</ul></li>													
							<c:if test="${a }">
								<li class="menu-item-has-children"><a href="">관리자 메뉴<i
										class="fa fa-angle-down"></i></a>
									<ul class="sub-menu">

										<li class="menu-item-has-children"><a href="showNoticeList.do">고객센터 관리
										</a>
										<li class="menu-item-has-children"><a href="">회원관리 <i
												class="fa fa-angle-right"></i>
										</a>
											<ul class="sub-menu">
												<li><a href="#">회원관리</a></li>
												<li><a href="#">쪽지</a></li>
											</ul></li>

										<li class="menu-item-has-children"><a href="#">게시판관리 <i
												class="fa fa-angle-right"></i>
										</a>
											<ul class="sub-menu">
												<li><a href="showReportList.do">신고글 보기</a></li>
												<li><a href="showMalList.do">말머리 추가삭제</a></li>
											</ul></li>
									</ul></li>
							</c:if>


						</ul>
					</div>
				</div>
			</div>
		</div>
	    </header>	
	    
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