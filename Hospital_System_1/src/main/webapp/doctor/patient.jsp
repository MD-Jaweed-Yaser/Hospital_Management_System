
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container-fluid p-3">
		<div class="row">




			<div class="col-md-12">


				<div class="card shadow">

					<div class="card-body">

						<p class="fs-3 text-center">Patient Details</p>

						<c:if test="${not empty sucMsg }">

							<p class="text-center text-success fs-3">${sucMsg}</p>

							<c:remove var="sucMsg" scope="session"></c:remove>


						</c:if>
						<c:if test="${not empty errorMsg }">

							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"></c:remove>
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob no</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>


							<tbody>

								<%
								Doctor d = (Doctor) session.getAttribute("docObj");
								AppointmentDao dao = new AppointmentDao(DBconnect.getCon());
								List<Appointment> list = dao.getAppointmentByDoctorLogin(d.getId());

								for (Appointment ap : list) {
								%>


								<tr>

									<th><%=ap.getFullname()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a
										href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-success btn-sm">Comment </a>
									</td>


									<%
									} else {
									%>

									<a href="#" class="btn btn-success btn-sm disabled">Comment
									</a>
									</td>

									<%
									}
									%>




								</tr>


								<%
								}
								%>





							</tbody>


						</table>

					</div>
				</div>
			</div>
		</div>
	</div>














	<%@include file="../component/footer.jsp"%>

</body>
</html>