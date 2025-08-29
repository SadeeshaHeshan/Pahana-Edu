<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Customer - Pahana Edu Bookshop</title>
    <style>
        /* Your existing CSS styles */
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
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 30px 0;
            flex-wrap: wrap;
            gap: 15px;
        }

        .page-title {
            color: #2c3e50;
        }

        .action-bar {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-primary {
            background-color: #3498db;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2980b9;
        }

        .btn-secondary {
            background-color: #95a5a6;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #7f8c8d;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .alert {
            padding: 15px;
            margin: 20px 0;
            border-radius: 4px;
            border: 1px solid transparent;
        }

        .alert-error {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }

        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .confirmation-box {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            margin: 20px 0;
            text-align: center;
        }

        .confirmation-box h3 {
            margin-bottom: 20px;
            color: #e74c3c;
        }

        .customer-details {
            text-align: left;
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin: 20px 0;
        }

        .customer-details p {
            margin: 8px 0;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #7f8c8d;
            margin-top: 40px;
            border-top: 1px solid #eee;
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
    <div class="page-header">
        <h1 class="page-title">Delete Customer</h1>
        <div class="action-bar">
            <a href="customer" class="btn btn-secondary">Back to Customers</a>
        </div>
    </div>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <div class="confirmation-box">
        <h3>Confirm Customer Deletion</h3>
        <p>Are you sure you want to delete the following customer? This action cannot be undone.</p>

        <div class="customer-details">
            <p><strong>Account Number:</strong> ${customer.accountNumber}</p>
            <p><strong>Name:</strong> ${customer.customerName}</p>
            <p><strong>Phone:</strong> ${customer.phoneNumber}</p>
            <p><strong>Email:</strong> ${customer.email}</p>
        </div>

        <form action="customer" method="post">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="customerId" value="${customer.customerId}">

            <button type="submit" class="btn btn-danger">Yes, Delete Customer</button>
            <a href="customer" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

<footer>
    <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>
</body>
</html>