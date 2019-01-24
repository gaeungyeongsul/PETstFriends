<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입1</title>

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
.join-form {
	width: 400px;
	margin: 20px auto;
}

.input-group-addon .fa {
	font-size: 20px;
}
</style>
</head>
<body>
	<%@ include file="/petst/header.jsp"%>
	
	<div class="wrapper">

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
							<strong>회원가입할 수단을 선택하세요.</strong><br> <br>

						</p>
					</div>
					<div class="article">
						<div class="row-group">
							<table>
								<tr>

									<td align="right"><a href="terms_use.do"> <img
											src="img/PFJoin.png" style="height: 50px;">
									</a></td>
									<td width="30px;"></td>
									<td align="right"><a href="${url}"> <img
											src="img/naverjoin1.png" style="height: 50px;">
									</a></td>
								<tr></tr>
							</table>

							
						</div>
					</div>
				</div>
			</div>
		</center>
	</div>

	<%@ include file="/petst/footer.jsp"%>
</body>
</html>