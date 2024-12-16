<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
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
					aria-current="page" href="patient.jsp">PATIENT</a></li>
			</ul>


				<div class="dropdown ms-auto">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fas fa-user-circle"></i> ${docObj.fullname }
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
					</ul>

				</div>
			</form>
		</div>
		</div>
</nav>
