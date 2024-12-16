<%@page import="com.db.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>

<%@include file="component/allcss.jsp"%>



</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	<% Connection con= DBconnect.getCon();
	
// out.print(con);	 // to check whether it is connected with database or not
	
	%>


	<div id="carouselExample" class="carousel slide">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/img1.jpeg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/img3.jpeg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/img4.jpeg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">

				<div class="row">

					<div class="col-md-6">
						<div class="card shadow">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>"Our hospital ensures 100% safety with strict protocols
									and advanced healthcare standards."</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card shadow">
							<div class="card-body w-5">
								<p class="fs-5">Clean Environment</p>
								<p>"Our hospital maintains a clean and hygienic environment
									to ensure patient safety."</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card shadow">
							<div class="card-body">
								<p class="fs-5">Freindly Doctor</p>
								<p>"Our hospital is dedicated to providing compassionate
									care with friendly and attentive doctors." .</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card shadow">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Our hospital is dedicated to advancing healthcare through
									cutting-edge medical research and innovation.</p>
							</div>
						</div>

					</div>




				</div>


			</div>

			<div class="col-md-4 mt-5">

				<img src="img/doc.jpeg" height=350px style="padding-left: 100px">
			</div>

		</div>


	</div>


<hr>

<div class="container p-3">
		<p class="text-center fs-2">Our Team</p>

<div class="row">
<div class="col-md-3">
  
       <div class="card point-card">       
       <div class="card-body text-center">
       <img src="img/single.jpeg" width="250px" height="300px">
       <p class="fw-bold fs-5">Dr. Sameer khanna</p>
       <p class="fs-7">(CEO & Chairman)</p>
       </div>
       </div>
</div>

<div class="col-md-3">
  
       <div class="card point-card">       
       <div class="card-body text-center">
       <img src="img/single1.jpeg" width="250px" height="300px">
       <p class="fw-bold fs-5">Dr. Kashif</p>
       <p class="fs-7">(Chief Doctor)</p>
       </div>
       </div>
</div>
<div class="col-md-3">
  
       <div class="card point-card">       
       <div class="card-body text-center">
       <img src="img/single2.jpeg" width="250px" height="300px">
       <p class="fw-bold fs-5">Dr. sva kumar</p>
       <p class="fs-7">(Chief Doctor)</p>
       </div>
       </div>
</div>
<div class="col-md-3">
  
       <div class="card point-card">       
       <div class="card-body text-center">
       <img src="img/single3.jpeg" width="250px" height="300px">
       <p class="fw-bold fs-5">Dr. Niuise Paule</p>
       <p class="fs-7">(Chief Doctor)</p>
       </div>
       </div>
</div>


</div>


</div>

<%@include file="component/footer.jsp" %>

</body>
</html>