<%@ page import="java.util.List, com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtered Employees for Manager</title>
    <style>
        /* Add your custom styling here */
    </style>
</head>
<body>
    <h2>Filtered Employees</h2>

    <table border="1">
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
            List<Employee> employees = (List<Employee>) request.getAttribute("employees");
            if (employees != null && !employees.isEmpty()) {
        %>
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
        <%
            } else {
        %>
            <tr>
                <td colspan="8">No employees found matching the filter criteria.</td>
            </tr>
        <%
            }
        %>
    </table>

    <a href="/manager">Back to Dashboard</a> <!-- Redirect back to manager dashboard -->
</body>
</html>
