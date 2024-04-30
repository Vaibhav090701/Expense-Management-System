package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ExpenseDTO;
import Model.ServiceCLass;
import Model.UserDTO;
import Util.Message;
import Model.ExpenseDAO;


@WebServlet(urlPatterns = {"/addIncome","/addExpense","/transaction","/homePage","/dateWiseTransaction"})
public class ExpenseServlet extends HttpServlet {
		
	private static ExpenseDAO dao=new ExpenseDAO();
	private int userId=0;

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path=req.getServletPath();
		PrintWriter pw=resp.getWriter();

		HttpSession session=req.getSession(false);//check the session object is created or not.
		if(session!=null) {
			UserDTO dto=(UserDTO) session.getAttribute("currentUser");
			userId=dto.getId();
		
		switch (path) 
		{
		case "/addIncome" :
			addIncome(req,resp);
			break;
			
		case "/addExpense":
			addExpense(req,resp);
			break;		
			
		case "/transaction":
			alltransaction(req,resp);
			break;
			
		case "/homePage":
			break;
			
		case "/dateWiseTransaction":
			dateWiseTransaction(req,resp);
			break;	
		}
		
		}
		else {
			RequestDispatcher rd=req.getRequestDispatcher("login.html");
			Message msg=new Message("FIRST LOGIN", "error", "alert-danger");
			
			session.setAttribute("msg", msg);
			resp.sendRedirect("login_page.jsp");

		}
	}

	private void dateWiseTransaction(HttpServletRequest req, HttpServletResponse resp) {
		ServiceCLass s1=new ServiceCLass();
		String startPoint=ServiceCLass.startPoint();
		String endPoint=ServiceCLass.endPoint();
		
		String temp1=req.getParameter("startDate");
		String temp2=req.getParameter("endDate");
		int id=userId;
		
		if(temp1!=null && temp2!=null)
		{
			startPoint=temp1;
			endPoint=temp2;
		}	
		
		ExpenseDTO dto=new ExpenseDTO();
		dto.setStartPoint(startPoint);
		dto.setEndPoint(endPoint);
		int id1=userId;	
	    ArrayList<ExpenseDTO>displayAllTransactionList =new ArrayList<>(dao.displayDateWiseTransaction(dto,id1));
		
	    RequestDispatcher rd=req.getRequestDispatcher("Transaction.jsp");
		req.setAttribute("DATA", displayAllTransactionList);
		
	    try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void alltransaction(HttpServletRequest req, HttpServletResponse resp) 
	{
	    ArrayList<ExpenseDTO>displayAllTransactionList =new ArrayList<>(dao.transaction(userId));
	    
	    RequestDispatcher rd=req.getRequestDispatcher("Transaction.jsp");
	    req.setAttribute("DisplayAllTransaction", displayAllTransactionList);
	    try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void addExpense(HttpServletRequest req, HttpServletResponse resp) {
		ExpenseDTO dto2=null;

		try {
		
		double expenseAmount=Double.parseDouble(req.getParameter("expenseAmount"));
		String expenseCategory=req.getParameter("expensecategory");
		String expenseType=req.getParameter("expenseType");
		String expenseNote=req.getParameter("expenseNote");
		String expenseDate=req.getParameter("expenseDate");
		String expenseTime=req.getParameter("expenseTime");
				
		ExpenseDTO dto=new ExpenseDTO();
		dto.setExpense(expenseAmount);
		dto.setCategory(expenseCategory);
		dto.setPaymentMethod(expenseType);
		dto.setNote(expenseNote);
		dto.setPaymentDate(expenseDate);
		dto.setPaymentTime(expenseTime);
		dto.setUserId(userId);

		dao.addExpense(dto);
		dto2= dao.displayData(dto.getUserId());
		
		RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
		
			Message msg=new Message("Expense Added Successfully!!!","success","alert-success");
			
			HttpSession s=req.getSession();
			s.setAttribute("msg", msg);
			
			req.setAttribute("DATA", dto2);
			
			rd.include(req, resp);
			
		}catch (Exception e) 
		{
			RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");

			Message msg=new Message("Something went wrong!!!","error","alert-danger");
			
			HttpSession s=req.getSession();
			s.setAttribute("msg", msg);
			req.setAttribute("DATA", dto2);
			try {
				rd.include(req, resp);
			} catch (ServletException | IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		}
		
	private void addIncome(HttpServletRequest req, HttpServletResponse resp) {
		
		ExpenseDTO dto2=null;
		try
		{
		
		String amount=req.getParameter("incomeAmount");
		String incomeCategory=req.getParameter("incomecategory");
		String incomeType=req.getParameter("incomeType");
		String incomeNote=req.getParameter("incomeNote");
		String incomeDate=req.getParameter("incomeDate");
		String incomeTime=req.getParameter("incomeTime");
				
		double incomeAmount=Double.parseDouble(amount);
		
		ExpenseDTO dto=new ExpenseDTO();
		dto.setIncome(incomeAmount);
		dto.setCategory(incomeCategory);
		dto.setPaymentMethod(incomeType);
		dto.setNote(incomeNote);
		dto.setPaymentDate(incomeDate);
		dto.setPaymentTime(incomeTime);
		dto.setUserId(userId);
		
		int count=dao.addIncome(dto);
		System.out.println(count);
		dto2= dao.displayData(dto.getUserId());
		RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");

				
			Message msg=new Message("Income Added Successfully!!!","success","alert-success");
			
			HttpSession s=req.getSession();
			s.setAttribute("msg", msg);
			
			req.setAttribute("DATA", dto2);
			rd.include(req, resp);
					
		
	} catch (Exception e) {
		
		RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
		Message msg=new Message("Something went wrong!!!","error","alert-danger");
		
		HttpSession s=req.getSession();
		s.setAttribute("msg", msg);
		req.setAttribute("DATA", dto2);
		try {
			rd.include(req, resp);
		} catch (ServletException | IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		
	}
	}
}