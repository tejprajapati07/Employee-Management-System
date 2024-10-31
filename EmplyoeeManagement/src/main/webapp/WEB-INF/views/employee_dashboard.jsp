<%@ page import="com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Profile</title>
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
            display: flex; /* Use flexbox for layout */
            height: 100vh; /* Full viewport height */
            font-family: 'Arial', sans-serif;
            overflow: hidden; /* Prevent scrolling */
        }

        /* Left Side Styling */
        .left {
            flex: 1; /* Take 1/3 of the space */
            background-color: #000; /* Black background */
            display: flex;
            align-items: center; /* Center vertically */
            justify-content: center; /* Center horizontally */
            padding: 20px; /* Padding for the image */
        }

        .left img {
            max-width: 100%; /* Make image responsive */
            height: auto; /* Maintain aspect ratio */
            border-radius: 10px; /* Rounded corners */
        }

        /* Right Side Styling */
        .right {
            flex: 2; /* Take 2/3 of the space */
            background-color: #f9f9f9; /* Light grey background */
            padding: 40px; /* Padding for the details */
            display: flex;
            flex-direction: column; /* Stack details vertically */
            justify-content: center; /* Center details vertically */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect */
            border-radius: 10px; /* Rounded corners for the right section */
            position: relative; /* Position relative to place logout link */
        }

        /* Logout Link Styling */
        .logout-link {
            position: absolute; /* Position at top-right */
            top: 20px; /* Space from top */
            right: 20px; /* Space from right */
            color: white;
            text-decoration: none; /* Remove underline from link */
            background-color: #dc3545; /* Red background */
            padding: 10px 20px; /* Padding for the link */
            border-radius: 5px; /* Rounded corners */
            font-size: 1rem; /* Font size */
            text-transform: uppercase; /* Uppercase text */
            transition: background-color 0.3s;
        }

        .logout-link:hover {
            background-color: #c82333; /* Darker red on hover */
        }

        /* Card Title */
        .right h2 {
            margin-bottom: 20px;
            font-size: 2.5rem; /* Larger font size for title */
            color: #333; /* Darker color for title */
            font-weight: bold; /* Bold title */
            text-align: center; /* Center the title */
            text-transform: uppercase; /* Capitalize all letters */
        }

        /* Details Container */
        .details {
            display: flex;
            flex-direction: column; /* Vertical stacking */
            gap: 20px; /* Space between details */
            font-size: 1.2rem; /* Larger font size for details */
            color: #444; /* Darker color for details */
            background-color: #fff; /* White background for details card */
            padding: 30px; /* Padding inside the details card */
            border-radius: 8px; /* Rounded corners for details card */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow for card */
        }

        /* Detail Row Styling */
        .detail-row {
            display: flex; /* Display each detail row as flexbox */
            align-items: center; /* Align icons and text vertically */
            border-bottom: 1px solid #ddd; /* Add a divider line between details */
            padding: 10px 0; /* Padding for spacing */
        }

        .detail-row:last-child {
            border-bottom: none; /* Remove bottom border from the last row */
        }

        /* Icon Styling */
        .details i {
            margin-right: 15px; /* Space between icon and text */
            color: #007bff; /* Primary color for icons */
            font-size: 1.5rem; /* Slightly larger icons */
        }

        /* Text Styling */
        .details span {
            font-weight: bold; /* Bold label for detail title */
            margin-right: 5px; /* Space between title and content */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            body {
                flex-direction: column; /* Stack left and right on smaller screens */
            }

            .left, .right {
                flex: none; /* Reset flex properties */
                width: 100%; /* Full width */
            }

            .right h2 {
                font-size: 1.8rem; /* Adjust title size for smaller screens */
            }

            .details {
                font-size: 1rem; /* Adjust detail font size */
            }

            .details i {
                font-size: 1.2rem; /* Adjust icon size */
            }
        }
    </style>
</head>
<body>

    <div class="left">
        <!-- Placeholder for Employee Image -->
        <img src="https://png.pngtree.com/png-clipart/20240321/original/pngtree-avatar-job-student-flat-portrait-of-man-png-image_14639683.png" alt="Employee Image"> <!-- Dummy image -->
    </div>

    <div class="right">
        <!-- Logout Link -->
        <a href="/logout" class="logout-link">Logout</a>
        
        <h2>Your Profile</h2>
        <%
            Employee employee = (Employee) request.getAttribute("employee");
            if (employee != null) {
        %>
            <div class="details">
                <div class="detail-row"><i class="fas fa-clipboard"></i><span>Employee ID:</span> <%= employee.getEmployeeId() %></div>
                <div class="detail-row"><i class="fas fa-user"></i><span>Name:</span> <%= employee.getName() %></div>
                <div class="detail-row"><i class="fas fa-envelope"></i><span>Email:</span> <%= employee.getEmail() %></div>
                <div class="detail-row"><i class="fas fa-user-tag"></i><span>Role:</span> <%= employee.getRole() %></div>
                <div class="detail-row"><i class="fas fa-briefcase"></i><span>Position:</span> <%= employee.getPosition() %></div>
                <div class="detail-row"><i class="fas fa-building"></i><span>Department:</span> <%= employee.getDepartment() %></div>
            </div>
        <%
            } else {
        %>
            <p>No employee data available.</p>
        <%
            }
        %>
    </div>

</body>
</html>
