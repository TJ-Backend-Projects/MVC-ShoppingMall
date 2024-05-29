package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mvc.common.JDBCConnect;
import mvc.dto.BoardDTO;

public class BoardDAO {

	// 게시물 정보 가져오기
	public BoardDTO getBoard(BoardDTO dto) {
		Connection conn = null;      // DB 연결 객체
		PreparedStatement pstmt = null;     // SQL 실행 객체
		ResultSet rs = null;          // 결과 객체
		BoardDTO board = null;        // 결과를 담을 DTO 객체

		try {
			// 데이터베이스 연결
			conn = JDBCConnect.getConnection();

			// SQL 쿼리 작성
			String sql = "SELECT board_id, user_id, product_id, board_date, comments_content, img FROM board WHERE board_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_id());
			rs = pstmt.executeQuery(); // 쿼리 실행

			// 결과 처리
			if (rs.next()) {
				int boardId = rs.getInt("board_id");
				String userId = rs.getString("user_id");
				int productId = rs.getInt("product_id");
				String boardDate = rs.getString("board_date");
				String commentsContent = rs.getString("comments_content");
				String img = rs.getString("img");

				// 결과를 DTO에 담기
				board = new BoardDTO();
				board.setBoard_id(boardId);
				board.setUser_id(userId);
				board.setProduct_id(productId);
				board.setBoard_date(boardDate);
				board.setComments_content(commentsContent);
				board.setImg(img);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 예외 처리
		} finally {
			// 자원 해제
			JDBCConnect.close(pstmt, conn);
		}

		return board;
	}



	public int writePost(BoardDTO board) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	        // DB 연결
	        conn = JDBCConnect.getConnection();
	        
	        // insert문
	        String sql = "INSERT INTO board(user_id, product_id, board_title, board_date, comments_content, img) VALUES(?,?,?,?,?,?)";
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, board.getUser_id());
	        pstmt.setInt(2, board.getProduct_id());
	        pstmt.setString(3, board.getBoard_title());
	        pstmt.setString(4, board.getBoard_date());
	        pstmt.setString(5, board.getComments_content());
	        pstmt.setString(6, board.getImg());
	        
	        return pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
			JDBCConnect.close(pstmt, conn);
	    }
	    return -1;
	}


	public BoardDTO getBoardDTO(int board_id) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    try {
	        conn = JDBCConnect.getConnection(); // getConnection 메서드를 통해 Connection 객체 가져오기
	        String SQL = "SELECT * FROM Board WHERE board_id = ?";
	        pstmt = conn.prepareStatement(SQL);
	        pstmt.setInt(1, board_id);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                BoardDTO board = new BoardDTO();
	                board.setBoard_id(rs.getInt("board_id"));
	                board.setUser_id(rs.getString("user_id"));
	                board.setProduct_id(rs.getInt("product_id"));
	                board.setBoard_title(rs.getString("board_title"));
	                board.setBoard_date(rs.getString("board_date"));
	                board.setComments_content(rs.getString("comments_content"));
	                board.setImg(rs.getString("img"));
	                return board;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCConnect.close(pstmt, conn);
	    }
	    return null;
	}


	public ArrayList<BoardDTO> getAllPost() {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ArrayList<BoardDTO> allPost = new ArrayList<>();

	    try {
	        conn = JDBCConnect.getConnection(); // 데이터베이스 연결 설정
	        String query = "SELECT * FROM Board";
	        pstmt = conn.prepareStatement(query);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                BoardDTO post = new BoardDTO();
	                post.setBoard_id(rs.getInt("board_id"));
	                post.setUser_id(rs.getString("user_id"));
	                post.setProduct_id(rs.getInt("product_id"));
	                post.setBoard_title(rs.getString("board_title"));
	                post.setBoard_date(rs.getString("board_date"));
	                post.setComments_content(rs.getString("comments_content"));
	                post.setImg(rs.getString("img"));
	                allPost.add(post);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCConnect.close(pstmt, conn);
	    }

	    return allPost;
	}




	// 리소스 닫기 메서드
	private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			// 커넥션 객체는 닫으면 안됨
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 게시글 삭제 메서드
	public void deletePost(int boardId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        conn = JDBCConnect.getConnection();
	        String sql = "DELETE FROM Board WHERE board_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, boardId);
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
			JDBCConnect.close(pstmt, conn);
	    }
	}
	// 게시글 수정 메서드
	public void updatePost(BoardDTO board) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	    	conn = JDBCConnect.getConnection(); // getConnection 메서드를 통해 Connection 객체 가져오기
	        String sql = "UPDATE Board SET board_title = ?, comments_content = ? WHERE board_id = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, board.getBoard_title());
	        pstmt.setString(2, board.getComments_content());
	        pstmt.setInt(3, board.getBoard_id());
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
			JDBCConnect.close(pstmt, conn);
	    }
	}
}
