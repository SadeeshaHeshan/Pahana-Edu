<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Pahana Edu Bookshop</title>
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
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #34495e;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn-logout {
            background-color: #e74c3c;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-logout:hover {
            background-color: #c0392b;
        }

        .dashboard-header {
            margin: 30px 0;
            text-align: center;
        }

        .dashboard-header h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .welcome-message {
            color: #7f8c8d;
            font-size: 1.1rem;
        }

        .dashboard-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }

        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }

        .stat-card h3 {
            color: #7f8c8d;
            margin-bottom: 10px;
            font-size: 0.9rem;
        }

        .stat-number {
            font-size: 2.2rem;
            font-weight: bold;
            color: #2c3e50;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }

        .action-card {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            transition: all 0.3s;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .action-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: #3498db;
        }

        .action-card h3 {
            margin-bottom: 15px;
            color: #2c3e50;
        }

        .action-card p {
            color: #7f8c8d;
            margin-bottom: 20px;
            font-size: 0.9rem;
        }

        .btn-action {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-action:hover {
            background-color: #2980b9;
        }

        .recent-activity {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin: 40px 0;
        }

        .recent-activity h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .activity-list {
            list-style: none;
        }

        .activity-item {
            padding: 15px 0;
            border-bottom: 1px solid #f8f9fa;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #e3f2fd;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #3498db;
            font-weight: bold;
        }

        .activity-content {
            flex: 1;
        }

        .activity-content p {
            margin-bottom: 5px;
        }

        .activity-time {
            color: #7f8c8d;
            font-size: 0.8rem;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #7f8c8d;
            margin-top: 40px;
            border-top: 1px solid #eee;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }

            nav ul {
                flex-wrap: wrap;
                justify-content: center;
            }

            .dashboard-stats,
            .quick-actions {
                grid-template-columns: 1fr;
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
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="bill">Billing</a></li>
                <li><a href="customer">Customers</a></li>
                <li><a href="item">Inventory</a></li>
                <li><a href="reports">Reports</a></li>
            </ul>
        </nav>
        <div class="user-info">
            <span>Welcome, <%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "User" %></span>
            <span>(<%= session.getAttribute("userRole") != null ? session.getAttribute("userRole") : "Role" %>)</span>
            <form action="login" method="post" style="display:inline;">
                <input type="hidden" name="action" value="logout">
                <button type="submit" class="btn-logout">Logout</button>
            </form>
        </div>
    </div>
</header>

<div class="container">
    <div class="dashboard-header">
        <h1>Dashboard</h1>
        <p class="welcome-message">Welcome to Pahana Edu Bookshop Management System</p>
    </div>

    <c:if test="{not empty errorMessage}">
        <div class="alert alert-error">{errorMessage}</div>
    </c:if>

    <c:if test="{not empty successMessage}">
        <div class="alert alert-success">{successMessage}</div>
    </c:if>

    <div class="dashboard-stats">
        <div class="stat-card">
            <div class="stat-icon">📊</div>
            <h3>TODAY'S SALES</h3>
            <p class="stat-number">Rs. 12,540.00</p>
        </div>

        <div class="stat-card">
            <div class="stat-icon">🧾</div>
            <h3>TODAY'S BILLS</h3>
            <p class="stat-number">18</p>
        </div>

        <div class="stat-card">
            <div class="stat-icon">👥</div>
            <h3>TOTAL CUSTOMERS</h3>
            <p class="stat-number">245</p>
        </div>

        <div class="stat-card">
            <div class="stat-icon">📦</div>
            <h3>LOW STOCK ITEMS</h3>
            <p class="stat-number">7</p>
        </div>
    </div>

    <div class="quick-actions">
        <div class="action-card">
            <div class="action-icon">🧾</div>
            <h3>Create Bill</h3>
            <p>Generate a new invoice for customer purchase</p>
            <a href="bill?action=new" class="btn-action">New Bill</a>
        </div>

        <div class="action-card">
            <div class="action-icon">👥</div>
            <h3>Manage Customers</h3>
            <p>Add, edit or view customer information</p>
            <a href="customer" class="btn-action">Customers</a>
        </div>

        <div class="action-card">
            <div class="action-icon"></div>
            <h3>Inventory</h3>
            <p>Manage product inventory and stock levels</p>
            <a href="item" class="btn-action">Inventory</a>
        </div>

        <div class="action-card">
            <div class="action-icon"></div>
            <h3>Reports</h3>
            <p>View sales reports and analytics</p>
            <a href="reports" class="btn-action">Reports</a>
        </div>
    </div>

    <div class="recent-activity">
        <h2>Recent Activity</h2>
        <ul class="activity-list">
            <li class="activity-item">
                <div class="activity-icon">💰</div>
                <div class="activity-content">
                    <p>New bill created #INV-2023-1087 for Samantha Perera</p>
                    <span class="activity-time">10 minutes ago</span>
                </div>
            </li>

            <li class="activity-item">
                <div class="activity-icon">👤</div>
                <div class="activity-content">
                    <p>New customer registered: Nimal Fernando</p>
                    <span class="activity-time">45 minutes ago</span>
                </div>
            </li>

            <li class="activity-item">
                <div class="activity-icon"></div>
                <div class="activity-content">
                    <p>Stock updated for "Advanced Mathematics Textbook"</p>
                    <span class="activity-time">2 hours ago</span>
                </div>
            </li>

            <li class="activity-item">
                <div class="activity-icon"></div>
                <div class="activity-content">
                    <p>Daily sales report generated</p>
                    <span class="activity-time">5 hours ago</span>
                </div>
            </li>
        </ul>
    </div>
</div>

<footer>
    <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>
</body>
</html>