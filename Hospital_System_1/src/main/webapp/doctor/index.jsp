<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DoctorDao"%>
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

	<c:if test="${empty docObj }">

		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%
	Doctor d = (Doctor) session.getAttribute("docObj");
    DoctorDao dao = new DoctorDao(DBconnect.getCon());
    AppointmentDao dao2=new AppointmentDao(DBconnect.getCon());
    
	%>


	<p class="text-center text-success fs-3 p-3">Doctor Dashboard</p>

	<div class="container p-5">

		<div class="row">

			<div class="col-md-4 offset-md-2">

				<div class="card shadow">

					<div class="card-body text-center text-success">

						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="text-center fs-3">
							Doctor<br><%= dao.doctorCount() %>
						</p>

					</div>

				</div>

			</div>
			<div class="col-md-4 ">

				<div class="card shadow">

					<div class="card-body text-center text-success">

						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="text-center fs-3">
							Total Appointment <br>
							<%=
								    dao2.countAppointmentByDoctorId(d.getId())
							%>
						</p>

					</div>

				</div>

			</div>

		</div>

	</div>














	<%@include file="../component/footer.jsp"%>


</body>
</html>