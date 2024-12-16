package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changepassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldpassword=req.getParameter("oldpassword");
		String newpassword=req.getParameter("newpassword");
		
		UserDao dao=new UserDao(DBconnect.getCon());
		
		HttpSession session=req.getSession();
		
		
		if (dao.checkOldPassword(uid, oldpassword)) {
			
			if (dao.changeNewPasssword(uid, newpassword)) {
				
				session.setAttribute("sucMsg", "Password Changed");
				resp.sendRedirect("change_password.jsp");
				
			}else {
				session.setAttribute("errorMsg", "Something error on server");
				resp.sendRedirect("change_password.jsp");

			}
			
		}else {
			
			session.setAttribute("errorMsg", "old password not matched");
			resp.sendRedirect("change_password.jsp");

		}
		
	}

}
