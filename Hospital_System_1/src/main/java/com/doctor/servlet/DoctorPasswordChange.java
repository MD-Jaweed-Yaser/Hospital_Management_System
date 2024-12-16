package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorchangepassword")
public class DoctorPasswordChange extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("uid"));
		String oldpassword = req.getParameter("oldpassword");
		String newpassword = req.getParameter("newpassword");

		DoctorDao dao = new DoctorDao(DBconnect.getCon());

		HttpSession session = req.getSession();

		if (dao.checkOldPassword(userId, oldpassword)) {

			if (dao.changeNewPasssword(userId, newpassword)) {

				session.setAttribute("sucMsgd", "Password Changed successfully");
				resp.sendRedirect("doctor/edit_profile.jsp");

			} else {
				session.setAttribute("errorMsgd", "Something error on server");
				resp.sendRedirect("doctor/edit_profile.jsp");

			}

		} else {

			session.setAttribute("errorMsgd", "old password not matched");
			resp.sendRedirect("doctor/edit_profile.jsp");

		}
	}
}
