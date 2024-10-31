<%@ page import="java.util.List, com.example.employee.model.Employee"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<!-- FontAwesome CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* Reset */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* Body Styling */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f0f0f0; /* Light Grey Background */
	color: #333;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start; /* Align to the top */
	height: 100vh;
	text-align: center;
	padding: 20px; /* Add some padding */
}

h2 {
	margin-bottom: 30px;
	font-size: 2.5rem;
	color: #444;
	text-transform: uppercase; /* Make the heading uppercase */
	letter-spacing: 2px; /* Space out the letters */
}

/* Card Container */
.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	/* Increase card size */
	gap: 20px;
	width: 90%;
	max-width: 900px; /* Increased max width */
	margin-top: 20px; /* Margin for spacing */
}

/* Card Styling */
.card {
	background: #ffffff; /* White Background */
	padding: 40px; /* Increased padding */
	border-radius: 15px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Softer shadow */
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	/* Smooth transition for hover */
	text-decoration: none;
	color: #333;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
	position: relative; /* For positioning of icon */
	min-height: 150px; /* Set a minimum height for consistency */
}

.card:hover {
	transform: translateY(-5px); /* Slight lift */
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
	/* Stronger shadow on hover */
}

/* Make the entire card clickable */
.card a {
	text-decoration: none;
	color: inherit;
	display: block;
	width: 100%;
	height: 100%;
}

/* Icon Styling */
.card i {
	font-size: 3.5rem; /* Increased icon size */
	margin-bottom: 10px;
	color: #007bff; /* Bootstrap Primary Color for icons */
}

/* Text below icon */
.card p {
	margin-top: 10px; /* Adjusted margin */
	font-size: 1.2rem; /* Font size for text */
	font-weight: bold; /* Bold text */
}

/* Responsive Design */
@media ( max-width : 600px) {
	h2 {
		font-size: 2rem;
	}
	.card i {
		font-size: 2.5rem; /* Adjust icon size */
	}
}
</style>
</head>
<body>

	<h2>Admin Dashboard</h2>

	<div class="card-container">
		<a href="/create" class="card"> <i class="fas fa-user-plus"></i>
			<p>Add New Employee</p>
		</a> <a href="/viewAdmins" class="card"> <i class="fas fa-users-cog"></i>
			<p>View All Admins</p>
		</a> <a href="/viewManagers" class="card"> <i class="fas fa-user-tie"></i>
			<p>View All Managers</p>
		</a> <a href="/viewEmployees" class="card"> <i class="fas fa-users"></i>
			<p>View All Employees</p>
		</a> <a href="/filter" class="card"> <i class="fas fa-filter"></i>
			<p>Filter Employees</p>
		</a> <a href="/logout" class="card"> <i class="fas fa-sign-out-alt"></i>
			<p>Logout</p>
		</a>
	</div>

</body>
</html>
