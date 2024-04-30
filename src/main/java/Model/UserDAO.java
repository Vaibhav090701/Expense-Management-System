package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO 
{
	private static Connection connection=CreateConnection.createConnection();
	
	private static String addUser="insert into userdetails (Id, UserName, Email, Password, Gender, About) values(?,?,?,?,?,?)";
	private static String getUser="select * from userdetails where Email=? AND Password=?";
	private static String getId="select Id from userdetails where Email=?";

	public int insertData(UserDTO dto) {
		
		int count=0;
		try {
			PreparedStatement pstmt=connection.prepareStatement(addUser);
			pstmt.setInt(1, 0);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPassword());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getAbout());
			
			count=pstmt.executeUpdate();
			
			System.out.println(count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
		
	}

	public UserDTO getUserbyEmailAndPassword(String userEmail, String userPassword) {
		
		UserDTO dto=null;

		try {
			PreparedStatement pstmt=connection.prepareStatement(getUser);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPassword);
			
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto=new UserDTO();
				dto.setId(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setPassword(rs.getString(4));
				dto.setGender(rs.getString(5));
				dto.setDateTime(rs.getTimestamp(6));
				dto.setAbout(rs.getString(7));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
		
		
	}

	public int getUserId(String userEmail) {
		
		int id=0;
		try {
			PreparedStatement pstmt=connection.prepareStatement(getId);
			pstmt.setString(1, userEmail);
			ResultSet rs= pstmt.executeQuery();
			
			if(rs.next())
			{
				id=rs.getInt(1);
			}
			System.out.println(id);
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
		
	}
	
	

		
		
	
	

}
