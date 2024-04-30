package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ExpenseDAO;
import Model.ExpenseDTO;
import Model.UserDAO;
import Model.UserDTO;
import Util.Message;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userEmail=req.getParameter("email");
		String userPassword=req.getParameter("password");
		
		UserDAO dao=new UserDAO();
		UserDTO dto2=dao.getUserbyEmailAndPassword(userEmail,userPassword);
		
		
		if(dto2==null)
		{
			Message msg=new Message("Inavalid details ! Try with another","error","alert-danger");
			
			HttpSession s=req.getSession();
			s.setAttribute("msg", msg);
			
			resp.sendRedirect("login_page.jsp");

		}else
		{
			UserDAO udao=new UserDAO();
			int id=udao.getUserId(userEmail);
			dto2.setId(id);
			
			ExpenseDAO dao2=new ExpenseDAO();
			ExpenseDTO dto3=dao2.displayData(id);
						
			HttpSession s=req.getSession(false);
			s.removeAttribute("msg");
			
			s.setAttribute("currentUser", dto2);
			
			RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
			req.setAttribute("DATA", dto3);
			rd.include(req, resp);
		}
	}
}
