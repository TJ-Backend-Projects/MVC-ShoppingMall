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
		
		if(action.equals("/join.do")) {
			String path = request.getContextPath() + "/user/join.jsp";
			response.sendRedirect(path);	
		} else if(action.equals("/login.do")) {
			String path = request.getContextPath() + "/user/login.jsp";
			response.sendRedirect(path);
		} else if(action.equals("/joinProc.do")) {
			
			 request.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
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
			
			 //	로그인 페이지로 이동	
			String path = request.getContextPath() +"/user/login.do";
			response.sendRedirect(path);
			}if(action.equals("/loginProc.do")) { // 로그인 처리

            // 1. 값 받아오기
            request.setCharacterEncoding("utf-8"); // 한글 처리
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
        }else if(action.equals("/logout.do")) { // 로그아웃 처리
            HttpSession session = request.getSession();
            session.invalidate(); // 세션 무효화
            String path = request.getContextPath() + "/main.jsp"; // 메인 페이지로 이동
            response.sendRedirect(path);
        }
    }
}
