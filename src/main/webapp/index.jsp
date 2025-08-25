<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu Bookshop</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            flex: 1;
        }

        header {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #2c3e50;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        nav a {
            color: #2c3e50;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #f8f9fa;
        }

        .hero {
            text-align: center;
            padding: 100px 20px;
            color: white;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero p {
            font-size: 1.3rem;
            max-width: 700px;
            margin: 0 auto 30px;
        }

        .btn {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: bold;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            padding: 80px 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            margin-top: 50px;
        }

        .feature-card {
            text-align: center;
            padding: 30px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #3498db;
        }

        .feature-card h3 {
            margin-bottom: 15px;
            color: #2c3e50;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="header-content">
        <div class="logo">Pahana Edu Bookshop</div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<div class="container">
    <section class="hero">
        <h1>Complete Bookshop Management System</h1>
        <p>Streamline your bookshop operations with our comprehensive management solution. Handle billing, inventory, customers, and reports all in one place.</p>
        <a href="login.jsp" class="btn">Get Started</a>
    </section>

    <section class="features" id="features">
        <div class="feature-card">
            <div class="feature-icon">📊</div>
            <h3>Billing & Invoicing</h3>
            <p>Create professional bills and invoices quickly with our intuitive billing system.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">👥</div>
            <h3>Customer Management</h3>
            <p>Manage customer accounts, track purchase history, and maintain customer records.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">📦</div>
            <h3>Inventory Control</h3>
            <p>Track inventory levels, manage stock, and receive low stock alerts automatically.</p>
        </div>

        <div class="feature-card">
            <div class="feature-icon">📈</div>
            <h3>Reports & Analytics</h3>
            <p>Generate detailed sales reports, customer summaries, and inventory analytics.</p>
        </div>
    </section>
</div>

<footer id="contact">
    <p>&copy; 2023 Pahana Edu Bookshop. All rights reserved.</p>
    <p>Colombo, Sri Lanka | Phone: +94 11 234 5678 | Email: info@pahanaedu.lk</p>
</footer>
</body>
</html>