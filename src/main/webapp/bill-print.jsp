<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Print Bill - Pahana Edu Bookshop</title>
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
      background-color: white;
      padding: 20px;
    }

    @media print {
      body {
        padding: 0;
      }

      .no-print {
        display: none !important;
      }
    }

    .invoice-container {
      max-width: 800px;
      margin: 0 auto;
      padding: 30px;
      border: 1px solid #ddd;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
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

    .print-actions {
      text-align: center;
      margin: 20px 0;
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
      margin: 0 5px;
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

    @media (max-width: 768px) {
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
<div class="print-actions no-print">
  <button onclick="window.print()" class="btn btn-primary">Print Invoice</button>
  <a href="bill?action=view&billId=${bill.billId}" class="btn btn-secondary">Back to View</a>
  <a href="bill?action=list" class="btn btn-secondary">Back to Bills</a>
</div>

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
      <p><strong>Status:</strong> ${bill.paymentStatus}</p>
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

<script>
  window.onload = function() {
    // Auto-print if requested
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('autoprint') === 'true') {
      window.print();
    }
  };
</script>
</body>
</html>