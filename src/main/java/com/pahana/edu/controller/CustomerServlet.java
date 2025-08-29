// File: src/main/java/com/pahanaedu/controllers/CustomerServlet.java
package com.pahana.edu.controller;

import com.pahana.edu.dao.CustomerDAO;
import com.pahana.edu.model.Customer;
import com.pahana.edu.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {

    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        customerDAO = new CustomerDAO();
    }

    // Handle GET request - Show customer management page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.

        if ("view".equals(action)) {
            // View specific customer
            String accountNumber = request.getParameter("accountNumber");
            Customer customer = customerDAO.getCustomerByAccountNumber(accountNumber);
            request.setAttribute("customer", customer);
            request.getRequestDispatcher("customer-view.jsp").forward(request, response);

        } else if ("edit".equals(action)) {
            // Edit customer form
            String accountNumber = request.getParameter("accountNumber");
            Customer customer = customerDAO.getCustomerByAccountNumber(accountNumber);
            request.setAttribute("customer", customer);
            request.setAttribute("editMode", true);
            request.getRequestDispatcher("customers.jsp").forward(request, response);

        } else {
            // Default - Show all customers
            List<Customer> customers = customerDAO.getAllCustomers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("customers.jsp").forward(request, response);
        }
    }

    // Handle POST request - Process customer operations
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is logged in
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addCustomer(request, response);
        } else if ("update".equals(action)) {
            updateCustomer(request, response);
        }
        else if ("delete".equals(action)) {
            deleteCustomer(request, response, user);
        }
        else {
            // Default redirect
            response.sendRedirect("customer");
        }
    }

    // Add new customer
    private void addCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");

        // Basic validation
        if (customerName == null || customerName.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Customer name is required");
            List<Customer> customers = customerDAO.getAllCustomers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("customers.jsp").forward(request, response);
            return;
        }

        // Validate phone number (simple validation)
        if (phoneNumber != null && !phoneNumber.trim().isEmpty()) {
            if (!phoneNumber.matches("^[0-9+\\-\\s]+$")) {
                request.setAttribute("errorMessage", "Invalid phone number format");
                List<Customer> customers = customerDAO.getAllCustomers();
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("customers.jsp").forward(request, response);
                return;
            }
        }

        // Generate account number
        String accountNumber = customerDAO.generateAccountNumber();

        // Create customer object
        Customer customer = new Customer();
        customer.setAccountNumber(accountNumber);
        customer.setCustomerName(customerName.trim());
        customer.setAddress(address != null ? address.trim() : "");
        customer.setPhoneNumber(phoneNumber != null ? phoneNumber.trim() : "");
        customer.setEmail(email != null ? email.trim() : "");

        // Save to database
        boolean success = customerDAO.addCustomer(customer);

        if (success) {
            request.setAttribute("successMessage", "Customer added successfully! Account Number: " + accountNumber);
        } else {
            request.setAttribute("errorMessage", "Failed to add customer. Please try again.");
        }

        // Reload customer list and forward to page
        List<Customer> customers = customerDAO.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("customers.jsp").forward(request, response);
    }

    // Update existing customer
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String customerIdStr = request.getParameter("customerId");
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");

        // Validate customer ID
        if (customerIdStr == null || customerIdStr.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Invalid customer ID");
            response.sendRedirect("customer");
            return;
        }

        int customerId;
        try {
            customerId = Integer.parseInt(customerIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid customer ID format");
            response.sendRedirect("customer");
            return;
        }

        // Basic validation
        if (customerName == null || customerName.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Customer name is required");
            Customer customer = customerDAO.getCustomerById(customerId);
            request.setAttribute("customer", customer);
            request.setAttribute("editMode", true);
            request.getRequestDispatcher("customers.jsp").forward(request, response);
            return;
        }

        // Create customer object
        Customer customer = new Customer();
        customer.setCustomerId(customerId);
        customer.setCustomerName(customerName.trim());
        customer.setAddress(address != null ? address.trim() : "");
        customer.setPhoneNumber(phoneNumber != null ? phoneNumber.trim() : "");
        customer.setEmail(email != null ? email.trim() : "");

        // Update in database
        boolean success = customerDAO.updateCustomer(customer);

        if (success) {
            request.setAttribute("successMessage", "Customer updated successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to update customer. Please try again.");
        }

        // Redirect to customer list
        response.sendRedirect("customer");
    }
    // Add this new method to CustomerServlet class
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        // Check if user has permission to delete (Admin only)
        if (!user.isAdmin()) {
            request.setAttribute("errorMessage", "Access denied. Only Admin can delete customers.");
            List<Customer> customers = customerDAO.getAllCustomers();
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("customers.jsp").forward(request, response);
            return;
        }

        String customerIdStr = request.getParameter("customerId");

        try {
            int customerId = Integer.parseInt(customerIdStr);

            // Check if customer has bills
            if (customerDAO.customerHasBills(customerId)) {
                request.setAttribute("errorMessage",
                        "Cannot delete customer. Customer has existing bills in the system.");
            } else {
                // Safe to delete
                boolean success = customerDAO.deleteCustomer(customerId);

                if (success) {
                    request.setAttribute("successMessage", "Customer deleted successfully!");
                } else {
                    request.setAttribute("errorMessage", "Failed to delete customer. Please try again.");
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid customer ID.");
        }
        response.sendRedirect("customer");
    }

    }