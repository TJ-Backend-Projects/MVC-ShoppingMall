<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="Description" content="">
<meta property="og:type" content="website">
<meta property="og:title" content="Dog - Dog">
<meta property="og:description" content="Dog">
<meta property="og:image" content="">
<meta property="og:url" content="">
<meta property="og:locale" content="ko_KR">
<meta property="og:site_name" content="marlon shop.">
<title>말론샵 | marlon shop.</title>
<link rel="icon" href="images/common/favicon.ico">
<link rel="apple-touch-icon" href="images/touch_icon.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet" href="../css/common.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="../css/swiper-bundle.min.css">
<link rel="stylesheet" href="../css/login.css?v=<?php echo time(); ?>">
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/swiper-bundle.min.js"></script>
<script src="../js/ui-common.js?v=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
	<div id="skip_navi">
		<a href="#container">본문바로가기</a>
	</div>
	<div id="wrap">
		<header id="header">
			<div class="inner">
				<h1 class="logo">
					<a href="../main.jsp"> <img src="../images/common/logo.png"
						alt="로고">
					</a>
				</h1>
				<div class="bottom_wrap">
					<div class="bottom_left">
						<div class="category">
							<ul class="pet_gnb">
								<li><a href="#">dog</a></li>
								<li><a href="#">cat</a></li>
							</ul>
							<ul class="gnb">
								<li><a href="#">NEW</a></li>
								<li><a href="#">BRAND</a></li>
								<li><a href="#">SALE</a></li>
								<li><a href="#">프로모션</a></li>
								<li><a href="#">🍠 말론푸드</a></li>
								<li><a href="#">🐶 러프웨어</a></li>
								<li><a href="#">🥳 어린이날</a></li>
							</ul>
						</div>
					</div>
					<div class="bottom_right">
						<div class="user_wrap">
							<a class="login" href="<%=request.getContextPath()%>/login.do">
								<span class="blind">로그인</span>
							</a> <span class="blind">login</span> </a> <a class="logout" href="#">
								<span class="blind">logout</span>
							</a> <a class="join" href="#"> <img src="../images/add.svg">
								<span class="blind">join</span>
							</a> <a class="user_page" href="#"> <span class="blind">my
									page</span>
							</a>
							<button class="menu_btn" type="button">
								<img src="../images/icon_burger.png" alt="더보기">
								<div class="menu_wrap">
									<ul class="menu">
										<li><a href="board.jsp">Board</a></li>
										<li><a href="#">ORDER</a></li>
										<li><a href="#">ABOUT US</a></li>
									</ul>
									<ul class="service">
										<li><a href="#">고객센터</a></li>
										<li><a href="#">INSTAGRAM</a></li>
										<div class="lang">
											<a href="#">EN</a> <a href="#">KO</a>
										</div>
									</ul>
									<ul class="member">
										<li><a href="login.jsp">LOGIN</a></li>
										<li><a href="join.jsp">JOIN</a></li>
										<li><a href="#">MY PAGE</a></li>
										<li><a class="bag" href="#"> <span class="blind">장바구니</span>
												<img src="../images/icon-bag.png" alt="장바구니">
										</a></li>
										<li><a class="wish" href="#"> <span class="blind">위시리스트</span>
												<img src="../images/icon_mag.png" alt="위시리스트">
										</a></li>
									</ul>
								</div>
							</button>
						</div>
					</div>
				</div>
		</header>
		<main id="container">
			<center>
				<section class="main_login">
					<div class="title_area">
						<h2>Log In</h2>
					</div>
					<div class="login_wrap">
						<h3>회원 로그인</h3>
						<div class="login_box">
							<form action="<%=request.getContextPath()%>/loginProc.do"
								method="post">
								<fieldset>
									<legend>로그인</legend>
									<label title="아이디"> <input class="id" type="text"
										name="userId" placeholder="id">
									</label> <label title="비밀번호"> <input class="pw" type="password"
										name="password" placeholder="password">
									</label>
									<p class="security">
										<img src="../images/ico_access.gif" alt="보안접속"> 보안접속
									</p>
									<ul class="find">
										<li><a href="#">아이디찾기</a></li>
										<li><a href="#">비밀번호찾기</a></li>
									</ul>
<!-- 									sns 연결안했으니 주석처리함. -->
<!-- 									<ul class="sns_wrap"> -->
<!-- 										<li><a href="#"> <img -->
<!-- 												src="../images/btn_naver_login.gif" alt="네이버로 로그인"> -->
<!-- 										</a></li> -->
<!-- 										<li><a href="#"> <img -->
<!-- 												src="../images/btn_kakao_login.gif" alt="카카오로 로그인"> -->
<!-- 										</a></li> -->
<!-- 									</ul> -->
									<div class="join_link">
										<p>
											신규 회원을 위한 다양하고<br>특별한 혜택을 만나보세요!
										</p>
										<a class="join_btn"
											href="join.jsp"></a>
									</div>
									<input class="login_btn" type="submit" value="">
								</fieldset>
							</form>
						</div>
					</div>
				</section>
		</main>
		</center>
		<footer id="footer">
			<div class="footer_top">
				<div class="large">
					<ul class="sns_cs">
						<li><a href="#">카카오톡 1:1 상담</a></li>
						<li><a href="#">인스타그램</a></li>
					</ul>
				</div>
				<div class="cs">
					<p>CUSTOMER SERVICE</p>
					<span> 유선 상담 불가능 / 카카오톡 상담을 이용해주세요<br> 월 - 금/ 오전 10시 ~
						오후 5시<br> 점심시간 / 오전 11시 30분 ~ 오후 1시 30분<br> 토요일, 일요일,
						공휴일 휴무
					</span>
				</div>
				<strong>기업은행 : 061-081270-01-013 (주)트리니언</strong>
			</div>
			<div class="footer_bottom">
				<div class="company">
					<p>info@marlonshop.com</p>
					<em>(주)트리니언 CEO.김성철 &nbsp; 경기도 파주시 탄현면 헤이리마을길 82-154 <br>
						사업자등록번호.122-81-90214 &nbsp;통신판매업신고.2017-경기파주-0412호 &nbsp;개인정보관리책임.
						김성철
					</em>
				</div>
				<div class="footer_right">
					<ul class="privacy_wrap">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Agreement</a></li>
						<li><img src="images/privarcy.gif" alt="매매보호서비스"></li>
					</ul>
				</div>
			</div>
		</footer>
</body>
</html>