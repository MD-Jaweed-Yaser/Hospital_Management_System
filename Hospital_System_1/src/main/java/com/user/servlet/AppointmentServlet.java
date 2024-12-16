package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBconnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullname = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appoint_date = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctor_id = Integer.parseInt(req.getParameter("doctor"));
		 String	  address = req.getParameter("address");

		 Appointment appointment=new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address,"Pending");
		 
		 AppointmentDao dao=new AppointmentDao(DBconnect.getCon());
		 
		 HttpSession session=req.getSession();
		 
		 if(dao.addAppointment(appointment)){
			
			 session.setAttribute("sucMsg","Appointment added successfull");
			 resp.sendRedirect("user_appointment.jsp");
			 
		 }else {
			 session.setAttribute("errorMsg","something wrong on server");
			 resp.sendRedirect("user_appointment.jsp");
			 
		}

		 
	}

}
