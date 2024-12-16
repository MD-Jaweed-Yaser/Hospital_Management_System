<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>



	<div class="col-md-12 p-5">


		<div class="card">

			<div class="card-body shadow">


				<p class="text-center text-success fs-3">Patient Details</p>

				<table class="table">

					<thread>

					<tr>

						<th scope="col">Full Name</th>
						<th scope="col">Gender</th>
						<th scope="col">Age</th>
						<th scope="col">Appointment Date</th>
						<th scope="col">Email</th>
						<th scope="col">Mob no</th>
						<th scope="col">Diseases</th>
						<th scope="col">Doctor Name</th>
						<th scope="col">Address</th>
						<th scope="col">Status</th>


					</tr>


					</thread>

					<tbody>


						<%
						AppointmentDao dao = new AppointmentDao(DBconnect.getCon());
						DoctorDao dao2 = new DoctorDao(DBconnect.getCon());
						List<Appointment> list = dao.getAllAppointment();

						for (Appointment ap : list) {

							Doctor d = dao2.getDoctorsById(ap.getDoctorId());
						%>


						<tr>

							<th><%=ap.getFullname()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullname()%></td>
							<td><%=ap.getAddress()%></td>
							<td><%=ap.getStatus()%></td>


						</tr>


						<%
						}
						%>






					</tbody>


				</table>

			</div>

		</div>


	</div>








	<%@include file="../component/footer.jsp"%>


</body>
</html>