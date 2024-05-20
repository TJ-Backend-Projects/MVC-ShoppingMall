package mvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mvc.common.JDBCConnect;
import mvc.dto.UserDTO;

public class UserDAO {
	
	// user 정보 가져오기
    public UserDTO getUser(UserDTO dto) {
        Connection conn = null;      // DB 연결 객체
        PreparedStatement pstmt = null;     // SQL 실행 객체
        ResultSet rs = null;          // 결과 객체

        try {
            // 데이터베이스 연결
            conn = JDBCConnect.getConnection();

            // SQL 쿼리 작성
            String sql = "SELECT user_id, password, user_name, address, email, registration_date, tel, age FROM user WHERE user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getUserId());
            rs = pstmt.executeQuery(); // 쿼리 실행

            // 결과 처리
            if (rs.next()) {
                String userId = rs.getString("user_id");
                String password = rs.getString("password");
                String userName = rs.getString("user_name");
                String userAddress = rs.getString("address");
                String email = rs.getString("email");
                Date registrationDate = rs.getDate("registration_date");
                String tel = rs.getString("tel");
                int age = rs.getInt("age");

                // 결과를 DTO에 담기
                dto = new UserDTO(userId, password, userName, userAddress, email, registrationDate, tel, age);
            } else {
                dto = null; // 사용자 정보가 없을 경우 null 반환
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
        } finally {
            // 자원 해제
            JDBCConnect.close(rs, pstmt, conn);
        }

        return dto;
    }
	
	
	public int insertUser(UserDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		
		try {
			// DB 연결
			conn = JDBCConnect.getConnection();
			
			// insert문
			String sql = "insert into user(user_id, password, user_name, address, email, registration_date, tel, age) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			// value값 세팅
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserAddress());
			pstmt.setString(5, dto.getEmail());
			pstmt.setDate(6, dto.getRegistrationDate());
			pstmt.setString(7, dto.getTel());
			// age값이 null일 때
			Integer age = dto.getAge();
			if(age == null) {
				pstmt.setNull(8, java.sql.Types.INTEGER);
			}else {
				pstmt.setInt(8, age);
			}
			
			rs = pstmt.executeUpdate();
			System.out.println("rs >>>>>>>>>>>>>>>." + rs);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCConnect.close(pstmt,conn);
		}
		
		return rs;
	}
	
	
}