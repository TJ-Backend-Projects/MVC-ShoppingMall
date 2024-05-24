package mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import mvc.dto.BoardDTO;


public class BoardDAO {

    private Connection conn;
    private ResultSet rs;

    public BoardDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/kdigital?serverTimezone=UTC";
            String dbID = "root";
            String dbPassword = "rpass";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void saveBoard(BoardDTO board) {
        try {
            String query = "INSERT INTO Board (board_id, user_id, product_id, board_title, board_date, comments_content, img) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, board.getBoard_id());
            pstmt.setString(2, board.getUser_id());
            pstmt.setInt(3, board.getProduct_id());
            pstmt.setString(4, board.getBoard_title());
            pstmt.setString(5, board.getBoard_date());
            pstmt.setString(6, board.getComments_content());
            pstmt.setString(7, board.getImg());

            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getNext() {
        String SQL = "SELECT board_id FROM BOARD ORDER BY board_id DESC";
        try (PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int write(BoardDTO board) {
        try {
            String query = "INSERT INTO Board (board_id, user_id, product_id, board_title, board_date, comments_content, img) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, board.getUser_id());
            pstmt.setInt(3, board.getProduct_id());
            pstmt.setString(4, board.getBoard_title());
            pstmt.setString(5, board.getBoard_date());
            pstmt.setString(6, board.getComments_content());
            pstmt.setString(7, board.getImg());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<BoardDTO> getList(int pageNumber) {
        String SQL = "SELECT * FROM Board WHERE board_id < ? AND board_Available = 1 ORDER BY board_id LIMIT 10";
        ArrayList<BoardDTO> list = new ArrayList<>();
        try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, getNext() - ((pageNumber - 1) * 10));
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BoardDTO board = new BoardDTO();
                    board.setBoard_id(rs.getInt("board_id"));
                    board.setUser_id(rs.getString("user_id"));
                    board.setProduct_id(rs.getInt("product_id"));
                    board.setBoard_title(rs.getString("board_title"));
                    board.setBoard_date(rs.getString("board_date"));
                    board.setComments_content(rs.getString("comments_content"));
                    board.setImg(rs.getString("img"));
                    list.add(board);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public BoardDTO getBoardDTO(int board_id) {
        String SQL = "SELECT * FROM Board WHERE board_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
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
        }
        return null;
    }

    public ArrayList<BoardDTO> getUserPosts(String userId) {
        ArrayList<BoardDTO> userPosts = new ArrayList<>();
        String query = "SELECT * FROM Board WHERE user_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, userId);
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
                    userPosts.add(post);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userPosts;
    }
}