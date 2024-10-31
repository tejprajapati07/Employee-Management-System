<%@ page import="java.util.List, com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Employees</title>
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
            background-color: #f0f0f0;
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
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1rem;
            cursor: pointer;
        }

        .back-btn:hover {
            background-color: #555;
        }

        /* Search Form */
        .search-container {
            margin-bottom: 20px;
        }

        .search-container input {
            padding: 10px;
            width: 300px;
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
            max-width: 800px;
            margin: 0 auto;
            border-collapse: collapse;
            background: #ffffff;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: white;
            font-size: 1.1rem;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Actions Column */
        .actions {
            display: flex;
            gap: 5px;
        }

        .actions button {
            padding: 5px 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .actions button:hover {
            background-color: #555;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            h2 {
                font-size: 2rem;
            }
            table {
                width: 100%;
            }
            th, td {
                padding: 10px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

    <a class="back-btn" href="/admin">Back to Dashboard</a>

    <h2>View All Employees</h2>

    <!-- Search Form -->
    <div class="search-container">
        <form action="/search" method="get">
            <input type="text" name="name" placeholder="Search Employee by Name" required>
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
                    <form action="/delete/<%= employee.getId() %>" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?');">
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
