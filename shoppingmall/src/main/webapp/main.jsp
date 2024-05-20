<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* HttpSession session = request.getSession(false); // 기존 세션이 있으면 가져오고, 없으면 null */
String userId = (session != null) ? (String) session.getAttribute("userId") : null;
String userName = (session != null) ? (String) session.getAttribute("userName") : null;
String userAddress = (session != null) ? (String) session.getAttribute("userAddress") : null;
String email = (session != null) ? (String) session.getAttribute("email") : null;
String tel = (session != null) ? (String) session.getAttribute("tel") : null;
Integer age = (session != null) ? (Integer) session.getAttribute("age") : null;
%>
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
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link rel="stylesheet" href="css/common.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="css/swiper-bundle.min.css">
<link rel="stylesheet" href="css/main.css?v=<?php echo time(); ?>">
<script src="js/jquery-3.7.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/swiper-bundle.min.js"></script>
<script src="js/ui-common.js?v=<?php echo time(); ?>"></script>
<script>

  let loggedIn = <%= (session != null && session.getAttribute("userId") != null) ? "true" : "false" %>;
  
  document.addEventListener('DOMContentLoaded', function() {
      // 로그인 및 로그아웃 아이콘을 가져옴
      let loginIcon = document.querySelector('.login');
      let logoutIcon = document.querySelector('.logout');
      
      if (loggedIn) {
          // 로그인 상태일 때
          if (loginIcon) loginIcon.style.display = 'none';
          if (logoutIcon) logoutIcon.style.display = 'block';
      } else {
          // 로그아웃 상태일 때
          if (loginIcon) loginIcon.style.display = 'block';
          if (logoutIcon) logoutIcon.style.display = 'none';
      }
  });
</script>
</head>
<body>
	<center>
		<div id="skip_navi">
			<a href="#container">본문바로가기</a>
		</div>
		<div id="wrap">
			<header id="header">
				<div class="inner">
					<h1 class="logo">
						<a href="main.jsp"> <img src="images/common/logo.png" alt="로고">
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
								<span class="blind">login</span> 
								</a>
								<a class="logout" href="<%=request.getContextPath()%>/logoutProc.do">
									<span class="blind">logout</span>
								</a>
								<a class="join" href="<%=request.getContextPath()%>/login.do">
								  <img src="images/add.svg">
									<span class="blind">join</span>
								</a> 
								<a class="user_page" href="user/mypage.jsp">
								  <span class="blind">mypage</span>
								</a>
								<button class="menu_btn" type="button">
									<img src="images/icon_burger.png" alt="더보기">
									<div class="menu_wrap">
										<ul class="menu">
											<li><a href="user/qna.jsp">Q&A</a></li>
											<li><a href="user/review.jsp">Review</a></li>
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
											<li><a href="user/mypage.jsp">MY PAGE</a></li>
											<li><a class="bag" href="#"> <span class="blind">장바구니</span>
													<img src="images/icon-bag.png" alt="장바구니">
											</a></li>
											<li><a class="wish" href="#"> <span class="blind">위시리스트</span>
													<img src="images/icon_mag.png" alt="위시리스트">
											</a></li>
										</ul>
									</div>
								</button>
							</div>
						</div>
					</div>
				</div>
			</header>
			<main id="container">
				<section class="main_slider">
					<h2 class="main_slide">
						<span class="blind">메인 슬라이드</span>
					</h2>
					<div class="swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<a href="#">
									<div class="txt_wrap">
										<p>#MARLONFOODS</p>
										<strong>말론푸드에서 소개합니다!</strong> <em>말론샵 MD 말랑이와 벤지가 강력
											추천하는-<br>청정지역 콜로라도에서 찾아온 "위니루"를 만나보세요!
										</em>
									</div> <img src="images/mainSlide/main4.jpg">
								</a>
							</div>
							<div class="swiper-slide">
								<a href="#">
									<div class="txt_wrap">
										<p>#NEW ARRIVALS</p>
										<strong>들기만 해도 산책의 질이 달라진다!</strong> <em>스프링어 물병은 가볍고,
											사용법이 간단해 반려견도, 보호자도 편해요!</em>
									</div> <img src="images/mainSlide/main6.jpg">
								</a>
							</div>
							<div class="swiper-slide">
								<a href="#">
									<div class="txt_wrap">
										<p>#PROMOTION</p>
										<strong>우리집 어린이를 위한 선물!</strong> <em>반려동물 용품 최대 50% 할인
											기획전</em>
									</div> <img src="images/mainSlide/main1.jpg">
								</a>
							</div>
						</div>
						<div class="swiper-pagination"></div>
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
				</section>
				<section class="new_product">
					<div class="product">
						<h2>New Arrivals</h2>
						<div class="product_wrap">
							<div class="swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<a href="bagpack.html">
											<div class="product1">
												<div class="img_wrap">
													<img src="images/productSlide/bagpack.jpg" alt="강아지 이동장">
												</div>
												<div class="tit_wrap">
													<p>커고 K9 럭색 강아지 이동장</p>
													<em>커고</em> <span>232,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="t-shirts.html">
											<div class="product2">
												<div class="img_wrap">
													<img src="images/productSlide/t-shirts.jpg"
														alt="강아지 캡소매 티셔츠">
												</div>
												<div class="tit_wrap">
													<p>포퍼베이비 오마이베스티 캡소매 티셔츠(2Color)</p>
													<em>포퍼베이비</em> <span>39,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="user/bagpack.jsp">
											<div class="product1">
												<div class="img_wrap">
													<img src="images/productSlide/bagpack.jpg" alt="강아지 이동장">
												</div>
												<div class="tit_wrap">
													<p>커고 K9 럭색 강아지 이동장</p>
													<em>커고</em> <span>232,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="t-shirts.html">
											<div class="product2">
												<div class="img_wrap">
													<img src="images/productSlide/t-shirts.jpg"
														alt="강아지 캡소매 티셔츠">
												</div>
												<div class="tit_wrap">
													<p>포퍼베이비 오마이베스티 캡소매 티셔츠(2Color)</p>
													<em>포퍼베이비</em> <span>39,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="t-shirts.html">
											<div class="product1">
												<div class="img_wrap">
													<img src="images/productSlide/bagpack.jpg" alt="강아지 이동장">
												</div>
												<div class="tit_wrap">
													<p>커고 K9 럭색 강아지 이동장</p>
													<em>커고</em> <span>232,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="t-shirts.html">
											<div class="product2">
												<div class="img_wrap">
													<img src="images/productSlide/t-shirts.jpg"
														alt="강아지 캡소매 티셔츠">
												</div>
												<div class="tit_wrap">
													<p>포퍼베이비 오마이베스티 캡소매 티셔츠(2Color)</p>
													<em>포퍼베이비</em> <span>39,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="t-shirts.html">
											<div class="product1">
												<div class="img_wrap">
													<img src="images/productSlide/bagpack.jpg" alt="강아지 이동장">
												</div>
												<div class="tit_wrap">
													<p>커고 K9 럭색 강아지 이동장</p>
													<em>커고</em> <span>232,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="t-shirts.html">
											<div class="product2">
												<div class="img_wrap">
													<img src="images/productSlide/t-shirts.jpg"
														alt="강아지 캡소매 티셔츠">
												</div>
												<div class="tit_wrap">
													<p>포퍼베이비 오마이베스티 캡소매 티셔츠(2Color)</p>
													<em>포퍼베이비</em> <span>39,000원</span>
												</div>
											</div>
										</a>
									</div>
									<div class="swiper-slide">
										<a href="t-shirts.html">
											<div class="product1">
												<div class="img_wrap">
													<img src="images/productSlide/bagpack.jpg" alt="강아지 이동장">
												</div>
												<div class="tit_wrap">
													<p>커고 K9 럭색 강아지 이동장</p>
													<em>커고</em> <span>232,000원</span>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</main>
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
							사업자등록번호.122-81-90214 &nbsp;통신판매업신고.2017-경기파주-0412호
							&nbsp;개인정보관리책임. 김성철
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
		</div>
	</center>
</body>
</html>