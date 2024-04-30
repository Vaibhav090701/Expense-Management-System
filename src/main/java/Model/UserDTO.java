package Model;

import java.sql.Timestamp;

public class UserDTO {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private Timestamp dateTime;
	private String about;
	private String profile;
	
	
	public UserDTO(String name, String email, String password, String gender, String about) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}

	
	
	public UserDTO() {
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	


}
