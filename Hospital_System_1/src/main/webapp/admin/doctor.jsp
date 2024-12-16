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
<%@include file="../component/allcss.jsp"%>

</head>
<body>

	<%@include file="navbar.jsp"%>



	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card shadow">

					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<c:if test="${not empty sucMsg }">

							<p class="text-center text-success fs-3">${sucMsg}</p>

							<c:remove var="sucMsg" scope="session"></c:remove>


						</c:if>
						<c:if test="${not empty errorMsg }">

							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"></c:remove>




						</c:if>

						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualfication</label> <input
									type="text" required name="qualification" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control">
									<option>--select--</option>

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
									required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input
									type="text" required name="mobno" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control">
							</div>

							<div>

								<button type="submit" class="btn btn-primary">Submit</button>

							</div>


						</form>
					</div>
				</div>
			</div>



	
		</div>
	</div>



















	<%@include file="../component/footer.jsp"%>

</body>
</html>