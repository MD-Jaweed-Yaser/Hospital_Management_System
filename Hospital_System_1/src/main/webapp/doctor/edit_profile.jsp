<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[readonly] {
	background-color: #e9ecef; /* Light gray background */
	color: #495057; /* Text color to match Bootstrap's input color */
	border: 1px solid #ced4da;
	/* Add border to make it look like a normal input */
}
</style>
<%@include file="../component/allcss.jsp"%>


</head>
<body>

	<%@include file="navbar.jsp"%>

	<c:if test="${empty docObj }">

		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>



	<div class="container p-4">

		<div class="row">

			<div class="col-md-4 ">

				<div class="card">

					<p class="text-center fs-3 p-2">Change Password</p>


					<c:if test="${not empty sucMsgd }">
						<p class="text-center text-success fs-3">${sucMsgd }</p>
						<c:remove var="sucMsgd" scope="session"></c:remove>
					</c:if>

					<c:if test="${not empty errorMsgd }">
						<p class="text-center text-danger fs-3">${errorMsgd }</p>
						<c:remove var="errorMsgd" scope="session"></c:remove>
					</c:if>


					<div class="card-body shadow">

						<form action="../doctorchangepassword" method="post">

							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newpassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter old Password</label> <input type="text"
									name="oldpassword" class="form-control" required>
							</div>

							<input type="hidden" name="uid" value="${docObj.id}">

							<button class="btn btn-success col-md-12">Change
								password</button>


						</form>


					</div>

				</div>


			</div>


			<div class="col-md-5 offset-md-2">

				<div class="card shadow">

					<p class="text-center fs-3">Edit Profile</p>

					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-5">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"></c:remove>
					</c:if>
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"></c:remove>
					</c:if>


					<div class="card-body">

						


						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${docObj.fullname }">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control" value="${docObj.dob }">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualfication</label> <input
									type="text" required name="qualification" class="form-control"
									value="${docObj.qualification}">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <label
									class="form-label">Specialist</label> <select name="spec"
									class="form-control">
									<option>${docObj.specialist}</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBconnect.getCon());
									List<Specialist> list = dao.getAllSpecialists();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>

									<%
									}
									%>
									<%--  we can also write like this instead of for loop
									while(it.hasNext()){
										Specialist s=it.next();
										 %>
							                <option><%= s.getSpecialistName() %></option>
							             <%
							          --%>



								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									readonly name="email" class="form-control"
									value="${docObj.email}">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input
									type="text" required name="mobno" class="form-control"
									value="${docObj.mobno }">
							</div>

							<input type="hidden" name="id" value="${docObj.id}">



							<button type="submit" class="btn btn-primary">Update</button>




						</form>



					</div>

				</div>

			</div>


		</div>
	</div>




	<%@include file="../component/footer.jsp"%>


</body>
</html>