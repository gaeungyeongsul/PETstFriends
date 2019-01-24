<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content=" ">
    <meta name="author" content="ShapedTheme">

    <!-- favicon icon -->
    <link rel="shortcut icon" href="./Boot/images/favicon.png">

    <title>Main</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

@import
	url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css')
	;
body{
	font-family: 'NanumSquareRound', sans-serif;
	}
ul, li {
	font-family: 'NanumSquareRound', sans-serif;
}

.container {
	font-family: 'NanumSquareRound', sans-serif;
}

.main-menu {
	font-family: 'NanumSquareRound', sans-serif;
}

nav ul {
	padding-top: 10px;
}

nav ul li {
	display: inline; /*  세로나열을 가로나열로 변경 */
	border-left: 1px solid #666666;
	border-left: 1px solid #666666; /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
	font: bold 12px; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
	padding: 0 10px;
	color: black;
	font-weight: bold;
	font-family: 'NanumSquareRound', sans-serif;
	/* 각 메뉴 간격 */
}

nav ul li:first-child {
	border-left: none;
}

h3 {
	font-family: 'NanumSquareRound', sans-serif;
}

#footer {
	font-family: 'NanumSquareRound', sans-serif;
}

.footer-widget-section {
	font-family: 'NanumSquareRound', sans-serif;
}

#s1 {
	height: 100%;
	width: 100%;
	cursor: pointer;
}
</style>
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
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE9 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.js"></script>
    <![endif]-->

</head>
<body>

	<div class="wrapper">
		<!-- pre-loader-->
		<div class="preloader">
			<div class="spinner">
				<div class="double-bounce1"></div>
				<div class="double-bounce2"></div>
			</div>
		</div>
		<!--header section start-->
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
<!-- 		<header id="header"> -->


		<div class="main-logo text-center" style="background-color: white">

			<div class="container">
				<div class="menu-item-has-children" align="right">
				<nav>
				<ul>
					<c:choose>
						<c:when test="${a }">
							<li><a
								style="cursor: pointer; color: brown; font-size: 15px;"
								href="logout.do">로그아웃</a></li>
						</c:when>
						<c:when test="${b}">
							<li><a
								style="cursor: pointer; color: brown; font-size: 15px;"
								href="showNoticeList.do">고객센터</a></li>
							<li>
						<a style="cursor: pointer; color: brown; font-size: 15px;"
								href="logout.do">로그아웃</a>
							</li>
							<li>
							<a style="cursor: pointer; color: brown; font-size: 15px;"
								href="userPwCheck.do">마이페이지</a>
							</li>
							<li>
							<a style="cursor: pointer; color: brown; font-size: 15px;"
								href="#">쪽지함</a>
							</li>
							</c:when>
						<c:otherwise>
							<li><a
								style="cursor: pointer; color: brown; font-size: 15px;"
								href="showNoticeList.do">고객센터</a></li>
							<li><a
								style="cursor: pointer; color: brown; font-size: 15px;"
								href="loginForm.do">로그인</a></li>
							<li><a
								style="cursor: pointer; color: brown; font-size: 15px;"
								href="joinUserForm.do">회원가입</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				</nav>
				</div>
			</div>

			<h1>
				<a href="main.do"><img src="./Boot/images/petstlogo_2.PNG"
					style="" alt="Ocean"></a>
			</h1>
		</div>

		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="main-menu text-uppercase">
						<ul id="menu">

							<li><a href="main.do">첫 화면으로</a></li>
							<li class="menu-item-has-children"><a href="meeting.do">펫프
									모여라 </a></li>

							<li class="menu-item-has-children"><a href="#">펫프 광장 <i
									class="fa fa-angle-down"></i></a>
								<ul class="sub-menu">
									<li><a href="dogFreeBoardList.do">강아지</a></li>
									<li><a href="catFreeBoardList.do">고양이</a></li>
									<li><a href="rabbitFreeBoardList.do">토끼</a></li>
									<li><a href="etcFreeBoardList.do">기타</a></li>
								</ul></li>

							<li class="menu-item-has-children"><a>펫프정보 <i
									class="fa fa-angle-down"></i></a>
								<ul class="sub-menu">
									<li class="menu-item-has-children"><a>강아지<i
											class="fa fa-angle-right"></i></a>
										<ul class="sub-menu">
											<li><a href="dogInfoSquareSpecies.do">강아지 종정보</a></li>
											<li><a href="TipBoardList.do?tipBoard_boardname=7">강아지
													Tip</a></li>
										</ul></li>
									<li class="menu-item-has-children"><a>고양이<i
											class="fa fa-angle-right"></i></a>
										<ul class="sub-menu">
											<li><a href="CatInfoSquareSpecies.do">고양이 종정보</a></li>
											<li><a href="TipBoardList.do?tipBoard_boardname=8">고양이
													Tip</a></li>
										</ul></li>
									<li class="menu-item-has-children"><a>토끼<i
											class="fa fa-angle-right"></i></a>
										<ul class="sub-menu">
											<li><a href="RabbitInfoSquareSpecies.do">토끼 종정보</a></li>
											<li><a href="TipBoardList.do?tipBoard_boardname=9">토끼
													Tip</a></li>
										</ul></li>
								</ul></li>

							<li class="menu-item-has-children"><a href="checkPlace.do">플레이스</a>
							<li><a href="shoppingList.do">펫프쇼핑비교</a></li>
							<li class="menu-item-has-children"><a href="#"> <span
									id="weather-date"></span>&nbsp;<i id="todaySkyImage" class=""></i><span
									id="CurrCity" class="CurrCity"></span> 날씨 <i
									class="fa fa-angle-down"></i>
							</a>
								<ul class="sub-menu">
									<li><a href="#"><span id="todaySky"></span><i
											id="todaySkyImage2" class=""></i><br>
										<span id="todayMax"></span><br>
										<span id="todayMin"></span></a></li>
									<li><a href="#"><span id="tmrSky"></span><i
											id="tmrSkyImage" class=""></i><br>
										<span id="tmrMax"></span><br>
										<span id="tmrMin"></span></a></li>
									<li><a href="#"><span id="datSky"></span><i
											id="datSkyImage" class=""></i><br>
										<span id="datMax"></span><br>
										<span id="datMin"></span></a></li>
								</ul></li>
							<c:if test="${a }">
								<li class="menu-item-has-children"><a href="">관리자 메뉴<i
										class="fa fa-angle-down"></i></a>
									<ul class="sub-menu">

										<li class="menu-item-has-children"><a
											href="showNoticeList.do">고객센터 관리 </a>
										<li class="menu-item-has-children"><a href="">회원관리 <i
												class="fa fa-angle-right"></i>
										</a>
											<ul class="sub-menu">
												<li><a href="#">회원관리</a></li>
												<li><a href="#">쪽지</a></li>
											</ul></li>

										<li class="menu-item-has-children"><a href="#">게시판관리
												<i class="fa fa-angle-right"></i>
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
		<!--header section end-->
		<br>
		<br>
		<center>
			<!--slider section start-->
			<div class="slider-section" align="center">
				<div class="container" align="center">
					<div class="row" align="center">
						<div align="center">
							<div class="home-carousel" align="center"
								style="background: rgba(255, 255, 255, 0.2);">
								<div class="home-slider" style="width: 1140px; height: 600px;">
									<img src="Boot/images/slider/PETstFriendsCommu.png" alt=""
										style="height: 100%; width: 100%;">
								</div>
								<div class="home-slider" style="width: 1140px; height: 600px;">
									<img id="s1" src="Boot/images/slider/fallcafe.jpg" alt=""
										style="height: 100%; width: 100%;">
								</div>
								<div class="home-slider" style="width: 1140px; height: 600px;">
									<img src="Boot/images/slider/petpehospital.png" alt=""
										style="height: 100%; width: 100%"
										onclick="location.href='checkPlace.do?randomnum=1&randomnum2=6'">
								</div>
<!-- 								<div class="home-slider" style="width: 1140px; height: 600px;"> -->
<!-- 									<img src="Boot/images/slider/homeslide1.jpg" alt="" -->
<!-- 										style="height: 100%; width: 100%"> -->
<!-- 								</div> -->
<!-- 								<div class="home-slider" style="width: 1140px; height: 600px;"> -->
<!-- 									<img src="Boot/images/slider/homeslide2.jpg" alt="" -->
<!-- 										style="height: 100%; width: 100%"> -->
<!-- 								</div> -->
								<div class="home-slider" style="width: 1140px; height: 600px;">
									<img src="Boot/images/slider/petpeSquare.png" alt=""
										style="height: 100%; width: 100%; cursor: pointer"
										onclick="location.href='dogFreeBoardList.do'">
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!--slider section end-->
		</center>

    <!--promo box start-->
<!--     <div class="promo-box text-uppercase text-center"> -->
<!--         <div class="container" style="border: 1px solid white; width:70%;"> -->
<!--         	<div style="border-bottom: 2px solid brown; width: 35%;"> -->
<!--                <div style="border-bottom: 5px solid #FFD232; width: 70%;"> -->
<!--                <div style="border:1px solid white ;  height: 50px; "> -->
<!--                <h2 align="left"> <font style="font-size: 20px;"> <b>펫프 모여라 BEST 3</b></font> <font style="font-size: 15px;">♥</font></h2> -->
<!--                </div> -->
<!--                </div> -->
<!--                </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-md-4"> -->
<!--                     <div class="single-promo-box" id="meetingbox0">                -->
                          
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-4"> -->
<!--                     <div class="single-promo-box" id="meetingbox1">                      -->
                            
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-4"> -->
<!--                     <div class="single-promo-box" id="meetingbox2"> -->

<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--     <div class="promo-box text-uppercase text-center"> -->

<!--         <div class="container" style="border: 1px solid white; width:70%;"> -->
<!--                 	<div style="border-bottom: 2px solid brown; width: 35%;"> -->
<!--                <div style="border-bottom: 5px solid #FFD232; width: 70%;"> -->
<!--                <div style="border:1px solid white ;  height: 50px; "> -->
<!--                <h2 align="left"> <font style="font-size: 20px;"> <b>펫프 모여라 후기 BEST 3</b></font> <font style="font-size: 15px;">♥</font></h2> -->
<!--                </div> -->
<!--                </div> -->
<!--                </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-md-4"> -->
<!--                     <div class="single-promo-box" id="reviewbox0">                -->
                          
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-4"> -->
<!--                     <div class="single-promo-box" id="reviewbox1">                      -->
                            
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-md-4"> -->
<!--                     <div class="single-promo-box" id="reviewbox2"> -->

<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    </div>
    
    
 <script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>   
	<script type="text/javascript">
$(document).ready(function() {
	var lonnum;
	var latnum;
	var todaySkyCode;
	var randomnum = makeRandom(1, 8);
//		alert(randomnum);
	
	function makeRandom(min, max){
	    var RandVal = Math.random() * (max- min) + min;
	    return Math.floor(RandVal);
	}
	
	//서울  37.566535,126.97796919999996
	//경기도 37.41379999999999,127.51829999999995
	//강원도 37.8228,128.15549999999996
	//충청도  36.562294,126.95410700000002
	//경상도 35.8059055,128.98767410000005
	//전라도 35.356425,126.95410700000002
	//제주도33.4890113,126.49830229999998
	//서울특별시: 37.566535,126.97796919999996
	//부산광역시 :35.1795543,129.07564160000004
	//인천광역시 :37.4562557,126.70520620000002
	//대구광역시 : 35.8714354,128.601445
	//대전광역시 : 36.3504119,127.38454750000005
	//광주광역시 : 35.1595454,126.85260119999998
	//울산광역시 : 35.5383773,129.31135960000006
	//제주도33.4890113,126.49830229999998
	
	switch (randomnum) {
	case 1:
		lonnum = "126.97796919999996";//서울
		latnum = "37.566535";
		break;
	case 2:
		lonnum = "129.07564160000004";//부산
		latnum = "35.1795543";
		break;
	case 3:
		lonnum = "126.70520620000002";//인천
		latnum = "37.4562557";
		break;
	case 4:
		lonnum = "128.601445";//대구
		latnum = "35.8714354";
		break;
	case 5:
		lonnum = "127.38454750000005";//대전
		latnum = "36.3504119";
		break;
	case 6:
		lonnum = "126.85260119999998";//광주
		latnum = "35.1595454";
		break;
	case 7:
		lonnum = "129.31135960000006";//울산
		latnum = "35.5383773";
		break;
	case 8:
		lonnum = "126.49830229999998";//제주
		latnum = "33.4890113";
		break;
	default:
		lonnum = "126.97796919999996";//서울
		latnum = "37.566535";
	}
	
//		alert("lon: "+lonnum+", "+"lat: "+latnum);
	
	var today = new Date();
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var hours = today.getHours();
	var minutes = today.getMinutes();
	$('#weather-date').html(month + "." + day + ". (" + week[today.getDay()] + ")");

	// 	$('#WT').on('click',function WT_func(){

		$.ajax({
			type : "GET",
			crossDomain : true,
	// 		url : "https://api2.sktelecom.com/weather/current/minutely",//분당날씨 요청할때.
			url : "https://api2.sktelecom.com/weather/summary",
			dataType : "json",
			async : false,
			data : {
				lon : lonnum,
				lat : latnum,
				stnid : "",
				version : 2
			},
			headers : {
				"appkey" : "281378b4-b2fb-4dd6-bbe6-5642ef236bba",
				"Accept" : "application/json",
				"Content-Type" : "application/json; charset=UTF-8"
			},
			beforeSend : function() {},
			success : function(result) {

				//		===========================================분별	
				// 			alert(result);
				//  		 var sky = result.weather.minutely[0].sky.name;
				//  		 var temperature = result.weather.minutely[0].temperature.tc;
				//  		 var temperature2 =result.weather.minutely[0].temperature.tmin;
				//  		 var city = result.weather.minutely[0].station.name;
				//  		 temperature = Math.floor(temperature);
				//  		 temperature2 = Math.floor(temperature2);

				//  		 $('#weather-t').html(temperature+" ℃");
				//  		 $('#weather-tmin').html(temperature2+" ℃");
				//  		 $('#weather-state-text').html(sky);
				//  		 $('#weather-city').html(city);		

				//		===========================================간편( 오늘 내일 내일모래)	

				var city = result.weather.summary[0].grid.city; //시(특별,광역), 도
				var country = result.weather.summary[0].grid.country; //시, 군, 구
				var village = result.weather.summary[0].grid.village; //읍, 면, 동

				var todaySky = result.weather.summary[0].today.sky.name;
				todaySkyCode = result.weather.summary[0].today.sky.code;
				var todayTempmax = result.weather.summary[0].today.temperature.tmax;
				var todayTempmin = result.weather.summary[0].today.temperature.tmin;

				var tmrSky = result.weather.summary[0].tomorrow.sky.name;
				var tmrSkyCode = result.weather.summary[0].tomorrow.sky.code;
				var tmrTempmax = result.weather.summary[0].tomorrow.temperature.tmax;
				var tmrTempmin = result.weather.summary[0].tomorrow.temperature.tmin;

				var datSky = result.weather.summary[0].dayAfterTomorrow.sky.name;
				var datSkyCode = result.weather.summary[0].dayAfterTomorrow.sky.code;
				var datTempmax = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;
				var datTempmin = result.weather.summary[0].dayAfterTomorrow.temperature.tmin;

				$('.CurrCity').html(city);
				$('#country').html(country);
				$('#village').html(village);
				$('#todaySky').html("오늘: " + todaySky);
				$('#todayMax').html("최고기온: " + todayTempmax + " ℃");
				$('#todayMin').html("최저기온: " + todayTempmin + " ℃");

				$('#tmrSky').html("내일: " + tmrSky);
				$('#tmrMax').html("최저기온: " + tmrTempmax + " ℃");
				$('#tmrMin').html("최고기온:  " + tmrTempmin + " ℃");

				$('#datSky').html("내일모래:  " + datSky);
				$('#datMax').html("최고기온: " + datTempmax + " ℃");
				$('#datMin').html("최저기온: " + datTempmin + " ℃");

// 				하늘상태 코드명 SKY_D01:맑음,wi-day-sunny
// 				 SKY_D02구름조금, wi-cloud
// 				 SKY_D03:구름많음,wi-cloudy
// 				 SKY_D04:흐림, wi-fog
// 				SKY_D05:비, wi-rain
// 				SKY_D06:눈,wi-snowflake-cold
// 				 SKY_D07:비 또는 눈  wi-rain-mix	
				var one ="wi wi-day-sunny";
				var two ="wi wi-cloud";
				var three ="wi wi-cloudy";
				var four ="wi wi-fog";
				var five ="wi wi-rain";
				var six ="wi wi-snowflake-cold";
				var seven ="wi wi-rain-mix";


				if(todaySkyCode=="SKY_D01"){
					 $('#todaySkyImage').attr('class',one);
					 $('#todaySkyImage2').attr('class',one);
				 
				}else if(todaySkyCode=="SKY_D02"){
					$('#todaySkyImage').attr('class',two);
					$('#todaySkyImage2').attr('class',two);
				
				}else if(todaySkyCode=="SKY_D03"){
					$('#todaySkyImage').attr('class',three);
					$('#todaySkyImage2').attr('class',three);
				
				}else if(todaySkyCode=="SKY_D04"){
					$('#todaySkyImage').attr('class',four);
					$('#todaySkyImage2').attr('class',four);
				
				}else if(todaySkyCode=="SKY_D05"){
					$('#todaySkyImage').attr('class',five);
					$('#todaySkyImage2').attr('class',five);
				
				}else if(todaySkyCode=="SKY_D06"){
					$('#todaySkyImage').attr('class',six);
					$('#todaySkyImage2').attr('class',six);	
				
				}else if(todaySkyCode=="SKY_D07"){
					$('#todaySkyImage').attr('class',seven);
					$('#todaySkyImage2').attr('class',seven);
				
				}else{
				
				}
			

				if(tmrSkyCode=="SKY_M01"){
					 $('#tmrSkyImage').attr('class',one);
				}else if(tmrSkyCode=="SKY_M02"){
					$('#tmrSkyImage').attr('class',two);
				}else if(tmrSkyCode=="SKY_M03"){
					$('#tmrSkyImage').attr('class',three);
				}else if(tmrSkyCode=="SKY_M04"){
					$('#tmrSkyImage').attr('class',four);
				}else if(tmrSkyCode=="SKY_M05"){
					$('#tmrSkyImage').attr('class',five);
				}else if(tmrSkyCode=="SKY_M06"){
					$('#tmrSkyImage').attr('class',six);
				}else if(tmrSkyCode=="SKY_M07"){
					$('#tmrSkyImage').attr('class',seven);
				}else{
				
				}
			

				if(datSkyCode=="SKY_M01"){
					 $('#datSkyImage').attr('class',one);
				}else if(datSkyCode=="SKY_M02"){
					$('#datSkyImage').attr('class',two);
				}else if(datSkyCode=="SKY_M03"){
					$('#datSkyImage').attr('class',three);
				}else if(datSkyCode=="SKY_M04"){
					$('#datSkyImage').attr('class',four);
				}else if(datSkyCode=="SKY_M05"){
					$('#datSkyImage').attr('class',five);
				}else if(datSkyCode=="SKY_M06"){
					$('#datSkyImage').attr('class',six);
				}else if(datSkyCode=="SKY_M07"){
					$('#datSkyImage').attr('class',seven);
				}else{
				
				}
			
			},
			complete : function() {},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
		var randomnum2; //1:애견카페 2:애묘카페 3.호텔 4.공원
		var imgSlide = function(){
			if(todaySkyCode=='SKY_D01' || todaySkyCode =='SKY_D02'){//맑음, 약간 흐림
				randomnum2 = 4;
					$('#s1').attr('src','Boot/images/slider/dailyStroll.png');
			}
			else{
				randomnum2 = Math.floor(Math.random() * 3) + 1;
				if(randomnum2<=2)//카페 사진
				$("#s1").attr("src","Boot/images/slider/fallcafe.jpg");	
				else//호텔사진
					$("#s1").attr("src","Boot/images/slider/hotel.png");
			}
		}
		imgSlide();
		
		$(document).on('click', '#s1', function(){//지역(randomnum)과 장소(randomnum2) 넘기기
			location.href='checkPlace.do?randomnum='+randomnum+'&randomnum2='+randomnum2;
		})
	// 	});	
	$.ajax({
		type : "get",
		url : "showmain.do",
		dataType : "json",
		async: false,
		contentType : "application/json; charset=UTF-8",
		success : function(data){
		for(var io = 0; io<3; io++){
			var proPic=data.meetingBoard[io].meetingBoard_proPic;
			if(proPic==null){
				proPic="acc.jpg";
			}
			var pic = "acc"+io;
			var proPic2= pic+".png";
			var like = data.meetinglikes[io].meetingLikes_count;
			if(like==null){
			   like = 0;	
			}
			var spilt = data.meetingBoard[io].meetingBoard_place.split('/');
			var place1 = spilt[0];
			var place2 = spilt[1]; 
			$('#meetingbox'+(io)).append(
					//사진크기 400 / 350
			"<div class=\"portfolio-item development\"><img src=\"img/"+proPic+"\" width=\"310px\" height=\"300px\"><div class=\"img-overlay2\"><div class=\"portfolio-text\">"+
            "<p  style=\"font-size:14px; color: white; text-align: left; padding-left: 30px\">모&nbsp임&nbsp명 : "+data.meetingBoard[io].meetingBoard_title+
            "<br>모임 장소 : <br>&nbsp&nbsp&nbsp&nbsp"+place1
            +"<br>&nbsp&nbsp&nbsp&nbsp"+place2+"<br>모&nbsp임&nbsp일 : "+data.meetingBoard[io].meetingBoard_startMeetingDate.substring(0,10)+
            "</p><a href=\"meetingview.do?meeting_boardno="+data.meetingBoard[io].meeting_boardno+"\">click</a></div></div></div>");
			
			$('#reviewbox'+(io)).append(
					//사진크기 400 / 350
			"<div class=\"portfolio-item development\"><img src=\"img/"+proPic2+"\"><div class=\"img-overlay2\"><div class=\"portfolio-text\">"+
            "<p  style=\"font-size:14px; color: white; text-align: center; \">제&nbsp목 :"+data.meetingreview[io].meetingReview_title+
            "<br><br><font style=\"font-size: 20px; \">♥</font> : "+like+
            "<br></p><a href=\"reviewView.do?meeting_boardno="+data.meetingreview[io].meeting_boardno+"&meetingReview_no="+data.meetingreview[io].meetingReview_no+"\">click</a></div></div></div>");
			
		} 
		},
		error : function(request){
			alert("에러 : "+request.status);
		}
	})
})
	</script>
    <!--promo box end-->
<%@ include file="/petst/footer.jsp" %>
  

</div>
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