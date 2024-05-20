<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link rel="apple-touch-icon" href="../images/touch_icon.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet" href="../css/common.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="../css/qna.css?v=<?php echo time(); ?>">
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/ui-common.js?v=<?php echo time(); ?>"></script>
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
							<a class="login" href="login.jsp"> <span class="blind">login</span>
							</a> <a class="logout" href="#"> <span class="blind">logout</span>
							</a> <a class="join" href="join.jsp"> <img src="../images/add.svg">
								<span class="blind">join</span>
							</a> <a class="user_page" href="#"> <span class="blind">my
									page</span>
							</a>
							<button class="menu_btn" type="button">
								<img src="../images/icon_burger.png" alt="더보기">
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
										<li><a href="login.html">LOGIN</a></li>
										<li><a href="join.html">JOIN</a></li>
										<li><a href="#">MY PAGE</a></li>
										<li><a class="bag" href="#"> <span class="blind">장바구니</span>
												<img src="../images/icon-bag.png" alt="장바구니">
										</a></li>
										<li><a class="wish" href="#"> <span class="blind">위시리스트</span>
												<img src="../images/icon_mag.png" alt="위시리스트">
										</a></li>
									</ul>
								</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<main id="container">
      <section class="main_qna">
        <div class="title_area">
          <h2>Review</h2>
        </div>
        <div class="qna_wrap">
        	<table class="table">
<!--         	필요한부분인지 크게 못느껴 일단 주석처리함. 필요시 주석 해제할것. -->
<!-- 	        	<thead> -->
<!-- 		        	<tr>  -->
<!-- 		        		<th style="width: 70px;">번호</th> -->
<!-- 		        		<th>제목</th> -->
<!-- 		        		<th style="width: 100px;">작성자</th> -->
<!-- 		        		<th style="width: 250px;">작성일</th> -->
<!-- 		        	</tr> -->
<!-- 	        	</thead> -->
<!-- 예시로 만들어둔것 지우고 만들어야함 -->
	        	<tbody>
	        		<tr>
	        			<td class="col1">1</td>
	        			<td class="col2">ㅎㅇ</td>
	        			<td class="col3">엄준식</td>
	        			<td class="col4">2024-05-17</td>
	        		</tr>
	        		<tr>
	        			<td class="col1">2</td>
	        			<td class="col2">안녕하세요</td>
	        			<td class="col3">이씨가문곰</td>
	        			<td class="col4">2024-10-17</td>
	        		</tr>
	        	</tbody>
        	</table>
<!--    여기까지				 -->
        	<a href="write.jsp" class="write">
				<span>Write</span>
			</a>
        </div>
<!--         여기부터 글쓴 목록 -->
        <div class="board_list">
					<ul class="board">
						<li>
							<a class="active" href="#">1</a>
						</li>
						<li>
							<a href="#">2</a>
						</li>
						<li>
							<a href="#">3</a>
						</li>
						<li>
							<a href="#">4</a>
						</li>
						<li>
							<a href="#">5</a>
						</li>
						<li>
							<a href="#">6</a>
						</li>
						<li>
							<a href="#">7</a>
						</li>
					</ul>
					<div class="btn_wrap">
						<a href="#" class="prev_btn">Prev</a>
						<span class="nav_bar"></span>
						<a href="#" class="nrev_btn">Next</a>					
					</div>
				</div>
      </section>
    </main>
</body>
</html>