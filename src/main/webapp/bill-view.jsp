<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Bill - Pahana Edu Bookshop</title>
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
      max-width: 1000px;
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

    .invoice-container {
      background: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      margin: 20px 0;
    }

    .invoice-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 30px;
      padding-bottom: 20px;
      border-bottom: 2px solid #eee;
    }

    .company-info {
      flex: 1;
    }

    .company-info h2 {
      color: #2c3e50;
      margin-bottom: 10px;
    }

    .invoice-details {
      text-align: right;
    }

    .invoice-details h1 {
      color: #2c3e50;
      margin-bottom: 10px;
    }

    .invoice-meta {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
      margin-bottom: 30px;
    }

    .bill-to, .payment-info {
      padding: 15px;
      background-color: #f8f9fa;
      border-radius: 5px;
    }

    .bill-to h3, .payment-info h3 {
      margin-bottom: 10px;
      color: #2c3e50;
    }

    .items-table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }

    .items-table th,
    .items-table td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .items-table th {
      background-color: #f8f9fa;
      font-weight: bold;
      color: #2c3e50;
    }

    .items-table tfoot td {
      font-weight: bold;
      border-top: 2px solid #ddd;
    }

    .text-right {
      text-align: right;
    }

    .invoice-notes {
      margin-top: 30px;
      padding: 15px;
      background-color: #f8f9fa;
      border-radius: 5px;
    }

    .invoice-notes h3 {
      margin-bottom: 10px;
      color: #2c3e50;
    }

    .invoice-footer {
      margin-top: 30px;
      text-align: center;
      color: #7f8c8d;
      font-size: 0.9rem;
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

      .page-header {
        flex-direction: column;
        align-items: flex-start;
      }

      .invoice-header {
        flex-direction: column;
        gap: 20px;
      }

      .invoice-details {
        text-align: left;
      }

      .invoice-meta {
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
  <div class="page-header">
    <h1 class="page-title">Invoice Details</h1>
    <div class="action-bar">
      <a href="bill?action=print&billId=${bill.billId}" class="btn btn-primary" target="_blank">Print Invoice</a>
      <a href="bill?action=downloadTxt&billId=${bill.billId}" class="btn btn-secondary">Download as TXT</a>
      <a href="bill?action=list" class="btn btn-secondary">Back to Bills</a>
    </div>
  </div>

  <c:if test="${not empty errorMessage}">
    <div class="alert alert-error">${errorMessage}</div>
  </c:if>

  <c:if test="${not empty successMessage}">
    <div class="alert alert-success">${successMessage}</div>
  </c:if>

  <div class="invoice-container">
    <div class="invoice-header">
      <div class="company-info">
        <h2>Pahana Edu Bookshop</h2>
        <p>123 Education Street, Colombo 05</p>
        <p>Sri Lanka</p>
        <p>Phone: +94 11 234 5678</p>
        <p>Email: info@pahanaedu.lk</p>
      </div>

      <div class="invoice-details">
        <h1>INVOICE</h1>
        <p><strong>Bill Number:</strong> ${bill.billNumber}</p>
        <p><strong>Date:</strong> ${bill.billDate}</p>
      </div>
    </div>

    <div class="invoice-meta">
      <div class="bill-to">
        <h3>Bill To:</h3>
        <p><strong>${bill.customerName}</strong></p>
        <p>Account: ${bill.customerAccountNumber}</p>
      </div>

      <div class="payment-info">
        <h3>Payment Information:</h3>
        <p><strong>Status:</strong> <span class="status-${bill.paymentStatus.toLowerCase()}">${bill.paymentStatus}</span></p>
        <p><strong>Method:</strong> ${bill.paymentMethod}</p>
      </div>
    </div>

    <table class="items-table">
      <thead>
      <tr>
        <th>Item</th>
        <th class="text-right">Quantity</th>
        <th class="text-right">Unit Price (Rs.)</th>
        <th class="text-right">Total (Rs.)</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="item" items="${bill.billItems}">
        <tr>
          <td>${item.itemName}</td>
          <td class="text-right">${item.quantity}</td>
          <td class="text-right">${item.unitPrice}</td>
          <td class="text-right">${item.lineTotal}</td>
        </tr>
      </c:forEach>
      </tbody>
      <tfoot>
      <tr>
        <td colspan="3" class="text-right">Subtotal:</td>
        <td class="text-right">${bill.subtotal}</td>
      </tr>
      <c:if test="${bill.discountPercentage > 0}">
        <tr>
          <td colspan="3" class="text-right">Discount (${bill.discountPercentage}%):</td>
          <td class="text-right">-${bill.discountAmount}</td>
        </tr>
      </c:if>
      <tr>
        <td colspan="3" class="text-right"><strong>Final Amount:</strong></td>
        <td class="text-right"><strong>${bill.finalAmount}</strong></td>
      </tr>
      </tfoot>
    </table>

    <c:if test="${not empty bill.notes}">
      <div class="invoice-notes">
        <h3>Notes:</h3>
        <p>${bill.notes}</p>
      </div>
    </c:if>

    <div class="invoice-footer">
      <p>Thank you for your business!</p>
      <p>Generated on ${bill.billDate} by ${bill.createdByName}</p>
    </div>
  </div>
</div>

<footer>
  <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>
</body>
</html>