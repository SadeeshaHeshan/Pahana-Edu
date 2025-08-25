<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers - Pahana Edu Bookshop</title>
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

        .modal-form {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
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

        .customer-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: white;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .customer-table th,
        .customer-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .customer-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #2c3e50;
        }

        .customer-table tr:hover {
            background-color: #f8f9fa;
        }

        .action-cells {
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
        }

        .no-customers {
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
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

            .customer-table {
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
        <h1 class="page-title">Customer Management</h1>
        <div class="action-bar">
            <button onclick=""
                    class="btn btn-primary">Add New Customer
            </button>
        </div>
    </div>

    <c:if test="not empty errorMessage">
        <div class="alert alert-error">{errorMessage}</div>
    </c:if>

    <c:if test="not empty successMessage">
        <div class="alert alert-success">{successMessage}</div>
    </c:if>

    <div id="add-customer-form" class="modal-form">
        <h3>Add New Customer</h3>
        <form action="customer" method="post">
            <div class="form-group">
                <label for="customerName">Customer Name *</label>
                <input type="text" name="customerName" id="customerName" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <textarea name="address" id="address" rows="3"></textarea>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number</label>
                <input type="tel" name="phoneNumber" id="phoneNumber">
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email">
            </div>

            <button type="submit" class="btn btn-primary" onclick="addCustomer()" n>Add Customer</button>
            <button type="button" onclick="document.getElementById('add-customer-form').style.display='none'"
                    class="btn btn-secondary">Cancel
            </button>
        </form>
    </div>

    <c:choose>
        <c:when test="editMode and not empty customer">
            <div class="modal-form" style="display: block;">
                <h3>Edit Customer</h3>
                <form action="customer?action=update" method="post">
                    <input type="hidden" name="customerId">

                    <div class="form-group">
                        <label for="accountNumber">Account Number</label>
                        <input type="text" id="accountNumber" disabled>
                        <small>Account number cannot be changed</small>
                    </div>

                    <div class="form-group">
                        <label for="editCustomerName">Customer Name *</label>
                        <input type="text" name="customerName" id="editCustomerName" required>
                    </div>

                    <div class="form-group">
                        <label for="editAddress">Address</label>
                        <textarea name="address" id="editAddress"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="editPhoneNumber">Phone Number</label>
                        <input type="tel" name="phoneNumber" id="editPhoneNumber">
                    </div>

                    <div class="form-group">
                        <label for="editEmail">Email</label>
                        <input type="email" name="email" id="editEmail">
                    </div>

                    <button type="submit" class="btn btn-primary">Update Customer</button>
                    <a href="customer" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="not empty customers">
            <table class="customer-table">
                <thead>
                <tr>
                    <th>Account #</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="customers">
                    <tr>
                        <td>customer.accountNumber</td>
                        <td>customer.customerName</td>
                        <td>customer.phoneNumber</td>
                        <td>customer.email</td>
                        <td>
                            <div class="action-cells">
                                <a href="customer?action=view&accountNumber={customer.accountNumber}"
                                   class="btn btn-primary btn-small">View</a>
                                <a href="customer?action=edit&accountNumber={customer.accountNumber}"
                                   class="btn btn-secondary btn-small">Edit</a>
                                <c:if test="{user.admin}">
                                    <form action="customer?action=delete" method="post" style="display:inline;">
                                        <input type="hidden" name="customerId" value="customer.customerId">
                                        <button type="submit" class="btn btn-danger btn-small"
                                                onclick="return confirm('Are you sure you want to delete this customer?')">
                                            Delete
                                        </button>
                                    </form>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="no-customers">
                <h3>No customers found</h3>
                <p>Get started by adding your first customer</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<footer>
    <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>

<script>


    // Function to add customer via AJAX
    function addCustomer() {
        const customerName = document.getElementById('customerName').value;
        const address = document.getElementById('address').value;
        const phoneNumber = document.getElementById('phoneNumber').value;
        const email = document.getElementById('email').value;

        if (!customerName) {
            showNotification('Customer name is required', 'error');
            return;
        }

        // Create customer data object
        const customerData = {
            customerName: customerName,
            address: address,
            phoneNumber: phoneNumber,
            email: email
        };

        // Simulate AJAX call to backend
        simulateAjaxCall('customer', 'POST', customerData)
            .then(response => {
                // Create new customer object with generated ID
                const newCustomer = {
                    customerId: customers.length + 1,
                    accountNumber: 'ACC' + String(customers.length + 1).padStart(4, '0'),
                    customerName: customerName,
                    phoneNumber: phoneNumber,
                    email: email,
                    address: address
                };

                // Add to our local data
                customers.push(newCustomer);

                // Update the UI
                renderCustomers();

                // Reset form and hide it
                document.getElementById('customerName').value = '';
                document.getElementById('address').value = '';
                document.getElementById('phoneNumber').value = '';
                document.getElementById('email').value = '';
                addCustomerForm.style.display = 'none';

                // Show success message
                showNotification('Customer added successfully!', 'success');
                showSuccessMessage('Customer added successfully!');
            })
            .catch(error => {
                showNotification('Error adding customer: ' + error, 'error');
                showErrorMessage('Error adding customer: ' + error);
            });
    }

</script>
</body>
</html>