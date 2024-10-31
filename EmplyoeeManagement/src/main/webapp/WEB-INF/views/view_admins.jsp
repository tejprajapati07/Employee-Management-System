<%@ page import="java.util.List, com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Admins</title>
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
            padding: 20px;
            text-align: center;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 2.5rem;
            color: #444;
            text-transform: uppercase;
        }

        /* Back to Dashboard Button */
        .back-btn {
            position: absolute; /* Position absolute for top-right placement */
            top: 20px; /* Space from the top */
            right: 20px; /* Space from the right */
            padding: 10px 20px; /* Padding for button */
            background-color: #333; /* Black Background */
            color: white; /* White text */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            text-decoration: none; /* Remove underline */
            font-size: 1rem; /* Font size */
            cursor: pointer; /* Pointer cursor */
        }

        .back-btn:hover {
            background-color: #555; /* Darker shade on hover */
        }

        /* Search Form */
        .search-container {
            margin-bottom: 20px; /* Space below the search box */
        }

        .search-container input {
            padding: 10px;
            width: 300px; /* Width of search input */
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .search-container button {
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-container button:hover {
            background-color: #555;
        }

        /* Table Styling */
        table {
            width: 100%;
            max-width: 800px; /* Max width for the table */
            margin: 0 auto; /* Center the table */
            border-collapse: collapse; /* Collapse borders */
            background: #ffffff; /* White background for the table */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Shadow effect */
            border-radius: 10px; /* Rounded corners */
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* Bottom border for rows */
        }

        th {
            background-color: #333; /* Black background for headers */
            color: white; /* White text for headers */
            font-size: 1.1rem;
        }

        tr:hover {
            background-color: #f1f1f1; /* Light grey on hover */
        }

        /* Actions Column */
        .actions {
            display: flex; /* Flexbox for button layout */
            gap: 5px; /* Space between buttons */
        }

        .actions button {
            padding: 5px 10px; /* Padding for buttons */
            background-color: #333; /* Black background for buttons */
            color: white; /* White text */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor */
            font-size: 0.9rem; /* Font size */
        }

        .actions button:hover {
            background-color: #555; /* Darker shade on hover */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            h2 {
                font-size: 2rem;
            }
            table {
                width: 100%; /* Full width on smaller screens */
            }
            th, td {
                padding: 10px; /* Reduce padding for smaller screens */
                font-size: 0.9rem; /* Smaller font size */
            }
        }
    </style>
</head>
<body>

    <a class="back-btn" href="/admin">Back to Dashboard</a>

    <h2>View All Admins</h2>

    <!-- Search Form -->
    <div class="search-container">
        <form action="/search" method="get">
            <input type="text" name="name" placeholder="Search Admin by Name" required>
            <button type="submit"><i class="fas fa-search"></i> Search</button>
        </form>
    </div>

    <table>
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Position</th>
            <th>Department</th>
            <th>Actions</th>
        </tr>
        <%
            List<Employee> employees = (List<Employee>) request.getAttribute("employees");
            if (employees != null) {
                for (Employee employee : employees) {
        %>
            <tr>
                <td><%= employee.getEmployeeId() %></td>
                <td><%= employee.getName() %></td>
                <td><%= employee.getEmail() %></td>
                <td><%= employee.getPosition() %></td>
                <td><%= employee.getDepartment() %></td>
                <td class="actions">
                    <form action="/edit/<%= employee.getId() %>" method="get">
                        <button type="submit"><i class="fas fa-edit"></i> Edit</button>
                    </form>
                    <form action="/delete/<%= employee.getId() %>" method="post" onsubmit="return confirm('Are you sure you want to delete this admin?');">
                        <button type="submit"><i class="fas fa-trash"></i> Delete</button>
                    </form>
                </td>
            </tr>
        <%
                }
            }
        %>
    </table>

</body>
</html>
