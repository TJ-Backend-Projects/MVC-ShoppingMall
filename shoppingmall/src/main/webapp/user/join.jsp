<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script type="text/javascript">
    /* 비밀번호 일치 여부 표시 */
    function passwordConfirm() {
        let password = document.querySelector('[name="password"]').value;              
        let password2 = document.querySelector('[name="password2"]').value;
        let confirmMsg = document.querySelector('#confirmMsg');
        let correctColor = "#00ff00"; //맞았을 때 출력되는 색깔.
       	let wrongColor ="#ff0000";    //틀렸을 때 출력되는 색깔
        
        if(password === password2){
            confirmMsg.style.color = correctColor;
            confirmMsg.innerHTML ="비밀번호 일치";
        }else{
            confirmMsg.style.color = wrongColor;
            confirmMsg.innerHTML ="비밀번호 불일치";
        }
    }
    /* 비밀번호가 일치하지 않으면 submit 안됨 */
    function passwordCheck(){
        let password = document.querySelector('[name="password"]').value;              
        let password2 = document.querySelector('[name="password2"]').value;
    	if(password === password2){
    		return true;
    	} else {
    		alert("비밀번호가 일치하지 않습니다.");
    		return false;
    	}
    }
    
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
                    alert("사용 가능한 ID 입니다.");
                } else {
                    alert("이미 존재하는 ID 입니다.");
                }
            },
            error: function (request, status, error) {
                console.log(request, status, error);
            }
        });
    }
</script>
</head>
<body>
	<center>
	<h2>회원가입</h2>
	<form action="<%=request.getContextPath()%>/joinProc.do" method="post" onsubmit="return passwordCheck()">
	<table>
          <tr>
            <th>아이디*</th>
            <td>
              <input type="text" name="userId" placeholder=" 아이디를 입력하세요"/>
              <input type="button" value="중복확인" onclick="idCheck();">
            </td>
          </tr>
          <tr>
          <th>비밀번호*</th>
          <td>
          <input type="password" name="password" placeholder="비밀번호를 입력하세요"> 
          </td>
          </tr>
          <tr>
          <th>비밀번호 확인*</th>
          <td>
          <input type="password" name="password2" placeholder="비밀번호를 재입력하세요"  onkeyup="passwordConfirm()"> <span id ="confirmMsg"></span></td>
          </td>
          </tr>
          <tr>
          <th>이름*</th>
          <td>
          <input type="text" name="userName" placeholder="회원이름을 입력하세요"> 
          </td>
          </tr>
          <tr>
          <th>주소*</th>
          <td>
          <input type="text" name="userAddress" placeholder="주소를 입력하세요"> 
          </td>
          </tr>
          <tr>
          <th>이메일*</th>
          <td>
          <input type="email" name="email" placeholder="이메일을 입력하세요"> 
          </td>
          </tr>
          <tr>
          <th>전화번호*</th>
          <td>
          <input type="text" name="tel" placeholder="전화번호를 입력하세요"> 
          </td>
          </tr>
          <tr>
          <th>나이</th>
          <td>
          <input type="text" name="age" placeholder="나이를 입력하세요"> 세
          </td>
          </tr>
          <tr>
          <td colspan="2">
          <input type="reset" value="초기화"/>
          <a href="login.do">이전페이지</a>
          </td>
          </tr>
          <tr>
          <td>
          <input type="submit" value="JOIN">
          </td>
          </tr>
          </table>
	</form>
	</center>
</body>
</html>