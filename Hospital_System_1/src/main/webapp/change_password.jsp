<%@page import="com.db.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>

<%@include file="component/allcss.jsp"%>



</head>
<body>
	<%@include file="component/navbar.jsp"%>


<c:if test="${empty userObj }">

<c:redirect url="user_login.jsp"></c:redirect>

</c:if>


	<div class="container p-4">

		<div class="col-md-4 offset-md-4">

			<div class="card">

				<p class="text-center fs-3 p-2">Change Password</p>


				<c:if test="${not empty sucMsg}">

					<p class="text-center text-success fs-5">${sucMsg}</p>

					<c:remove var="sucMsg" scope="session" />


				</c:if>
				<c:if test="${not empty errorMsg}">

					<p class="text-center text-danger fs-5">${errorMsg}</p>

					<c:remove var="errorMsg" scope="session" />


				</c:if>


				<div class="card-body shadow">

					<form action="changepassword" method="post">

						<div class="mb-3">
							<label>Enter New Password</label> <input type="text"
								name="newpassword" class="form-control" required>
						</div>
						<div class="mb-3">
							<label>Enter old Password</label> <input type="text"
								name="oldpassword" class="form-control" required>
						</div>

						<input type="hidden" name="uid" value="${userObj.id}">

						<button class="btn btn-success col-md-12">Change password</button>


					</form>


				</div>

			</div>


		</div>


	</div>




	<%@include file="component/footer.jsp"%>

</body>
</html>