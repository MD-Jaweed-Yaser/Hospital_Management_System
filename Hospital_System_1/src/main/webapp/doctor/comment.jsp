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
<style>
    input[readonly] {
        background-color: #e9ecef;  /* Light gray background */
        color: #495057;             /* Text color to match Bootstrap's input color */
        border: 1px solid #ced4da;  /* Add border to make it look like a normal input */
    }
    textarea {
        background-color: white;    /* Ensure the textarea remains editable */
    }
</style>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<c:if test="${empty docObj }">

		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-3">

		<div class="row">

			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-body">

						<p class="text-center fs-4">Patient Comment</p>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBconnect.getCon());
						Appointment ap = dao.getAppointmentById(id);
						%>
						<%="ID: " + request.getParameter("id")%>

						<form class="row" action="../updateStatus" method="post">

							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=ap.getFullname()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Age</label> <input type="text" readonly
									value="<%=ap.getAge()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Mob No</label> <input type="text" readonly
									value="<%=ap.getPhNo()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Diseases</label> <input type="text" readonly
									value="<%=ap.getDiseases()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
								type="hidden" name="did" value="<%=ap.getDoctorId()%>">


							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>



					</div>

				</div>

			</div>

		</div>
	</div>



	<%@include file="../component/footer.jsp"%>


</body>
</html>