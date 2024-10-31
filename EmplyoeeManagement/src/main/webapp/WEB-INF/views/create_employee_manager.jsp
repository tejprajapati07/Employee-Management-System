<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Employee</title>
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
            justify-content: flex-start;
            height: 100vh;
            padding: 20px; /* Add some padding */
            text-align: center;
        }

        /* Dashboard Button */
        .dashboard-btn {
            align-self: flex-end; /* Align to the right */
            margin-bottom: 20px; /* Space below the button */
            padding: 10px 15px; /* Padding */
            background-color: #007bff; /* Bootstrap Primary Color */
            color: white; /* White text */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor */
            font-size: 1rem; /* Font size */
            text-decoration: none; /* Remove underline */
        }

        .dashboard-btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }

        h2 {
            margin-bottom: 30px;
            font-size: 2.5rem;
            color: #444;
            text-transform: uppercase; /* Make the heading uppercase */
        }

        /* Form Styling */
        form {
            background: #ffffff; /* White Background */
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Softer shadow */
            padding: 30px;
            width: 100%;
            max-width: 600px; /* Set max width */
            display: flex;
            flex-direction: column; /* Arrange items in a column */
            gap: 15px; /* Space between inputs */
        }

        /* Flexbox for fields */
        .form-group {
            display: flex;
            justify-content: space-between; /* Space between fields */
            gap: 15px; /* Space between the two fields */
        }

        label {
            display: flex;
            align-items: center; /* Align label and icon */
            font-size: 1.2rem; /* Larger font for labels */
            flex: 1; /* Allow label to take available space */
        }

        input, select {
            padding: 10px; /* Padding for input fields */
            border: 1px solid #ccc; /* Border for input fields */
            border-radius: 5px; /* Rounded corners */
            width: 100%; /* Full width */
            font-size: 1rem; /* Font size for inputs */
            flex: 1; /* Allow input to take available space */
        }

        button {
            background-color: #007bff; /* Bootstrap Primary Color */
            color: white; /* White text */
            padding: 10px;
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor */
            font-size: 1.2rem; /* Font size for button */
            transition: background-color 0.3s; /* Smooth transition */
        }

        button:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            h2 {
                font-size: 2rem;
            }
            button {
                font-size: 1rem; /* Adjust button font size */
            }
            input, select {
                font-size: 0.9rem; /* Adjust input font size */
            }
        }
    </style>
</head>
<body>

    <a class="dashboard-btn" href="/manager">Back to Dashboard</a>
    
    <h2>Create New Employee</h2>
    <form action="/create" method="post">
        <div class="form-group">
            <label for="name"><i class="fas fa-user"></i> Name:</label>
            <input type="text" name="name" required>
        </div>
        <div class="form-group">
            <label for="email"><i class="fas fa-envelope"></i> Email:</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password"><i class="fas fa-lock"></i> Password:</label>
            <input type="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="city"><i class="fas fa-map-marker-alt"></i> City:</label>
            <input type="text" name="city" required>
        </div>
        <div class="form-group">
            <label for="role"><i class="fas fa-user-tag"></i> Role:</label>
            <select name="role" required>
                <option value="EMPLOYEE">Employee</option>
            </select>
        </div>
        <div class="form-group">
            <label for="position"><i class="fas fa-briefcase"></i> Position:</label>
            <input type="text" name="position" required>
        </div>
        <div class="form-group">
            <label for="department"><i class="fas fa-building"></i> Department:</label>
            <input type="text" name="department" required>
        </div>
        <div class="form-group">
            <label for="salary"><i class="fas fa-dollar-sign"></i> Salary:</label>
            <input type="number" name="salary" required>
        </div>

        <button type="submit">Create</button>
    </form>

</body>
</html>