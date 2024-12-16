<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
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

	<p>Session adminObj: ${sessionScope.adminObj}</p>

	<c:if test="${empty adminObj }">

		<c:redirect url="../admin_login.jsp"></c:redirect>

	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">Admin DashBoard</p>
		
		
		<%  
		DoctorDao dao=new DoctorDao(DBconnect.getCon());
		AppointmentDao dao1=new AppointmentDao(DBconnect.getCon());
		SpecialistDao dao2=new SpecialistDao(DBconnect.getCon());
		UserDao dao3=new UserDao(DBconnect.getCon());
		
	int dc= dao.doctorCount();
	int ac= dao1.AppointmentCount();
	int sc=dao2.specCount();
	int uc=dao3.userCount();
	
		
		
		
		
		%>
		


		<c:if test="${not empty sucMsg }">

			<p class="text-center text-success fs-3">${sucMsg}</p>

			<c:remove var="sucMsg" scope="session"></c:remove>


		</c:if>
		<c:if test="${not empty errorMsg }">

			<p class="text-center text-danger fs-3">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session"></c:remove>




		</c:if>



		<div class=row>


			<div class="col-md-4">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br> <%= dc %>
						</p>
					</div>
				</div>
			</div>




			<div class="col-md-4">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User<br><%= uc %>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment<br><%= ac %>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-3" data-bs-toggle="modal"
				data-bs-target="#exampleModal">
				<div class="card shadow">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist<br><%= sc %>
						</p>
					</div>
				</div>
			</div>













		</div>


















	</div>























	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">


					<form action="../addSpecialist" method="post">

						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control">

						</div>


						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

















	<%@include file="../component/footer.jsp"%>


</body>
</html>