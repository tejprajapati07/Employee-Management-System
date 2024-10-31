<%@ page import="java.util.List, com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtered Employees</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        /* Page title styling */
        h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 30px;
            color: #333;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
            font-size: 1rem;
        }

        td {
            font-size: 0.9rem;
            color: #333;
        }

        /* Row and cell border */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* No employees found message */
        p {
            text-align: center;
            font-size: 1.2rem;
            color: #666;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            table, th, td {
                font-size: 0.85rem;
            }

            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <h2>Filtered Employees</h2>

    <%
        List<Employee> employees = (List<Employee>) request.getAttribute("employees");
        if (employees != null && !employees.isEmpty()) {
    %>
        <table>
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Role</th>
                <th>Email</th>
                <th>Department</th>
                <th>Position</th>
                <th>City</th>
                <th>Salary</th>
            </tr>
            <%
                for (Employee employee : employees) {
            %>
                <tr>
                    <td><%= employee.getEmployeeId() %></td>
                    <td><%= employee.getName() %></td>
                    <td><%= employee.getRole() %></td>
                    <td><%= employee.getEmail() %></td>
                    <td><%= employee.getDepartment() %></td>
                    <td><%= employee.getPosition() %></td>
                    <td><%= employee.getCity() %></td>
                    <td><%= employee.getSalary() %></td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        } else {
    %>
        <p>No employees found matching the filter criteria.</p>
    <%
        }
    %>

</body>
</html>
