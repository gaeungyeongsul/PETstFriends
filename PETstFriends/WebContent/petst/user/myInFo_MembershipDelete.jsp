<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Rubel Miah">
<link rel="shortcut icon" href="./assets/images/favicon.png">
<title>탈퇴 비번확인</title>

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<style>
.layer {
	position: absolute;
	top: 30%;
	left: 43%;
	width: 300px;
	height: 300px;
	background:;
	margin: -50px 0 0 -50px;
}
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$("#deleteBtn").click(function() {

			$.ajax({
				type : 'post',
				url : 'deleteUser.do',
				data : {
					user_id : $("#user_id").val(),
					user_pass : $("#user_pass").val()
					
					
					
					
					
				},
				success : function(result) {

					if (result == true) {
						alert("탈퇴가 완료되었습니다.");
						window.location.href = "logout.do";
					}
					else
						alert("비밀번호를 다시 입력해주세요.")
				},
				error : function(xhrReq, status, error) {
					alert(error)
				}
			});



		});



	});
</script>
<style type="text/css">
.layer {
	position: absolute;
	top: 50%;
	left: 40%;
	width: 400px;
	height: 300px;
	background:;
	margin: -50px 0 0 -50px;
}
body{

font-family: 'NanumSquareRound', sans-serif;
font-weight: bold; 


				
}
</style>

<body>
	<div class="wrapper">
		<%@ include file="/petst/header.jsp"%>

		<div class="mt20"></div>
		<br> <br>
		<p>
		<center>

			<div
				style="background: rgba(255, 255, 255, 0.8); border: 1px solid #eeeeee; height: 350px; width: 850px; border-radius: 25px;">

				<div>
					<div
						style="color: #8B5927; font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold;">
						<br>
						<br>
						<br>


						<p>
							<strong>${user_id } 회원님!</strong><br /> 회원님의 안전한 정보보호를 위해 비밀번호를
							입력해주시기 바랍니다.
						</p>
						<br>
					</div>
					<div class="article">
						<div class="row-group">

							<input type=hidden value="${user_id }" id="user_id"
								name="user_id"> 
								비밀번호: <input type="password"
								id="user_pass" name="user_pass" style="border-radius: 5px;" />
						


						<button id="deleteBtn"
							style=" font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold; width: 50px; height: 28px; border: 1; ">확인</button>

						<button onclick="location.href='main.do'" value="취소"
							style="font-family: 'NanumSquareRound', sans-serif; font-size: 15px !important; font-weight: bold; width: 50px; height: 28px; border: 1;">취소</button>



					</div>
				</div>
			</div>
	</div>
	</center>
	</div>



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