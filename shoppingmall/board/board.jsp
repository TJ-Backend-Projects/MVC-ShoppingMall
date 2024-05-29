<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.dao.BoardDAO" %>
<%@ page import="mvc.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%
String userId = (String) session.getAttribute("userId");
//BoardDAO 객체 생성
BoardDAO boardDAO = new BoardDAO();
//사용자가 작성한 글 가져오기
ArrayList<BoardDTO> allPost = boardDAO.getAllPost();
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
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet"
	href="../css/common.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="../css/swiper-bundle.min.css">
<link rel="stylesheet"
	href="../css/board.css?v=<%=System.currentTimeMillis()%>">
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/swiper-bundle.min.js"></script>
<script src="../js/ui-common.js?v=<%=System.currentTimeMillis()%>"></script>
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
	// 게시판 클릭시 넘어가는 스크립트
	document.addEventListener('DOMContentLoaded', function() {
		const clickableElements = document.querySelectorAll('.clickable');

		clickableElements.forEach(function(element) {
			element.addEventListener('click', function() {
				const url = element.getAttribute('data-url');
				if (url) {
					window.location.href = url;
				}
			});
		});
	});
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
							<a class="login"
								href="<%=request.getContextPath()%>/logoutProc.do"> <span
								class="blind">login</span>
							</a> <a class="logout"
								href="<%=request.getContextPath()%>/logoutProc.do"> <span
								class="blind">logout</span></a> <a class="join"
								href="../user/join.jsp"> <img src="../images/add.svg">
								<span class="blind">join</span>
							</a> <a class="user_page" href="../user/mypage.jsp"> <span
								class="blind">mypage</span>
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
            <h2>Board</h2>
        </div>
        <div class="qna_wrap">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 70px;">번호</th>
                        <th>제목</th>
                        <th style="width: 100px;">작성자</th>
                        <th style="width: 250px;">작성일</th>
                    </tr>
                </thead>
                
                <tbody>
                    <!-- 사용자가 작성한 글 표시 -->
    				<% for (BoardDTO post : allPost) { %>
   						<tr>
     					  <td><%= post.getBoard_id() %></td>
					      <td class="clickable" data-url="board_action.jsp"><%= post.getBoard_title() %></td>
     					  <td><%= post.getUser_id() %></td>
     					  <td><%= post.getBoard_date() %></td>
     					  
   						</tr>
    				<% } %>
				</tbody>
            </table>
            <a href="write.jsp" class="write"><span>Write</span></a>
        </div>
        <div class="board_list">
            <ul class="board">
                <li><a class="active" href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
            </ul>
            <div class="btn_wrap">
                <form action="/posts?page=1" method="get">
                    <input type="hidden" name="page" value="1">
                    <a href="#" class="prev_btn" onclick="this.previousElementSibling.value = parseInt(this.previousElementSibling.value) - 1;">Prev</a>
                    <span class="nav_bar"></span>
                    <a href="#" class="next_btn" onclick="this.previousElementSibling.previousElementSibling.value = parseInt(this.previousElementSibling.previousElementSibling.value) + 1;">Next</a>
                </form>
            </div>
        </div>
    </section>
</main>

</body>
</html>