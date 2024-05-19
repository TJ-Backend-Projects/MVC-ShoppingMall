<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
    /* 비밀번호 일치 여부 표시 */
    function passwordConfirm() {
        let password = document.querySelector('[name="password"]').value;              
        let password2 = document.querySelector('[name="password2"]').value;
        let confirmMsg = document.querySelector('#confirmMsg');
        let correctColor = "#00ff00"; /* 일치시 출력. */
       	let wrongColor = "#ff0000";  /* 불일치시 출력 */
        
        if(password === password2){
            confirmMsg.style.color = correctColor;
            confirmMsg.innerHTML ="비밀번호 일치";
        }else{
            confirmMsg.style.color = wrongColor;
            confirmMsg.innerHTML ="비밀번호 불일치";
        }
    }
    

    /* ID 중복 검사 */
    function idCheck(){
        console.log("idCheck() 실행");
        let userId = document.querySelector('[name="userId"]').value;
        console.log("Params: ", userId);
        let param = {userId: userId};
        console.log("Params: ", param);

        $.ajax({
            contentType: "application/json",
            type: 'GET',
            url: '<%=request.getContextPath()%>/user/idCheck.api',
            dataType: 'json',
            data: param,
            success: function (data) {
                console.log(data);
                if (data.rs === '0') {
                    alert("사용 가능한 아이디입니다.");
                } else {
                    alert("이미 존재하는 아이디입니다.");
                }
            },
            error: function (request, status, error) {
                console.log(request, status, error);
            }
        });
    }
    /* 전체 유효성 검사 */
    function validateForm() {
        let userId = document.querySelector('[name="userId"]').value;
        let password = document.querySelector('[name="password"]').value;
        let password2 = document.querySelector('[name="password2"]').value;
        let userName = document.querySelector('[name="userName"]').value;
        let userAddress = document.querySelector('[name="userAddress"]').value;
        let email = document.querySelector('[name="email"]').value;
        let tel = document.querySelector('[name="tel"]').value;
        let age = document.querySelector('[name="age"]').value;
        let rs = true;

        const userIdPattern = /^[a-z]+[a-z0-9]{4,19}$/; // 영문자로 시작, 영문자+숫자 조합 5~20자
        const passwordPattern = /^[A-Za-z\d@$!%*?&]{8,30}$/; // 영문자, 숫자, 특수문자 조합 8~30자

        /* 아이디 유효성 검사 */
        if (userId === "") {
            alert("아이디를 입력하세요");
            rs = false;
        } else if (!userIdPattern.test(userId)) {
            alert("아이디는 영문자로 시작하고, 영문자와 숫자로 구성된 5자 이상 20자 이하로 입력하세요");
            rs = false;
        }

        /* 비밀번호 유효성 검사 */
        if (password === "") {
            alert("비밀번호를 입력해주세요");
            rs = false;
        } else if (!passwordPattern.test(password)) {
            alert("비밀번호는 영문자, 숫자, 특수문자 조합으로 8자 이상 30자 이하로 입력하세요");
            rs = false;
        } else if (password !== password2) {
            alert("비밀번호가 일치하지 않습니다.");
            rs = false;
        }

        /* 이름 유효성 검사 */
        if (userName === "") {
            alert("이름을 입력하세요.");
            rs = false;
        }

        /* 주소 유효성 검사 */
        if (userAddress === "") {
            alert("주소를 입력하세요");
            rs = false;
        }

        /* 이메일 유효성 검사 */
        if (email === "") {
            alert("이메일을 입력하세요");
            rs = false;
        }

        /* 전화번호 유효성 검사 */
        if (tel === "") {
            alert("전화번호를 입력하세요");
            rs = false;
        }

        /* 나이 유효성 검사 */
        if (age !== "" && isNaN(age)) {
            alert("나이는 숫자로 입력하세요");
            rs = false;
        }

        return rs;
    }
    
</script>
</head>
<body>
	<center>
		<h2>회원가입</h2>
		<form action="<%=request.getContextPath()%>/joinProc.do" method="post"
			onsubmit="return validateForm()">
			<table>
				<tr>
					<th>아이디*</th>
					<td><input type="text" name="userId" placeholder=" 아이디를 입력하세요" />
						<input type="button" value="중복확인" onclick="idCheck();">
					</td>
				</tr>
				<tr>
					<th>비밀번호*</th>
					<td><input type="password" name="password" placeholder="비밀번호를 입력하세요"></td>
				</tr>
				<tr>
					<th>비밀번호 확인*</th>
					<td><input type="password" name="password2" placeholder="비밀번호를 재입력하세요" onkeyup="passwordConfirm()"> <span id="confirmMsg"></span></td>
					</td>
				</tr>
				<tr>
					<th>이름*</th>
					<td><input type="text" name="userName" placeholder="회원이름을 입력하세요"></td>
				</tr>
				<tr>
					<th>주소*</th>
					<td><input type="text" name="userAddress" placeholder="주소를 입력하세요"></td>
				</tr>
				<tr>
					<th>이메일*</th>
					<td><input type="email" name="email" placeholder="이메일을 입력하세요">
					</td>
				</tr>
				<tr>
					<th>전화번호*</th>
					<td><input type="text" name="tel" placeholder="전화번호를 입력하세요">
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" placeholder="나이를 입력하세요">세</td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="초기화" /> <a href="login.do">이전페이지</a></td>
				</tr>
				<tr>
					<td><input type="submit" value="JOIN"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>