<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

        /* Login Form Container */
        .login-container {
            background: #fff; /* White background for contrast */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            font-size: 2.5rem;
            margin-bottom: 30px;
        }

        /* Form Label and Input Styling */
        label {
            font-size: 1.1rem;
            color: #333;
            display: block;
            text-align: left;
            margin-bottom: 8px;
        }

        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #f9f9f9;
            font-size: 1rem;
            color: #333;
        }

        input[type="email"]:focus, input[type="password"]:focus {
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

        /* Register Option Styling */
        .register-option {
            margin-top: 20px;
            color: #333;
            font-size: 1rem;
        }

        .register-option a {
            color: #fc466b;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .register-option a:hover {
            color: #3f5efb;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h2 {
                font-size: 2rem;
            }

            .login-container {
                padding: 30px;
            }

            button {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <!-- Back to Home Button -->
    <a href="/" class="home-button">Back to Home</a>

    <div class="login-container">
        <h2>Login</h2>
        <form action="/login" method="post">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
            <button type="submit">Login</button>
        </form>

        <!-- Register Option -->
        <div class="register-option">
            Don't have an account? <a href="/register">Register here</a>
        </div>
    </div>

</body>
</html>
