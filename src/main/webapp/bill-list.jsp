<%@ page contentType="text/html;charset=UTF-8" language="java" %>
DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill List - Pahana Edu Bookshop</title>
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

        .btn-small {
            padding: 5px 10px;
            font-size: 0.8rem;
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

        .filters {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin: 20px 0;
        }

        .filter-form {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            align-items: end;
        }

        .form-group {
            margin-bottom: 0;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .bills-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: white;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .bills-table th,
        .bills-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .bills-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #2c3e50;
        }

        .bills-table tr:hover {
            background-color: #f8f9fa;
        }

        .action-cells {
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
        }

        .status-paid {
            color: #27ae60;
            font-weight: bold;
        }

        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }

        .no-bills {
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin: 30px 0;
            gap: 10px;
        }

        .pagination a,
        .pagination span {
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: #3498db;
        }

        .pagination a:hover {
            background-color: #f8f9fa;
        }

        .pagination .current {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
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

            .filter-form {
                grid-template-columns: 1fr;
            }

            .bills-table {
                display: block;
                overflow-x: auto;
            }

            .action-cells {
                flex-direction: column;
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
        <h1 class="page-title">All Bills</h1>
        <div class="action-bar">
            <a href="bill?action=new" class="btn btn-primary">Create New Bill</a>
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>

    <div class="filters">
        <form class="filter-form" action="bill" method="get">
            <input type="hidden" name="action" value="list">

            <div class="form-group">
                <label for="search">Search</label>
                <input type="text" id="search" name="search" placeholder="Bill number or customer">
            </div>

            <div class="form-group">
                <label for="status">Payment Status</label>
                <select id="status" name="status">
                    <option value="">All Status</option>
                    <option value="Paid">Paid</option>
                    <option value="Pending">Pending</option>
                </select>
            </div>

            <div class="form-group">
                <label for="fromDate">From Date</label>
                <input type="date" id="fromDate" name="fromDate">
            </div>

            <div class="form-group">
                <label for="toDate">To Date</label>
                <input type="date" id="toDate" name="toDate">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Apply Filters</button>
            </div>
        </form>
    </div>

    <c:choose>
        <c:when test="${not empty bills}">
            <table class="bills-table">
                <thead>
                <tr>
                    <th>Bill #</th>
                    <th>Date</th>
                    <th>Customer</th>
                    <th>Amount (Rs.)</th>
                    <th>Status</th>
                    <th>Payment Method</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="bill" items="${bills}">
                    <tr>
                        <td>${bill.billNumber}</td>
                        <td>${bill.billDate}</td>
                        <td>${bill.customerName}</td>
                        <td>${bill.finalAmount}</td>
                        <td>
                            <span class="status-${bill.paymentStatus.toLowerCase()}">${bill.paymentStatus}</span>
                        </td>
                        <td>${bill.paymentMethod}</td>
                        <td>
                            <div class="action-cells">
                                <a href="bill?action=view&billId=${bill.billId}"
                                   class="btn btn-primary btn-small">View</a>
                                <a href="bill?action=print&billId=${bill.billId}"
                                   class="btn btn-secondary btn-small" target="_blank">Print</a>
                                <a href="bill?action=downloadTxt&billId=${bill.billId}"
                                   class="btn btn-secondary btn-small">Download</a>
                                <c:if test="${user.admin}">
                                    <form action="bill?action=delete" method="post" style="display:inline;">
                                        <input type="hidden" name="billId" value="${bill.billId}">
                                        <button type="submit" class="btn btn-danger btn-small"
                                                onclick="return confirm('Are you sure you want to delete this bill?')">Delete</button>
                                    </form>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="bill?action=list&page=${currentPage - 1}">Previous</a>
                </c:if>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="bill?action=list&page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <a href="bill?action=list&page=${currentPage + 1}">Next</a>
                </c:if>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-bills">
                <h3>No bills found</h3>
                <p>Get started by creating your first bill</p>
                <a href="bill?action=new" class="btn btn-primary">Create New Bill</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<footer>
    <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>
</body>
</html>