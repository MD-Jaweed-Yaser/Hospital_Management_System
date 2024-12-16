<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment List</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid p-5">
		<div class="row">
			<div class="col-md-9">
				<div class="card shadow">
					<div class="card-body">
						<p class="fs-3 text-center fw-bold text-success">Appointments
							Lists</p>



						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("userObj");
								AppointmentDao dao = new AppointmentDao(DBconnect.getCon());
								DoctorDao dao2 = new DoctorDao(DBconnect.getCon());

								List<Appointment> list = dao.getAppointmentByLoginUser(user.getId());
								System.out.println("Appointments Count: " + list.size()); // Debugging output

								if (list.isEmpty()) {
									out.println("<p class='text-center text-danger fs-3'>No appointments found.</p>");
								} else {
								%>

								<%
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorsById(ap.getDoctorId());
								%>
								<tr>
									<th><%=ap.getFullname()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullname()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %> <%=ap.getStatus()%> <%
 }
 %>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3 ms-auto">
				<img alt="" src="img/single1.jpeg" class="img-fluid"
					style="width: 100%; height: auto;">
			</div>
		</div>
	</div>

	<%@include file="../component/footer.jsp"%>
</body>
</html>








<%-- <c:forEach var="appointment" items="${appointments}">
            <tr>
                <td>${appointment.id}</td>
                <td>${appointment.fullname}</td>
                <td>${appointment.gender}</td>
                <td>${appointment.age}</td>
                <td>${appointment.appoinDate}</td>
                <td>${appointment.email}</td>
                <td>${appointment.phNo}</td>
                <td>${appointment.diseases}</td>
                <td>${appointment.doctorId}</td>
                <td>${appointment.address}</td>
                <td>${appointment.status}</td>
            </tr>
        </c:forEach>
        
        --%>


