package mvc.dto;

import java.sql.Date;

public class UserDTO{
	private String userId;
	private String password;
	private String userName;
	private String userAddress;
	private String email;
	private Date registrationDate;
	private String tel;
	private Integer age;
	
	public UserDTO() {
		super();
	}
	
	public UserDTO(String userId, String password, String userName, String userAddress, String email,
			Date registrationDate, String tel, Integer age) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.userAddress = userAddress;
		this.email = email;
		this.registrationDate = registrationDate;
		this.tel = tel;
		this.age = age;
	}
	
	public UserDTO(String userId, String password, String userName, String userAddress, String email,
	        String tel, Integer age) {
	    super();
	    this.userId = userId;
	    this.password = password;
	    this.userName = userName;
	    this.userAddress = userAddress;
	    this.email = email;
	    this.tel = tel;
	    this.age = age;
	}
	
	public UserDTO(String id, String password2, String userName2, String userAddress2, String email2, String tel2,
			String age2) {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserAddress() {
		return userAddress;
	}
	
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getRegistrationDate() {
		return registrationDate;
	}
	
	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public Integer getAge() {
	    return age;
	}
	
	public void setAge(Integer age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", password=" + password + ", userName="
				+ userName + ", userAddress=" + userAddress + ", email=" + email + ", registrationDate="
				+ registrationDate + ", tel=" + tel + ", age=" + age + "]";
	}
}