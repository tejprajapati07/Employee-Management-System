<%@ page import="java.util.List, com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            overflow: auto; /* Allow scrolling if needed */
        }

        h2 {
            margin-bottom: 30px;
            font-size: 2.5rem;
            color: #444;
            text-transform: uppercase; /* Make the heading uppercase */
            letter-spacing: 2px; /* Space out the letters */
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2); /* Subtle text shadow */
        }

        /* Card Container */
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* Increase card size */
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
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for hover */
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
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2); /* Stronger shadow on hover */
        }

        /* Icon Styling */
        .card i {
            font-size: 3.5rem; /* Increased icon size */
            margin-bottom: 10px;
            color: #333; /* Black color for icons */
            position: absolute;
            top: 15px; /* Positioning the icon */
        }

        /* Text below icon */
        .card h3 {
            margin-top: 50px; /* Margin to space from icon */
            font-size: 1.5rem; /* Font size for text */
            font-weight: bold; /* Bold text */
            color: #444; /* Heading color */
        }

        /* Link Styling */
        .card a {
            display: inline-block;
            margin-top: 15px; /* Space above link */
            padding: 10px 20px;
            background-color: #333; /* Black background for links */
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s; /* Smooth transition for hover */
        }

        .card a:hover {
            background-color: #555; /* Darker shade on hover */
            transform: scale(1.05); /* Slight scale up on hover */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            h2 {
                font-size: 2rem; /* Adjust heading size */
            }
            .card i {
                font-size: 2.5rem; /* Adjust icon size */
            }
            .card {
                padding: 30px; /* Adjust padding for smaller screens */
            }
        }
    </style>
</head>
<body>

    <h2>Manager Dashboard</h2>

    <!-- Cards for Different Sections -->
    <div class="card-container">
        <div class="card">
            <i class="fas fa-user-plus"></i>
            <h3>Add New Employee</h3>
            <a href="/createEmployee">Add Employee</a>
        </div>
        <div class="card">
            <i class="fas fa-users"></i>
            <h3>View and Edit Employees</h3>
            <a href="/manager/employees">View Employees</a>
        </div>
        <div class="card">
            <i class="fas fa-user-tie"></i>
            <h3>View All Managers</h3>
            <a href="/manager/viewManagers">View Managers</a>
        </div>
        <div class="card">
            <i class="fas fa-filter"></i>
            <h3>Filter Employees</h3>
            <a href="/manager/filter">Filter Employees</a>
        </div>
        <div class="card">
            <i class="fas fa-sign-out-alt"></i>
            <h3>Logout</h3>
            <a href="/logout">Logout</a>
        </div>
    </div>

</body>
</html>
