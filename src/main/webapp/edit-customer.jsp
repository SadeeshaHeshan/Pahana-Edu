<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Customer - Pahana Edu Bookshop</title>
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

    .customer-form {
      background: white;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      margin: 20px 0;
    }

    .customer-form h3 {
      margin-bottom: 20px;
      color: #2c3e50;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #2c3e50;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
    }

    .form-group textarea {
      resize: vertical;
      min-height: 80px;
    }

    .form-group .readonly-field {
      background-color: #f8f9fa;
      color: #6c757d;
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
    <h1 class="page-title">Edit Customer</h1>
    <div class="action-bar">
      <a href="customer" class="btn btn-secondary">Back to Customers</a>
    </div>
  </div>

  <c:if test="${not empty errorMessage}">
    <div class="alert alert-error">${errorMessage}</div>
  </c:if>

  <c:if test="${not empty successMessage}">
    <div class="alert alert-success">${successMessage}</div>
  </c:if>

  <div class="customer-form">
    <form action="customer" method="post">
      <input type="hidden" name="action" value="update">
      <input type="hidden" name="customerId" value="${customer.customerId}">

      <div class="form-group">
        <label for="accountNumber">Account Number</label>
        <input type="text" id="accountNumber" class="readonly-field" value="${customer.accountNumber}" disabled>
        <small>Account number cannot be changed</small>
      </div>

      <div class="form-group">
        <label for="customerName">Customer Name *</label>
        <input type="text" name="customerName" id="customerName" value="${customer.customerName}" required>
      </div>

      <div class="form-group">
        <label for="address">Address</label>
        <textarea name="address" id="address" rows="3">${customer.address}</textarea>
      </div>

      <div class="form-group">
        <label for="phoneNumber">Phone Number</label>
        <input type="tel" name="phoneNumber" id="phoneNumber" value="${customer.phoneNumber}">
      </div>

      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" value="${customer.email}">
      </div>

      <button type="submit" class="btn btn-primary">Update Customer</button>
      <a href="customer" class="btn btn-secondary">Cancel</a>
    </form>
  </div>
</div>

<footer>
  <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>
</body>
</html>