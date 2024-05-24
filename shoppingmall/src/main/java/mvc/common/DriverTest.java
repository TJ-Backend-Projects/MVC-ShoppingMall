package mvc.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DriverTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn;
		
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/kdigital?serverTimezone=UTC";
			String user = "root";
			String pw = "rpass";
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("DB 연결 성공");
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("SQLException : 디비 연동에 실패했습니다" );
		}catch(Exception e2) {
			System.out.println("Exception : "+e2);
		}

	}

}