<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reports - Pahana Edu Bookshop</title>
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

    .page-header {
      margin: 30px 0;
    }

    .page-title {
      color: #2c3e50;
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

    .report-options {
      margin: 40px 0;
    }

    .report-options h2 {
      color: #2c3e50;
      margin-bottom: 20px;
    }

    .report-cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
    }

    .report-card {
      background: white;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      text-align: center;
      transition: all 0.3s;
    }

    .report-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .report-icon {
      font-size: 3rem;
      margin-bottom: 15px;
      color: #3498db;
    }

    .report-card h3 {
      margin-bottom: 15px;
      color: #2c3e50;
    }

    .report-card p {
      color: #7f8c8d;
      margin-bottom: 20px;
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

    .modal-form {
      background: white;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.2);
      margin: 20px 0;
      display: none;
    }

    .modal-form h3 {
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

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
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

    .activity-table {
      width: 100%;
      border-collapse: collapse;
    }

    .activity-table th,
    .activity-table td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .activity-table th {
      background-color: #f8f9fa;
      font-weight: bold;
      color: #2c3e50;
    }

    .activity-table tr:hover {
      background-color: #f8f9fa;
    }

    .status-paid {
      color: #27ae60;
      font-weight: bold;
    }

    .status-pending {
      color: #f39c12;
      font-weight: bold;
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
      .report-cards {
        grid-template-columns: 1fr;
      }

      .activity-table {
        display: block;
        overflow-x: auto;
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
    <h1 class="page-title">Reports & Analytics</h1>
  </div>

  <c:if test="${not empty errorMessage}">
    <div class="alert alert-error">${errorMessage}</div>
  </c:if>

  <c:if test="${not empty successMessage}">
    <div class="alert alert-success">${successMessage}</div>
  </c:if>

  <div class="dashboard-stats">
    <div class="stat-card">
      <div class="stat-icon">📊</div>
      <h3>TODAY'S SALES</h3>
      <p class="stat-number">Rs. ${stats.todaySales}</p>
    </div>

    <div class="stat-card">
      <div class="stat-icon">🧾</div>
      <h3>TODAY'S BILLS</h3>
      <p class="stat-number">${stats.todayBills}</p>
    </div>

    <div class="stat-card">
      <div class="stat-icon">👥</div>
      <h3>TOTAL CUSTOMERS</h3>
      <p class="stat-number">${stats.totalCustomers}</p>
    </div>

    <div class="stat-card">
      <div class="stat-icon">📦</div>
      <h3>TOTAL ITEMS</h3>
      <p class="stat-number">${stats.totalItems}</p>
    </div>

    <div class="stat-card">
      <div class="stat-icon">⚠️</div>
      <h3>LOW STOCK ITEMS</h3>
      <p class="stat-number">${stats.lowStockItems}</p>
    </div>

    <div class="stat-card">
      <div class="stat-icon">💰</div>
      <h3>INVENTORY VALUE</h3>
      <p class="stat-number">Rs. ${stats.totalInventoryValue}</p>
    </div>
  </div>

  <div class="report-options">
    <h2>Generate Reports</h2>
    <div class="report-cards">
      <div class="report-card">
        <div class="report-icon">📅</div>
        <h3>Daily Sales Report</h3>
        <p>View sales by day with totals and trends</p>
        <a href="reports?type=daily-sales" class="btn btn-primary">Generate Report</a>
      </div>

      <div class="report-card">
        <div class="report-icon">👥</div>
        <h3>Customer Summary</h3>
        <p>Customer purchase history and spending analysis</p>
        <a href="reports?type=customer-summary" class="btn btn-primary">Generate Report</a>
      </div>

      <div class="report-card">
        <div class="report-icon">📦</div>
        <h3>Inventory Report</h3>
        <p>Complete inventory listing with stock values</p>
        <a href="reports?type=inventory" class="btn btn-primary">Generate Report</a>
      </div>

      <div class="report-card">
        <div class="report-icon">⚠️</div>
        <h3>Low Stock Alert</h3>
        <p>Items that need immediate restocking</p>
        <a href="reports?type=low-stock" class="btn btn-primary">Generate Report</a>
      </div>

      <div class="report-card">
        <div class="report-icon">📆</div>
        <h3>Custom Date Range</h3>
        <p>Sales report for specific date ranges</p>
        <button onclick="document.getElementById('date-range-form').style.display='block'"
                class="btn btn-primary">Select Dates</button>
      </div>

      <div class="report-card">
        <div class="report-icon">📥</div>
        <h3>Export Reports</h3>
        <p>Download reports in TXT format</p>
        <div>
          <a href="reports?type=download&reportType=daily-sales" class="btn btn-primary">Daily Sales</a>
          <a href="reports?type=download&reportType=inventory" class="btn btn-primary">Inventory</a>
          <a href="reports?type=download&reportType=low-stock" class="btn btn-primary">Low Stock</a>
        </div>
      </div>
    </div>
  </div>

  <div id="date-range-form" class="modal-form">
    <h3>Custom Date Range Report</h3>
    <form action="reports" method="post">
      <input type="hidden" name="action" value="custom-date-range">

      <div class="form-group">
        <label for="startDate">Start Date</label>
        <input type="date" name="startDate" id="startDate" required>
      </div>

      <div class="form-group">
        <label for="endDate">End Date</label>
        <input type="date" name="endDate" id="endDate" required>
      </div>

      <button type="submit" class="btn btn-primary">Generate Report</button>
      <button type="button" onclick="document.getElementById('date-range-form').style.display='none'"
              class="btn btn-secondary">Cancel</button>
    </form>
  </div>

  <div class="recent-activity">
    <h2>Recent Bills</h2>
    <table class="activity-table">
      <thead>
      <tr>
        <th>Bill #</th>
        <th>Customer</th>
        <th>Date</th>
        <th>Amount (Rs.)</th>
        <th>Status</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="bill" items="${recentBills}">
        <tr>
          <td>${bill.billNumber}</td>
          <td>${bill.customerName}</td>
          <td>${bill.billDate}</td>
          <td>${bill.finalAmount}</td>
          <td>
            <span class="status-${bill.paymentStatus.toLowerCase()}">${bill.paymentStatus}</span>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<footer>
  <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>

<script>
  // Close modal when clicking outside
  window.onclick = function(event) {
    if (event.target == document.getElementById('date-range-form')) {
      document.getElementById('date-range-form').style.display = 'none';
    }
  }

  // Set default date values to current month
  document.addEventListener('DOMContentLoaded', function() {
    const today = new Date();
    const firstDay = new Date(today.getFullYear(), today.getMonth(), 1);
    const lastDay = new Date(today.getFullYear(), today.getMonth() + 1, 0);

    document.getElementById('startDate').value = formatDate(firstDay);
    document.getElementById('endDate').value = formatDate(lastDay);
  });

  function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }
</script>
</body>
</html>