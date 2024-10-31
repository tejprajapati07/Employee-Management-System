<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #D3D3D3; /* Changed to grey */
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        /* Header Styling */
        h2 {
            font-size: 3rem;
            font-weight: bold;
            letter-spacing: 1.5px;
            margin-top: 30px;
            margin-bottom: 50px;
            text-align: center;
            color: #000; /* Changed to black */
        }

        /* Card Layout */
        .card-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            max-width: 1000px;
            width: 100%;
        }

        /* Individual Card Styling */
        .card {
            background: #fff;
            color: #333;
            padding: 40px;
            width: 100%;
            max-width: 350px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        /* Card Hover Effect */
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }

        /* Icon in the card */
        .card i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #3f5efb;
        }

        /* Card Title */
        .card h3 {
            font-size: 1.8rem;
            margin-bottom: 15px;
            color: #333;
        }

        /* Card Description */
        .card p {
            font-size: 1rem;
            color: #666;
            margin-bottom: 30px;
        }

        /* Button in the card */
        .card a {
            text-decoration: none;
            color: #fff;
            font-size: 1.1rem;
            padding: 12px 30px;
            border-radius: 25px;
            background: linear-gradient(45deg, #fc466b, #3f5efb);
            display: inline-block;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        /* Button Hover Effect */
        .card a:hover {
            background: linear-gradient(45deg, #3f5efb, #fc466b);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h2 {
                font-size: 2.5rem;
            }

            .card-container {
                flex-direction: column;
                gap: 20px;
                align-items: center;
            }

            .card {
                max-width: 100%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <h2>Employee Management System</h2>

    <div class="card-container">
        <!-- Login Card -->
        <div class="card">
            <i class="fas fa-sign-in-alt"></i>
            <h3>Login</h3>
            <p>Access your account to manage employee records.</p>
            <a href="/login">Login</a>
        </div>

        <!-- Register Card -->
        <div class="card">
            <i class="fas fa-user-plus"></i>
            <h3>Register</h3>
            <p>Create a new account to join the employee system.</p>
            <a href="/register">Register</a>
        </div>
    </div>
</body>
</html>
