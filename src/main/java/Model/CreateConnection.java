package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CreateConnection {
	
	static Connection connection=null;
	
	private static String url="jdbc:mysql://localhost:3306/expense_manager";
	private static String userName="root";
	private static String password="101@Vaibhav";
	
	private CreateConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url,userName,password);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
	
	public static Connection createConnection()
	{
		if(connection==null)
		{
			new CreateConnection();
		}
		return connection;
	}

}
