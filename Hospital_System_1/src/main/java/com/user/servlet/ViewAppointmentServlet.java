package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconnect;
import com.entity.Appointment;
import com.entity.User;

@WebServlet("/viewAppointments")
public class ViewAppointmentServlet extends HttpServlet { // optional servlet . use this if c: is used in view_appoitmnet jsp page
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming userObj contains the logged-in user information
        HttpSession session = request.getSession();
        User userObj = (User) session.getAttribute("userObj");

        if (userObj == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        int userId = userObj.getId(); // Retrieve user ID from session
        AppointmentDao appointmentDao = new AppointmentDao(DBconnect.getCon());
        List<Appointment> appointments = appointmentDao.getAppointmentByLoginUser(userId);

        // Set the appointment list as a request attribute and forward to JSP
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("view_appointment.jsp").forward(request, response);
    }
}
