package mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.dao.BoardDAO;
import mvc.dto.BoardDTO;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 	   System.out.println("doGet");
 	   doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("doPost");
    	doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doProcess");
    	request.setCharacterEncoding("utf-8"); // 한글처리
        String uri = request.getRequestURI();
        String action = uri.substring(uri.lastIndexOf("/"));
        System.out.println(uri);
        
        if(action.equals("/writeProc.do")) {
            // 글쓰기 처리
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String userId = request.getParameter("userId"); // 세션에서 가져오거나 파라미터로 받아옴
            // 필요한 파라미터들을 받아오고 DTO에 저장

            BoardDAO boardDAO = new BoardDAO();
            BoardDTO boardDTO = new BoardDTO();
            boardDTO.setUser_id(userId);
            boardDTO.setBoard_title(title);
            boardDTO.setComments_content(content);
            boardDAO.writePost(boardDTO); // 게시글 작성 메서드 호출

            // 작성 후 어떤 페이지로 이동할지 결정
            String path = request.getContextPath() + "/board/board.jsp";
            response.sendRedirect(path);
        } else if(action.equals("/deleteProc.do")) {
            // 글 삭제 처리
            int boardId = Integer.parseInt(request.getParameter("boardId")); // 삭제할 게시글의 ID 받아오기

            BoardDAO boardDAO = new BoardDAO();
            boardDAO.deletePost(boardId); // 게시글 삭제 메서드 호출

            // 삭제 후 어떤 페이지로 이동할지 결정
            String path = request.getContextPath() + "/board/board.jsp";
            response.sendRedirect(path);
        } else if(action.equals("/updateProc.do")) {
            // 글 수정 처리
            int boardId = Integer.parseInt(request.getParameter("boardId")); // 수정할 게시글의 ID 받아오기
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            BoardDAO boardDAO = new BoardDAO();
            BoardDTO boardDTO = new BoardDTO();
            boardDTO.setBoard_id(boardId);
            boardDTO.setBoard_title(title);
            boardDTO.setComments_content(content);
            boardDAO.updatePost(boardDTO); // 게시글 수정 메서드 호출

            // 수정 후 어떤 페이지로 이동할지 결정
            String path = request.getContextPath() + "/board/board.jsp";
            response.sendRedirect(path);
        }
    }
}
