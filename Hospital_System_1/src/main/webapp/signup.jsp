<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>

</head>
<body>

	<%@include file="component/navbar.jsp"%>



	<div class="container p-5">

		<div class="row">

			<div class="col-md-4 offset-md-4">

				<div class="card shadow">

					<div class="card-body">

						<p class="fs-4 text-center">User</p>


						<c:if test="${not empty sucMsg }">

							<p class="text-center text-success fs-3">${sucMsg}</p>

							<c:remove var="sucMsg" scope="session"></c:remove>


						</c:if>
						<c:if test="${not empty errorMsg }">

							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"></c:remove>




						</c:if>


						<form action="user_register" method="post">

							<div class="mb-3">
								<lable class="form-label">Full Name</lable>
								<input required name="fullname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<lable class="form-label">Email Address</lable>
								<input required name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<lable class="form-label">Password</lable>
								<input required name="password" type="passowrd"
									class="form-control">
							</div>

							<button class="btn bg-success text-white col-md-12">Register</button>

						</form>


					</div>

				</div>


			</div>


		</div>




	</div>

	<%@include file="component/footer.jsp"%>




</body>
</html>