package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mvc.common.JDBCConnect;
import mvc.dto.UserDTO;

public class UserDAO {
	
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