package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBconnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id= Integer.parseInt(req.getParameter("id"));
			String fullname = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			
		Doctor d= new Doctor(id,fullname, dob, qualification, spec, email, mobno,"");
		
		DoctorDao dao=new DoctorDao(DBconnect.getCon());
		
		HttpSession session=req.getSession();
		
	

        System.out.println("Before updating session: " + session.getAttribute("docObj"));

		
		
		if (dao.editDoctorProfile(d)) {
			
			
			session.setMaxInactiveInterval(10); // Timeout after 10 seconds of inactivity

			
			  // Fetch the updated doctor details and update the session
            Doctor updatedDoctor = dao.getDoctorsById(id);
            session.setAttribute("docObj", updatedDoctor); // Update session attribute with the new profile data
		
            System.out.println("After updating session: " + session.getAttribute("docObj"));

            
            session.setAttribute("sucMsg", "Doctor updated Successfully");
			resp.sendRedirect("doctor/edit_profile.jsp");
			
		}else {
			session.setAttribute("errorMsg", "Somethings error occured");
			resp.sendRedirect("doctor/edit_profile.jsp");
			
		}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
