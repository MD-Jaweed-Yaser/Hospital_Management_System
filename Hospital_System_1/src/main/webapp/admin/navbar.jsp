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
		<div class="collapse navbar-collapse d-flex"
			id="navbarSupportedContent">
			<ul class="navbar-nav mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">HOME</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="doctor.jsp">DOCTOR</a></li>
					
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="view_doctor.jsp">VIEW DOCTOR</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="adminPatient.jsp">PATIENT</a></li>
			</ul>

			<!-- Use d-flex and ms-auto to move this dropdown to the right -->
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown">
					<button class="btn bg-white text-color-black dropdown-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						Admin</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="../adminlogout">LogOut</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
