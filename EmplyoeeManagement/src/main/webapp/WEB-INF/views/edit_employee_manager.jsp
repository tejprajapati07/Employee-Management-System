<%@ page import="com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
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

        /* Form Container */
        .form-container {
            background: white; /* White background for the form */
            padding: 30px; /* Padding for the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Shadow effect */
            max-width: 800px; /* Max width for the form */
            margin: 0 auto; /* Center the form */
            text-align: left; /* Align text to the left */
        }

        /* Flexbox for Form Groups */
        .form-group {
            display: flex; /* Use flexbox */
            justify-content: space-between; /* Space between elements */
            margin-bottom: 20px; /* Space below groups */
        }

        /* Styling for Labels and Inputs */
        label {
            flex: 1; /* Take equal space */
            margin-right: 10px; /* Space to the right of labels */
            font-weight: bold; /* Bold labels */
        }

        input, select {
            flex: 2; /* Input fields take more space */
            padding: 10px; /* Padding for inputs */
            border: 1px solid #ccc; /* Light grey border */
            border-radius: 5px; /* Rounded corners */
            font-size: 1rem; /* Font size */
        }

        button {
            background-color: #333; /* Black Background */
            color: white; /* White text */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            padding: 10px 20px; /* Padding for button */
            cursor: pointer; /* Pointer cursor */
            font-size: 1rem; /* Font size */
        }

        button:hover {
            background-color: #555; /* Darker shade on hover */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            h2 {
                font-size: 2rem;
            }
            .form-group {
                flex-direction: column; /* Stack elements on small screens */
            }
            label {
                margin-right: 0; /* Remove right margin */
                margin-bottom: 5px; /* Add bottom margin */
            }
        }
    </style>
</head>
<body>

    <a class="back-btn" href="/manager">Back to Dashboard</a>

    <h2>Edit Employee</h2>

    <div class="form-container">
        <form action="/edit" method="post">
            <input type="hidden" name="id" value="${employee.id}">

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="name" value="${employee.name}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" value="${employee.email}" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" value="${employee.password}" required>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" name="city" value="${employee.city}" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select name="role" required>
                    <option value="ADMIN" ${employee.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
                    <option value="MANAGER" ${employee.role == 'MANAGER' ? 'selected' : ''}>Manager</option>
                    <option value="EMPLOYEE" ${employee.role == 'EMPLOYEE' ? 'selected' : ''}>Employee</option>
                </select>
            </div>
            <div class="form-group">
                <label for="position">Position:</label>
                <input type="text" name="position" value="${employee.position}" required>
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <input type="text" name="department" value="${employee.department}" required>
            </div>
            <div class="form-group">
                <label for="salary">Salary:</label>
                <input type="number" name="salary" value="${employee.salary}" required>
            </div>

            <button type="submit">Update</button>
        </form>
    </div>

</body>
</html>
