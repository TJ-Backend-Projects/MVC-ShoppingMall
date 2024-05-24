package mvc.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


import mvc.dao.UserDAO;
import mvc.dto.UserDTO;

@WebServlet("*.do")
public class UserController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doProcess");
		request.setCharacterEncoding("utf-8"); // 한글처리
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/"));
		System.out.println(uri);
			
			 if(action.equals("/joinProc.do")) {
			 String userId = request.getParameter("userId");
			 String password = request.getParameter("password");			 
			 String userName = request.getParameter("userName");
			 String userAddress = request.getParameter("userAddress");
			 String email = request.getParameter("email");
			 Date registrationDate = new Date(System.currentTimeMillis());
			 String tel = request.getParameter("tel");
			 Integer age = null; // 초기화
			 String ageParameter = request.getParameter("age");
			 if (ageParameter != null && !ageParameter.isEmpty()) {
			     try {
			         age = Integer.valueOf(ageParameter); // 문자열을 Integer로 변환
			     } catch (NumberFormatException e) {
			         e.printStackTrace();
			     }
			 }
			 
             // DB 처리
			 UserDAO dao = new UserDAO();
			 UserDTO dto = new UserDTO(userId, password, userName, userAddress, email, registrationDate, tel, age);
			 dao.insertUser(dto);
			 
			 // 회원가입 성공 여부 메세지 출력
			 System.out.println("회원가입 성공");
			 
			 //	로그인 페이지로 이동	
			String path = request.getContextPath() +"/user/login.jsp";
			response.sendRedirect(path);
			}else if(action.equals("/loginProc.do")) { // 로그인 처리

            // 1. 값 받아오기
            String userId = request.getParameter("userId");
            String password = request.getParameter("password");

            boolean isLogin = false;

            // 2. DB 처리
            UserDAO dao = new UserDAO();
            UserDTO dto = new UserDTO();
            dto.setUserId(userId);
            dto = dao.getUser(dto);

            if(dto != null) {
                if(password.equals(dto.getPassword())) {
                    isLogin = true;
                }
            } 
            System.out.println("로그인 성공");

            
            String jspFile = "";
            if (isLogin) { // 로그인 성공
                HttpSession session = request.getSession();
                session.setAttribute("userId", dto.getUserId());
                session.setAttribute("userName", dto.getUserName());
                session.setAttribute("userAddress", dto.getUserAddress());
                session.setAttribute("email", dto.getEmail());
                session.setAttribute("tel", dto.getTel());
                session.setAttribute("age", dto.getAge());
                jspFile = "main.jsp";
            } else { // 로그인 실패
                jspFile = "user/login.jsp";
            }

            // 3. 페이지 이동
            String path = request.getContextPath() + "/" + jspFile;
            response.sendRedirect(path);
            
        }else if(action.equals("/logoutProc.do")) { // 로그아웃 처리
            HttpSession session = request.getSession();
            session.invalidate(); // 세션 무효화
            System.out.println("로그아웃 성공");
            String path = request.getContextPath() + "/main.jsp"; // 메인 페이지로 이동
            response.sendRedirect(path);
        } else if(action.equals("/deleteProc.do")) {
        	HttpSession session = request.getSession();
        	String userId = (String)session.getAttribute("userId");
        	String password = request.getParameter("password");
        	int rs = 0;
        	boolean isCheck = false;
        	
        	UserDAO dao = new UserDAO();
        	UserDTO dto = new UserDTO();
        	dto.setUserId(userId);
        	dto = dao.getUser(dto);
        	
        	if(dto != null) {
        		if(password.equals(dto.getPassword())) {
        			rs = dao.delete(dto);
        			isCheck = true;
        		}
        	}
        	
        	String path = "";
        	if(isCheck) {
        		session.invalidate();
        		System.out.println("회원탈퇴 성공");
        		path = request.getContextPath() + "/main.jsp";
        		
        	} else {
        		path = request.getContextPath() + "/user/mypage.jsp";
        	}
        	response.sendRedirect(path);
        } else if(action.equals("/updateProc.do")) {
            HttpSession session = request.getSession();
            String id = (String)session.getAttribute("userId");
            String newPassword = request.getParameter("newPassword");
            String userName = request.getParameter("userName");
            String userAddress = request.getParameter("userAddress");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            String ageString = request.getParameter("age");
            Integer age = null;
            if (ageString != null && !ageString.isEmpty()) {
                age = Integer.parseInt(ageString);
            }
            
            UserDAO dao = new UserDAO();
            UserDTO dto = new UserDTO(id, newPassword, userName, userAddress, email, tel, age);
            
            int result = dao.update(dto); // update 메서드 호출
            
            if (result > 0) {
                // 업데이트 성공
                session.setAttribute("userName", userName);
                System.out.println("업데이트 성공");
            } else {
                // 업데이트 실패
                System.out.println("업데이트 실패");
            }
            
            String path = request.getContextPath() + "/user/mypage.jsp";
            response.sendRedirect(path);
        }
    }
}
