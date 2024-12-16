package com.user.servlet;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String passowrd = req.getParameter("password");

			User user = new User(fullname, email, passowrd);

			UserDao userDao = new UserDao(DBconnect.getCon());

			HttpSession session = req.getSession();

			boolean f = userDao.userRegister(user);

			if (f == true) {
				session.setAttribute("sucMsg", "registered successfully");
				resp.sendRedirect("signup.jsp");
				System.out.println("Register successfully"); // for console
			} else {
				session.setAttribute("errorMsg", " something wrong on server");
				resp.sendRedirect("signup.jsp");
				System.out.println("something wrong on server"); // for console
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
