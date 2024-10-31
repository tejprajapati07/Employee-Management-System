<%@ page import="java.util.List, com.example.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filter Employees</title>

    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- Custom Styles -->
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container for form */
        .container {
            width: 100%;
            max-width: 600px;
        }

        /* Back Button Styling */
        .back-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #333;
        }

        /* Form Container */
        .form-container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        /* Title Styling */
        h2 {
            text-align: center;
            font-size: 2rem;
            color: black; /* Changed to black */
            margin-bottom: 30px;
        }

        /* Label Styling */
        label {
            display: block;
            font-size: 1rem;
            margin-bottom: 10px;
            color: #555;
        }

        /* Select and Input Fields */
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            color: #333;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: black; /* Changed to black */
            outline: none;
        }

        /* Button Styling */
        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: black; /* Changed to black */
            border: none;
            color: #fff;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #333; /* Darker black */
        }

        /* Toggle Field Containers */
        #salaryFields, #idFields {
            display: none;
        }

        /* Info Text Styling */
        p {
            font-size: 0.9rem;
            color: #666;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }

            h2 {
                font-size: 1.5rem;
            }

            .back-btn {
                font-size: 0.9rem;
                padding: 8px 16px;
            }
        }
    </style>

    <!-- Toggle Fields Script -->
    <script>
        function toggleFields() {
            const filterBy = document.getElementById("filterBy").value;
            const salaryFields = document.getElementById("salaryFields");
            const idFields = document.getElementById("idFields");
            const valueField = document.getElementById("valueField");

            if (filterBy === "salary") {
                salaryFields.style.display = "block";
                idFields.style.display = "none";
                valueField.style.display = "none";
            } else if (filterBy === "employeeId") {
                idFields.style.display = "block";
                salaryFields.style.display = "none";
                valueField.style.display = "none";
            } else {
                salaryFields.style.display = "none";
                idFields.style.display = "none";
                valueField.style.display = "block";
            }
        }
    </script>
</head>
<body>

    <!-- Back to Admin Dashboard Button at the top right corner -->
    <a href="/manager" class="back-btn">Back to Dashboard</a>

    <div class="container">
        <div class="form-container">
            <h2>Filter Employees</h2>

            <form action="/filter" method="post">
                <!-- Filter By Selection -->
                <label for="filterBy">Filter By:</label>
                <select name="filterBy" id="filterBy" onchange="toggleFields()" required>
                    <option value="department">Department</option>
                    <option value="position">Position</option>
                    <option value="city">City</option>
                    <option value="email">Email</option>
                    <option value="name">Name</option>
                    <option value="salary">Salary</option>
                    <option value="employeeId">Employee ID</option>
                    <option value="role">Role</option> <!-- New option for role filter -->
                </select>

                <!-- General value field for non-salary and non-employeeId filters -->
                <div id="valueField">
                    <label for="value">Enter Value (for Department, Position, City, Email, Name, or Role):</label>
                    <input type="text" name="value" placeholder="Enter Value">
                </div>

                <!-- Salary fields for salary filter -->
                <div id="salaryFields">
                    <label for="minSalary">Min Salary:</label>
                    <input type="number" name="minSalary" step="0.01" placeholder="Enter Minimum Salary">

                    <label for="maxSalary">Max Salary:</label>
                    <input type="number" name="maxSalary" step="0.01" placeholder="Enter Maximum Salary">

                    <p>Note: Provide both for range, or only enter Min Salary for a specific salary.</p>
                </div>

                <!-- Employee ID fields for Employee ID filter -->
                <div id="idFields">
                    <label for="minId">Min Employee ID (for specific value, only fill this):</label>
                    <input type="text" name="minId" placeholder="Enter Employee ID">

                    <label for="maxId">Max Employee ID (leave blank for specific value):</label>
                    <input type="text" name="maxId" placeholder="Enter Maximum Employee ID (optional)">
                </div>

                <!-- Submit Button -->
                <button type="submit">Filter</button>
            </form>
        </div>
    </div>

</body>
</html>
