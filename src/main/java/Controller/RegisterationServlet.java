package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserDAO;
import Model.UserDTO;
import Util.Message;

@WebServlet("/RegisterServlet")
public class RegisterationServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter pw=resp.getWriter();
		String check=req.getParameter("check");
		
		resp.setContentType("text/html");
		
		
		if(check==null)
		{	
			Message msg=new Message("Please agree Terms and Conditions!","error","alert-danger");
			HttpSession s=req.getSession();
			s.setAttribute("msg", msg);
			
			resp.sendRedirect("register_page.jsp");
		}
		else {
			String name=req.getParameter("user_name");
			String email=req.getParameter("user_email");
			String password=req.getParameter("user_password");
			String gender=req.getParameter("gender");
			String about=req.getParameter("about");
			
			UserDTO dto=new UserDTO(name,email,password,gender,about);
			
			UserDAO dao=new UserDAO();
			int count=dao.insertData(dto);
			
			if(count==1)
			{
				Message msg=new Message("Registeration Successfull!!!", "success", "alert-success");
				HttpSession s=req.getSession();
				s.setAttribute("msg", msg);

	            req.setAttribute("dto", dto);
	            req.getRequestDispatcher("login_page.jsp").include(req, resp);

			}

			else {
				RequestDispatcher rd=req.getRequestDispatcher("register_page.jsp");

				Message msg=new Message("Something went wrong!!!", "error", "alert-danger");
				HttpSession s=req.getSession();
				s.setAttribute("msg", msg);
				rd.include(req, resp);
				
			}			
		}
	}

}
