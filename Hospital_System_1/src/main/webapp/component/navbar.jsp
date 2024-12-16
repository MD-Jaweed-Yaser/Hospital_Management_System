
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house-medical"></i> Medi Home</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">


				<c:if test="${empty userObj }">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp">Admin</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp">Doctor</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">Appointment</a></li>
						

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp">User</a></li>


				</c:if>





				<c:if test="${not empty userObj }">
					<!-- dynamic navbar -->


					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">Appointment</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_appointment.jsp">View
							Appointment</a></li>

					<li class="dropdown"><a
						class="btn btn-success dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fa-solid fa-circle-user"></i>
							${userObj.fullName }
					</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="change_password.jsp">Change
									Password</a></li>
							<li><a class="dropdown-item" href="userlogout">Logout</a></li>
						</ul></li>

				</c:if>




				<!--     <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>   -->



			</ul>

		</div>
	</div>
</nav>