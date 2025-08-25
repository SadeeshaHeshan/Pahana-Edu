<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Items - Pahana Edu Bookshop</title>
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
      flex-wrap: wrap;
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

    .search-filters {
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      margin: 20px 0;
      display: flex;
      gap: 15px;
      flex-wrap: wrap;
      align-items: end;
    }

    .search-form {
      display: flex;
      gap: 10px;
      flex: 1;
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
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
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

    .modal-form .form-group {
      margin-bottom: 20px;
    }

    .modal-form .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #2c3e50;
    }

    .modal-form .form-group input,
    .modal-form .form-group select,
    .modal-form .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
    }

    .modal-form .form-group textarea {
      resize: vertical;
      min-height: 80px;
    }

    .items-table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
      background-color: white;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
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

    .items-table tr:hover {
      background-color: #f8f9fa;
    }

    .items-table tr.low-stock {
      background-color: #fff3cd;
    }

    .items-table tr.out-of-stock {
      background-color: #f8d7da;
    }

    .action-cells {
      display: flex;
      gap: 5px;
      flex-wrap: wrap;
    }

    .stock-form {
      display: flex;
      gap: 5px;
      align-items: center;
    }

    .stock-form input {
      width: 70px;
      padding: 5px;
      border: 1px solid #ddd;
      border-radius: 4px;
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

    .no-items {
      text-align: center;
      padding: 40px;
      color: #7f8c8d;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
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

      .search-filters {
        flex-direction: column;
      }

      .search-form {
        flex-direction: column;
      }

      .items-table {
        display: block;
        overflow-x: auto;
      }

      .action-cells {
        flex-direction: column;
      }

      .stock-form {
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
    <h1 class="page-title">Inventory Management</h1>
    <div class="action-bar">
      <button onclick="document.getElementById('add-item-form').style.display='block'"
              class="btn btn-primary">Add New Item</button>
    </div>
  </div>

  <c:if test="${not empty errorMessage}">
    <div class="alert alert-error">${errorMessage}</div>
  </c:if>

  <c:if test="${not empty successMessage}">
    <div class="alert alert-success">${successMessage}</div>
  </c:if>

  <div class="search-filters">
    <form class="search-form" action="item" method="get">
      <input type="hidden" name="action" value="search">

      <div class="form-group">
        <label for="searchTerm">Search Items</label>
        <input type="text" id="searchTerm" name="searchTerm" placeholder="Item name..." value="${param.searchTerm}">
      </div>

      <div class="form-group">
        <button type="submit" class="btn btn-primary">Search</button>
      </div>
    </form>

    <form action="item" method="get">
      <input type="hidden" name="action" value="category">

      <div class="form-group">
        <label for="category">Filter by Category</label>
        <select id="category" name="category" onchange="this.form.submit()">
          <option value="">All Categories</option>
          <option value="Books" ${param.category eq 'Books' ? 'selected' : ''}>Books</option>
          <option value="Stationery" ${param.category eq 'Stationery' ? 'selected' : ''}>Stationery</option>
          <option value="Educational" ${param.category eq 'Educational' ? 'selected' : ''}>Educational</option>
          <option value="Others" ${param.category eq 'Others' ? 'selected' : ''}>Others</option>
        </select>
      </div>
    </form>

    <a href="item" class="btn btn-secondary">Clear Filters</a>
  </div>

  <div id="add-item-form" class="modal-form">
    <h3>Add New Item</h3>
    <form action="item?action=add" method="post">
      <div class="form-group">
        <label for="itemName">Item Name *</label>
        <input type="text" name="itemName" id="itemName" required>
      </div>

      <div class="form-group">
        <label for="description">Description</label>
        <textarea name="description" id="description" rows="3"></textarea>
      </div>

      <div class="form-group">
        <label for="price">Price (Rs.) *</label>
        <input type="number" name="price" id="price" min="0" step="0.01" required>
      </div>

      <div class="form-group">
        <label for="stockQuantity">Initial Stock *</label>
        <input type="number" name="stockQuantity" id="stockQuantity" min="0" required>
      </div>

      <div class="form-group">
        <label for="category">Category</label>
        <select name="category" id="category">
          <option value="">Select Category</option>
          <option value="Books">Books</option>
          <option value="Stationery">Stationery</option>
          <option value="Educational">Educational</option>
          <option value="Others">Others</option>
        </select>
      </div>

      <button type="submit" class="btn btn-primary">Add Item</button>
      <button type="button" onclick="document.getElementById('add-item-form').style.display='none'"
              class="btn btn-secondary">Cancel</button>
    </form>
  </div>

  <c:choose>
    <c:when test="${editMode and not empty item}">
      <div class="modal-form" style="display: block;">
        <h3>Edit Item</h3>
        <form action="item?action=update" method="post">
          <input type="hidden" name="itemId" value="${item.itemId}">

          <div class="form-group">
            <label for="editItemName">Item Name *</label>
            <input type="text" name="itemName" id="editItemName" value="${item.itemName}" required>
          </div>

          <div class="form-group">
            <label for="editDescription">Description</label>
            <textarea name="description" id="editDescription" rows="3">${item.description}</textarea>
          </div>

          <div class="form-group">
            <label for="editPrice">Price (Rs.) *</label>
            <input type="number" name="price" id="editPrice" value="${item.price}" min="0" step="0.01" required>
          </div>

          <div class="form-group">
            <label for="editStockQuantity">Stock Quantity *</label>
            <input type="number" name="stockQuantity" id="editStockQuantity" value="${item.stockQuantity}" min="0" required>
          </div>

          <div class="form-group">
            <label for="editCategory">Category</label>
            <select name="category" id="editCategory">
              <option value="">Select Category</option>
              <option value="Books" ${item.category eq 'Books' ? 'selected' : ''}>Books</option>
              <option value="Stationery" ${item.category eq 'Stationery' ? 'selected' : ''}>Stationery</option>
              <option value="Educational" ${item.category eq 'Educational' ? 'selected' : ''}>Educational</option>
              <option value="Others" ${item.category eq 'Others' ? 'selected' : ''}>Others</option>
            </select>
          </div>

          <button type="submit" class="btn btn-primary">Update Item</button>
          <a href="item" class="btn btn-secondary">Cancel</a>
        </form>
      </div>
    </c:when>
  </c:choose>

  <c:choose>
    <c:when test="${not empty items}">
      <table class="items-table">
        <thead>
        <tr>
          <th>Name</th>
          <th>Category</th>
          <th>Price (Rs.)</th>
          <th>Stock</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
          <tr class="${item.lowStock ? 'low-stock' : ''} ${item.outOfStock ? 'out-of-stock' : ''}">
            <td>${item.itemName}</td>
            <td>${item.category}</td>
            <td>${item.price}</td>
            <td>${item.stockQuantity}</td>
            <td>
              <span class="status-${item.stockStatus.toLowerCase()}">${item.stockStatus}</span>
            </td>
            <td>
              <div class="action-cells">
                <a href="item?action=edit&itemId=${item.itemId}" class="btn btn-primary btn-small">Edit</a>
                <form action="item?action=updateStock" method="post" class="stock-form">
                  <input type="hidden" name="itemId" value="${item.itemId}">
                  <input type="number" name="stockQuantity" value="${item.stockQuantity}" min="0" required>
                  <button type="submit" class="btn btn-secondary btn-small">Update Stock</button>
                </form>
                <form action="item?action=delete" method="post" style="display:inline;">
                  <input type="hidden" name="itemId" value="${item.itemId}">
                  <button type="submit" class="btn btn-danger btn-small"
                          onclick="return confirm('Are you sure you want to delete this item?')">Delete</button>
                </form>
              </div>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:when>
    <c:otherwise>
      <div class="no-items">
        <h3>No items found</h3>
        <p>Get started by adding your first inventory item</p>
        <button onclick="document.getElementById('add-item-form').style.display='block'"
                class="btn btn-primary">Add New Item</button>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<footer>
  <p>&copy; 2023 Pahana Edu Bookshop Management System</p>
</footer>

<script>
  // Close modal when clicking outside
  window.onclick = function(event) {
    if (event.target == document.getElementById('add-item-form')) {
      document.getElementById('add-item-form').style.display = 'none';
    }
  }
</script>
</body>
</html>