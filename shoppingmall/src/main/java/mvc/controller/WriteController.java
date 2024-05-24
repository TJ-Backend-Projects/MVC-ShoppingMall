package mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import mvc.dao.BoardDAO;
import mvc.dto.BoardDTO;

public class WriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO = new BoardDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청에서 제목과 내용을 가져옴
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        // 현재 시간을 문자열로 변환하여 설정
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());

        // BoardDTO 객체 생성 및 값 설정
        BoardDTO board = new BoardDTO();
        board.setBoard_title(title);
        board.setComments_content(content);
        board.setBoard_date(date);

        // 데이터베이스에 글 데이터 저장
        boardDAO.saveBoard(board);

        // 글쓰기 성공 후 게시판 페이지로 리다이렉트
        response.sendRedirect("board.jsp");
    }
}
