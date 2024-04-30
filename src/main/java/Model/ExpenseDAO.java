package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.mysql.cj.conf.BooleanPropertyDefinition.AllowableValues;

import Model.ExpenseDTO;

public class ExpenseDAO {

	private static Connection connection=CreateConnection.createConnection();
	
	private static String addIncome="insert into expensemanager values(?,?,?,?,?,?,?,?,?,?,?,?)";
	private static String totalIncome="SELECT TotalIncome,Balance,TotalExpense FROM expensemanager where UserId=? ORDER BY Id DESC LIMIT 1";
	private static String transaction="SELECT * FROM expensemanager where UserId=? ORDER BY PaymentDate";
	private static String displayData="SELECT TotalIncome,TotalExpense,Balance FROM expensemanager WHERE UserId=? Order by Id desc limit 1";
	private static String displayDateWiseTransaction="select * from expensemanager where UserId=? AND PaymentDate Between ? AND ?";
	private static double income=0;
	private static double balance=0;
	private static double expense=0;
		
	
	UserDTO udto=new UserDTO();
	
	
	private void fetchTotalIncomeAndBalance(int userId)
	{
		try {
			PreparedStatement pstmt=connection.prepareStatement(totalIncome);
			pstmt.setInt(1, userId);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				income=rs.getDouble(1);
				balance=rs.getDouble(2);
				expense=rs.getDouble(3);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}	
	}
	
	public int addIncome(ExpenseDTO dto)
	{
		
		int count=0;
		fetchTotalIncomeAndBalance(dto.getUserId());
		try {
			PreparedStatement pstmt= connection.prepareStatement(addIncome);
			pstmt.setInt(1, dto.getId());
			pstmt.setDouble(2, dto.getIncome());
			pstmt.setDouble(3, dto.getExpense());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getPaymentMethod());
			pstmt.setString(6, dto.getNote());
			pstmt.setString(7, dto.getPaymentDate());
			pstmt.setString(8, dto.getPaymentTime());
			pstmt.setDouble(9, dto.getIncome()+income);
			pstmt.setDouble(10, dto.getExpense()+expense);
			pstmt.setDouble(11, dto.getIncome()+balance);
			pstmt.setInt(12, dto.getUserId());
			
			count=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public void addExpense(ExpenseDTO dto) 
	{
		fetchTotalIncomeAndBalance(dto.getUserId());
		try {
			PreparedStatement pstmt= connection.prepareStatement(addIncome);
			pstmt.setInt(1, dto.getId());
			pstmt.setDouble(2, dto.getIncome());
			pstmt.setDouble(3, dto.getExpense());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getPaymentMethod());
			pstmt.setString(6, dto.getNote());
			pstmt.setString(7, dto.getPaymentDate());
			pstmt.setString(8, dto.getPaymentTime());
			pstmt.setDouble(9, dto.getIncome()+income);
			pstmt.setDouble(10, dto.getExpense()+expense);
			pstmt.setDouble(11, income-(dto.getExpense()+expense));
			pstmt.setInt(12, dto.getUserId());

			
			int count=pstmt.executeUpdate();
			
			System.out.println(count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList transaction(int userId)
	{
		ArrayList<ExpenseDTO>allTransactionList=new ArrayList<>();
		try {

			PreparedStatement pstmt=connection.prepareStatement(transaction);
			pstmt.setInt(1, userId);
			ResultSet rs=pstmt.executeQuery();
			
			ExpenseDTO dto=null;
		
			while(rs.next())
			{
				dto=new ExpenseDTO();
				dto.setId(rs.getInt(1));
				dto.setIncome(rs.getDouble(2));
				dto.setExpense(rs.getDouble(3));
				dto.setCategory(rs.getString(4));
				dto.setPaymentMethod(rs.getString(5));
				dto.setNote(rs.getString(6));
				dto.setPaymentDate(rs.getString(7));
				dto.setPaymentTime(rs.getString(8));
				dto.setTotalIncome(rs.getDouble(9));
			    dto.setTotalExpense(rs.getDouble(10));
			     dto.setBalance(rs.getDouble(11));
				
			     allTransactionList.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allTransactionList;
	}

	public ExpenseDTO displayData(int id) {
		ExpenseDTO temp=null;
		try {
			
			PreparedStatement pstmt=connection.prepareStatement(displayData);
			pstmt.setInt(1, id);
			
			ResultSet rs=pstmt.executeQuery();
		
			if(rs.next())
			{
				temp=new ExpenseDTO();
				temp.setTotalIncome(rs.getDouble(1));
				temp.setTotalExpense(rs.getDouble(2));
				temp.setBalance(rs.getDouble(3));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return temp;
	}

	public ArrayList displayDateWiseTransaction(ExpenseDTO dto,int id) 
	{
		ArrayList<ExpenseDTO>allTransactionList=new ArrayList<>();

		ExpenseDTO temp=null;
		
		try {
			PreparedStatement pstmt=connection.prepareStatement(displayDateWiseTransaction);
			pstmt.setInt(1, id);
			pstmt.setString(2, dto.getStartPoint());
			pstmt.setString(3, dto.getEndPoint());
			
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				temp=new ExpenseDTO();
				temp.setId(rs.getInt(1));
				temp.setIncome(rs.getDouble(2));
				temp.setExpense(rs.getDouble(3));
				temp.setCategory(rs.getString(4));
				temp.setPaymentMethod(rs.getString(5));
				temp.setNote(rs.getString(6));
				temp.setPaymentDate(rs.getString(7));
				temp.setPaymentTime(rs.getString(8));
				temp.setTotalIncome(rs.getDouble(9));
				temp.setTotalExpense(rs.getDouble(10));
				temp.setBalance(rs.getDouble(11));
				temp.setUserId(rs.getInt(12));
				
				allTransactionList.add(temp);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allTransactionList;
	}





	
}
