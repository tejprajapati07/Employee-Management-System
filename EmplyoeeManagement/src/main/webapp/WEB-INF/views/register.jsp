<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Employee</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body and Background Styling */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0; /* Light Grey Background */
            color: #333;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            position: relative;
        }

        /* Back to Home Button */
        .home-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background: transparent;
            border: 2px solid #333;
            padding: 10px 20px;
            border-radius: 25px;
            color: #333;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .home-button:hover {
            background: rgba(51, 51, 51, 0.1);
        }

        /* Register Form Container */
        .register-container {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 30px;
        }

        /* Flexbox for Form Fields */
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .form-row div {
            flex: 1; /* Equal space for all elements */
            margin-right: 10px;
        }

        .form-row div:last-child {
            margin-right: 0; /* Remove right margin for last element */
        }

        /* Form Label and Input Styling */
        label {
            font-size: 1.1rem;
            color: #333;
            display: block;
            text-align: left;
            margin-bottom: 8px;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="number"], select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #f9f9f9;
            font-size: 1rem;
            color: #333;
        }

        input:focus, select:focus {
            outline: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Submit Button Styling */
        button {
            width: 100%;
            padding: 12px;
            background: #333;
            border: none;
            border-radius: 25px;
            font-size: 1.2rem;
            color: #fff;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        button:hover {
            background: #555;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h2 {
                font-size: 2rem;
            }

            .register-container {
                padding: 30px;
            }

            button {
                font-size: 1rem;
            }

            .form-row {
                flex-direction: column; /* Stack fields on smaller screens */
            }

            .form-row div {
                margin-right: 0; /* Remove right margin */
                margin-bottom: 10px; /* Add bottom margin */
            }

            .form-row div:last-child {
                margin-bottom: 0; /* Remove margin for last element */
            }
        }
    </style>
</head>
<body>

    <!-- Back to Home Button -->
    <a href="/" class="home-button">Back to Home</a>

    <div class="register-container">
        <h2>Register Employee</h2>
        <form action="/register" method="post">

            <div class="form-row">
                <div>
                    <label for="name">Name:</label>
                    <input type="text" name="name" id="name" required>
                </div>
                <div>
                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" required>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" required>
                </div>
                <div>
                    <label for="city">City:</label>
                    <input type="text" name="city" id="city" required>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label for="role">Role:</label>
                    <select name="role" id="role" required>
                        <option value="ADMIN">Admin</option>
                        <option value="MANAGER">Manager</option>
                        <option value="EMPLOYEE">Employee</option>
                    </select>
                </div>
                <div>
                    <label for="position">Position:</label>
                    <input type="text" name="position" id="position" required>
                </div>
            </div>

            <div class="form-row">
                <div>
                    <label for="department">Department:</label>
                    <input type="text" name="department" id="department" required>
                </div>
                <div>
                    <label for="salary">Salary:</label>
                    <input type="number" name="salary" id="salary" required>
                </div>
            </div>

            <button type="submit">Register</button>
        </form>
    </div>

</body>
</html>
