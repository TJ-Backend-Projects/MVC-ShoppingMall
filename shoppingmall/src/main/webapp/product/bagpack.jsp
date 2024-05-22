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
<link rel="icon" href="../images/common/favicon.ico">
<link rel="apple-touch-icon" href="images/touch_icon.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet"
	href="../css/common.css?v=<%= System.currentTimeMillis() %>">
<link rel="stylesheet" href="../css/swiper-bundle.min.css">
<link rel="stylesheet"
	href="../css/Tshirts.css?v=<%=System.currentTimeMillis()%>">
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/swiper-bundle.min.js"></script>
<script src="../js/ui-common.js?v=<%= System.currentTimeMillis() %>"></script>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						let loggedIn =
<%=(session != null && session.getAttribute("userId") != null) ? "true" : "false"%>
	;

						// 로그인 및 로그아웃 아이콘을 가져옴
						let loginIcon = document.querySelector('.login');
						let logoutIcon = document.querySelector('.logout');
						let joinBtn = document.querySelector('.join');

						if (loggedIn) {
							// 로그인 상태일 때
							if (loginIcon)
								loginIcon.style.display = 'none';
							if (logoutIcon)
								logoutIcon.style.display = 'block';
							if (joinBtn)
								joinBtn.style.display = 'none';
						} else {
							// 로그아웃 상태일 때
							if (loginIcon)
								loginIcon.style.display = 'block';
							if (logoutIcon)
								logoutIcon.style.display = 'none';
							if (joinBtn)
								joinBtn.style.display = 'block';
						}
					});
</script>

<script>
									function increaseQuantity() {
										var quantityInput = document
												.getElementById('quantity');
										quantityInput.value = parseInt(quantityInput.value) + 1;
									}

									function decreaseQuantity() {
										var quantityInput = document
												.getElementById('quantity');
										if (quantityInput.value > 1) {
											quantityInput.value = parseInt(quantityInput.value) - 1;
										}
									}
								</script>
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
							<a class="login" href="<%=request.getContextPath()%>/loginProc.do">
								<span class="blind">login</span>
							</a> <a class="logout"
								href="<%=request.getContextPath()%>/logoutProc.do"> <span
								class="blind">logout</span>
							</a> <a class="join" href="../user/join.jsp">
								<img src="../images/add.svg"> <span class="blind">join</span>
							</a> <a class="user_page" href="../user/mypage.jsp"> <span class="blind">my
									page</span>
							</a>
							<button class="menu_btn" type="button">
								<img src="../images/icon_burger.png" alt="더보기">
								<div class="menu_wrap">
									<ul class="menu">
										<li><a href="../board/qna.jsp">Q&A</a></li>
										<li><a href="../board/review.jsp">Review</a></li>
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
										<li><a href="../user/mypage.jsp">MY PAGE</a></li>
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
			</div>
		</header>
		<main id="container">
			<section class="product">
				<div class="inner">
					<div class="img_wrap">
						<img src="../images/productSlide/bagpack-hover.jpg" alt="강아지 이동장">
					</div>
					<div class="tit_wrap">
						<div class="tit">
							<h3>커고 K9 럭색 강아지 이동장</h3>
							<div class="brand">
								<p>BRAND HOME</p>
								<em class="dash"></em> <a href="#" class="poperbaby_site">
									커고</a>
							</div>
						</div>
						<p class="madein">MADE IN USA</p>
						<div class="form_wrap">
    <%@ page import="java.util.*, javax.servlet.*, javax.servlet.http.*" %>

<form action="../board/add_to_cart.jsp" method="post" onsubmit="setHiddenFields()">
    <label for="quantity">커고 K9 럭색 강아지 이동장 :</label>
    <div class="quantity_control">
        <button type="button" onclick="decreaseQuantity()">-</button>
        <input type="number" id="quantity" name="quantity" min="1" value="1" onchange="updatePrice()">
        <button type="button" onclick="increaseQuantity()">+</button>
    </div>

    <label for="price">가격:</label>
    <input type="text" id="price" name="price" readonly value="232,000원">

    <input type="hidden" id="hidden_total_price" name="hidden_total_price">

    <div class="btn_wrap">
        <button type="submit" name="action" value="buy_now">BUY NOW</button>
        <button type="submit" name="action" value="add_cart">ADD CART</button>
    </div>
</form>

<script>
    // 상품 단가를 변수로 설정
    const unitPrice = 232000;

    // 수량을 증가시키는 함수
    function increaseQuantity() {
        // 수량 입력 필드 요소를 가져옴
        let quantityInput = document.getElementById('quantity');
        // 수량을 1 증가시킴
        quantityInput.value = parseInt(quantityInput.value) + 1;
        // 가격을 업데이트
        updatePrice();
    }

    // 수량을 감소시키는 함수
    function decreaseQuantity() {
        // 수량 입력 필드 요소를 가져옴
        let quantityInput = document.getElementById('quantity');
        // 수량이 1보다 큰 경우에만 실행
        if (quantityInput.value > 1) {
            // 수량을 1 감소시킴
            quantityInput.value = parseInt(quantityInput.value) - 1;
            // 가격을 업데이트
            updatePrice();
        }
    }

    // 가격을 업데이트하는 함수
    function updatePrice() {
        // 수량 입력 필드에서 현재 수량을 가져옴
        let quantity = parseInt(document.getElementById('quantity').value);
        // 총 가격을 계산
        let totalPrice = unitPrice * quantity;
        // 계산된 총 가격을 가격 입력 필드에 표시 (화폐 단위 포함)
        document.getElementById('price').value = totalPrice.toLocaleString() + '원';
        // 숨겨진 필드에도 총 가격을 저장하여 서버로 전송
        document.getElementById('hidden_total_price').value = totalPrice;
    }
</script>

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
						사업자등록번호.122-81-90214 &nbsp;통신판매업신고.2017-경기파주-0412호 &nbsp;개인정보관리책임.
						김성철
					</em>
				</div>
				<div class="footer_right">
					<ul class="privacy_wrap">
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Agreement</a></li>
						<li><img src="../images/privarcy.gif" alt="매매보호서비스"></li>
					</ul>
				</div>
			</div>
		</footer>
</body>
</html>