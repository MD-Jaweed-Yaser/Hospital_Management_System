package com.admin.servlet;

import java.io.IOException;

import com.dao.SpecialistDao;
import com.db.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String spec_name=req.getParameter("specName");
		
		SpecialistDao dao=new SpecialistDao(DBconnect.getCon());
		
		boolean f = dao.addSpecilist(spec_name);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("sucMsg", "Specialist added");
			resp.sendRedirect("admin/index.jsp");
		
		}else {
		
			session.setAttribute("errorMsg", "semething wrong on server");
			resp.sendRedirect("admin/index.jsp");

		}
		
		

	}

}
