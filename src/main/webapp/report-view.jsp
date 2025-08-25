<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${reportTitle} - Pahana Edu Bookshop</title>
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

        .report-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin: 20px 0;
        }

        .report-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #eee;
        }

        .report-header h2 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .report-meta {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .report-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }

        .summary-card h3 {
            color: #7f8c8d;
            margin-bottom: 10px;
            font-size: 0.9rem;
        }

        .summary-value {
            font-size: 1.8rem;
            font-weight: bold;
            color: #2c3e50;
        }

        .report-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .report-table th,
        .report-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .report-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #2c3e50;
        }

        .report-table tr:hover {
            background-color: #f8f9fa;
        }

        .text-right {
            text-align: right;
        }

        .text-center {
            text-align: center;
        }

        .low-stock {
            background-color: #fff3cd;
        }

        .out-of-stock {
            background-color: #f8d7da;
        }

        .status-in-stock {
            color: #27ae60;
            font-weight: bold;
        }

        .status-low-stock {
            color: #f39c12;
            font-weight: bold;
        }

        .status-out-of-stock {
            color: #e74c3c;
            font-weight: bold;
        }

        .date-range-info {
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #e3f2fd;
            border-radius: 5px;
            color: #0d47a1;
        }

        .no-data {
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
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

            .report-summary {
                grid-template-columns: 1fr;
            }

            .report-table {
                display: block;
                overflow-x: auto;
            }
        }

        @media print {
            header, .action-bar, footer {
                display: none;
            }

            .container {
                padding: 0;
            }

            .report-container {
                box-shadow: none;
                border: none;
                padding: 0;
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
        <h1 class="page-title">${reportTitle}</h1>
        <div class="action-bar">
            <button onclick="window.print()" class="btn btn-primary">Print Report</button>
            <a href="reports" class="btn btn-secondary">Back to Reports</a>
        </div>
    </div>

    <div class="report-container">
        <div class="report-header">
            <h2>${reportTitle}</h2>
            <p class="report-meta">Generated on <%= new java.util.Date() %> by <%= session.getAttribute("userName") != null ? session.getAttribute("userName") : "System" %></p>

            <c:if test="${not empty startDate and not empty endDate}">
                <div class="date-range-info">
                    <strong>Date Range:</strong> ${startDate} to ${endDate}
                </div>
            </c:if>
        </div>

        <c:choose>
            <c:when test="${reportType == 'daily-sales'}">
                <div class="report-summary">
                    <c:set var="totalSales" value="0" />
                    <c:set var="totalBills" value="0" />
                    <c:forEach var="entry" items="${dailySales}">
                        <c:set var="totalSales" value="${totalSales + entry.value.totalSales}" />
                        <c:set var="totalBills" value="${totalBills + entry.value.billCount}" />
                    </c:forEach>

                    <div class="summary-card">
                        <h3>Total Sales Period</h3>
                        <p class="summary-value">Rs. ${totalSales}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Total Bills</h3>
                        <p class="summary-value">${totalBills}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Average Daily Sales</h3>
                        <p class="summary-value">Rs. ${totalSales / dailySales.size()}</p>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${not empty dailySales}">
                        <table class="report-table">
                            <thead>
                            <tr>
                                <th>Date</th>
                                <th class="text-right">Number of Bills</th>
                                <th class="text-right">Total Sales (Rs.)</th>
                                <th class="text-right">Average per Bill</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="entry" items="${dailySales}">
                                <tr>
                                    <td>${entry.key}</td>
                                    <td class="text-right">${entry.value.billCount}</td>
                                    <td class="text-right">${entry.value.totalSales}</td>
                                    <td class="text-right">${entry.value.totalSales / entry.value.billCount}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">
                            <h3>No sales data available</h3>
                            <p>No sales records found for the selected period</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:when test="${reportType == 'customer-summary'}">
                <div class="report-summary">
                    <c:set var="totalCustomers" value="0" />
                    <c:set var="totalRevenue" value="0" />
                    <c:forEach var="summary" items="${customerSummaries}">
                        <c:set var="totalCustomers" value="${totalCustomers + 1}" />
                        <c:set var="totalRevenue" value="${totalRevenue + summary.totalSpent}" />
                    </c:forEach>

                    <div class="summary-card">
                        <h3>Total Customers</h3>
                        <p class="summary-value">${totalCustomers}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Total Revenue</h3>
                        <p class="summary-value">Rs. ${totalRevenue}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Average per Customer</h3>
                        <p class="summary-value">Rs. ${totalRevenue / totalCustomers}</p>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${not empty customerSummaries}">
                        <table class="report-table">
                            <thead>
                            <tr>
                                <th>Customer</th>
                                <th>Account Number</th>
                                <th class="text-right">Total Bills</th>
                                <th class="text-right">Total Spent (Rs.)</th>
                                <th class="text-center">Last Purchase</th>
                                <th class="text-right">Average per Bill</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="summary" items="${customerSummaries}">
                                <tr>
                                    <td>${summary.customer.customerName}</td>
                                    <td>${summary.customer.accountNumber}</td>
                                    <td class="text-right">${summary.totalBills}</td>
                                    <td class="text-right">${summary.totalSpent}</td>
                                    <td class="text-center">${summary.lastPurchaseDate}</td>
                                    <td class="text-right">${summary.totalBills > 0 ? summary.totalSpent / summary.totalBills : 0}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">
                            <h3>No customer data available</h3>
                            <p>No customer records found</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:when test="${reportType == 'inventory'}">
                <div class="report-summary">
                    <c:set var="totalItems" value="0" />
                    <c:set var="totalValue" value="0" />
                    <c:set var="lowStockCount" value="0" />
                    <c:forEach var="item" items="${items}">
                        <c:set var="totalItems" value="${totalItems + 1}" />
                        <c:set var="totalValue" value="${totalValue + item.totalValue}" />
                        <c:if test="${item.lowStock or item.outOfStock}">
                            <c:set var="lowStockCount" value="${lowStockCount + 1}" />
                        </c:if>
                    </c:forEach>

                    <div class="summary-card">
                        <h3>Total Items</h3>
                        <p class="summary-value">${totalItems}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Total Inventory Value</h3>
                        <p class="summary-value">Rs. ${totalValue}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Low Stock Items</h3>
                        <p class="summary-value">${lowStockCount}</p>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${not empty items}">
                        <table class="report-table">
                            <thead>
                            <tr>
                                <th>Item Name</th>
                                <th>Category</th>
                                <th class="text-right">Stock Quantity</th>
                                <th class="text-right">Price (Rs.)</th>
                                <th class="text-right">Total Value (Rs.)</th>
                                <th class="text-center">Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${items}">
                                <tr class="${item.lowStock ? 'low-stock' : ''} ${item.outOfStock ? 'out-of-stock' : ''}">
                                    <td>${item.itemName}</td>
                                    <td>${item.category}</td>
                                    <td class="text-right">${item.stockQuantity}</td>
                                    <td class="text-right">${item.price}</td>
                                    <td class="text-right">${item.totalValue}</td>
                                    <td class="text-center">
                                        <span class="status-${item.stockStatus.toLowerCase()}">${item.stockStatus}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">
                            <h3>No inventory data available</h3>
                            <p>No inventory records found</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:when test="${reportType == 'low-stock'}">
                <div class="report-summary">
                    <c:set var="lowStockCount" value="0" />
                    <c:set var="outOfStockCount" value="0" />
                    <c:forEach var="item" items="${lowStockItems}">
                        <c:if test="${item.lowStock}">
                            <c:set var="lowStockCount" value="${lowStockCount + 1}" />
                        </c:if>
                        <c:if test="${item.outOfStock}">
                            <c:set var="outOfStockCount" value="${outOfStockCount + 1}" />
                        </c:if>
                    </c:forEach>

                    <div class="summary-card">
                        <h3>Total Low Stock Items</h3>
                        <p class="summary-value">${lowStockCount}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Out of Stock Items</h3>
                        <p class="summary-value">${outOfStockCount}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Total Items Needing Attention</h3>
                        <p class="summary-value">${lowStockItems.size()}</p>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${not empty lowStockItems}">
                        <table class="report-table">
                            <thead>
                            <tr>
                                <th>Item Name</th>
                                <th>Category</th>
                                <th class="text-right">Current Stock</th>
                                <th class="text-right">Price (Rs.)</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Urgency</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${lowStockItems}">
                                <tr class="${item.lowStock ? 'low-stock' : ''} ${item.outOfStock ? 'out-of-stock' : ''}">
                                    <td>${item.itemName}</td>
                                    <td>${item.category}</td>
                                    <td class="text-right">${item.stockQuantity}</td>
                                    <td class="text-right">${item.price}</td>
                                    <td class="text-center">
                                        <span class="status-${item.stockStatus.toLowerCase()}">${item.stockStatus}</span>
                                    </td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${item.outOfStock}">
                                                <strong style="color: #e74c3c;">CRITICAL</strong>
                                            </c:when>
                                            <c:when test="${item.lowStock}">
                                                <strong style="color: #f39c12;">HIGH</strong>
                                            </c:when>
                                            <c:otherwise>
                                                <span style="color: #27ae60;">NORMAL</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">
                            <h3>No low stock items</h3>
                            <p>All inventory items are sufficiently stocked</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:when test="${reportType == 'date-range'}">
                <div class="report-summary">
                    <div class="summary-card">
                        <h3>Date Range</h3>
                        <p class="summary-value">${startDate} to ${endDate}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Total Sales</h3>
                        <p class="summary-value">Rs. ${totalSales}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Total Bills</h3>
                        <p class="summary-value">${totalBills}</p>
                    </div>

                    <div class="summary-card">
                        <h3>Average per Bill</h3>
                        <p class="summary-value">Rs. ${totalBills > 0 ? totalSales / totalBills : 0}</p>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${not empty filteredBills}">
                        <table class="report-table">
                            <thead>
                            <tr>
                                <th>Bill #</th>
                                <th>Date</th>
                                <th>Customer</th>
                                <th class="text-right">Amount (Rs.)</th>
                                <th class="text-center">Payment Status</th>
                                <th class="text-center">Payment Method</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="bill" items="${filteredBills}">
                                <tr>
                                    <td>${bill.billNumber}</td>
                                    <td>${bill.billDate}</td>
                                    <td>${bill.customerName}</td>
                                    <td class="text-right">${bill.finalAmount}</td>
                                    <td class="text-center">
                                        <span class="status-${bill.paymentStatus.toLowerCase()}">${bill.paymentStatus}</span>
                                    </td>
                                    <td class="text-center">${bill.paymentMethod}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="no-data">
                            <h3>No sales data available</h3>
                            <p>No sales records found for the selected date range</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:otherwise>
                <div class="no-data">
                    <h3>Report Type Not Specified</h3>
                    <p>Please select a valid report type from the reports page</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<footer>
    <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>
</body>
</html>