<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>

	<%@include file="component/navbar.jsp"%>
	
		

	

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img src="img/single1.jpeg" class="img-fluid"
					style="height: 500px; object-fit: cover;"
					alt="Large Image with Aspect Ratio">
			</div>

			<div class="col-md-6">
				<div class="card shadow">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						
						<c:if test="${not empty sucMsg }">
						
						<p class="text-center text-success fs-3">${sucMsg}</p>
						
						<c:remove var="sucMsg" scope="session"></c:remove>
						
						</c:if>
						<c:if test="${not empty errorMsg }">
						
						<p class="text-center text-danger fs-3">${errorMsg}</p>
						
						<c:remove var="errorMsg" scope="session"></c:remove>
						
						</c:if>
						

						<form class="row g-3" action="addAppointment" method="post">
						
							<input type="hidden" name="userid" value="${userObj.id}">

							<div class="col-md-6">
								<label for="fullname" class="form-label">Full Name</label> <input
									type="text" class="form-control" id="fullname" name="fullname">
							</div>

							<div class="col-md-6">
								<label for="gender" class="form-label">Gender</label> <select
									class="form-control" id="gender" name="gender" required>
									<option value="">--select--</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="age" class="form-label">Age</label> <input
									type="number" class="form-control" id="age" name="age">
							</div>

							<div class="col-md-6">
								<label for="appoint_date" class="form-label">Appointment
									Date</label> <input type="date" class="form-control" id="appoint_date"
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="phno" class="form-label">Phone</label> <input
									type="tel" maxlength="10" class="form-control" id="phno"
									name="phno">
							</div>

							<div class="col-md-6">
								<label for="diseases" class="form-label">Diseases</label> <input
									type="text" class="form-control" id="diseases" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="doctor" class="form-label">Doctor</label> <select
									class="form-control" id="doctor" name="doctor">
									<option value="">--select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBconnect.getCon());

									List<Doctor> list = dao.getAllDoctors();
									for (Doctor d : list) {
									%>

									<option value="<%= d.getId() %>"><%= d.getFullname() %> (<%= d.getSpecialist()  %>)</option>



									<%
									}
									%>


									<!-- Add more doctor options as needed -->
								</select>
							</div>

							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" id="email" name="email">
							</div>

							<div class="col-md-12">
								<label for="address" class="form-label">Full Address</label>
								<textarea name="address" id="address" class="form-control"
									rows="3"></textarea>
							</div>

							<c:if test="${empty userObj}">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Login
									to Submit</a>
							</c:if>

							<c:if test="${not empty userObj}">
								<button type="submit"
									class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>

</body>
</html>
