<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pahana Edu Bookshop</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 400px;
            overflow: hidden;
        }

        .login-header {
            background-color: #2c3e50;
            color: white;
            padding: 25px;
            text-align: center;
        }

        .login-header h1 {
            font-size: 1.8rem;
            margin-bottom: 5px;
        }

        .login-header p {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        .login-form {
            padding: 25px;
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
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }

        .btn-login {
            width: 100%;
            background-color: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #2980b9;
        }

        .login-footer {
            text-align: center;
            padding: 20px;
            border-top: 1px solid #eee;
            font-size: 0.9rem;
            color: #7f8c8d;
        }

        .login-footer a {
            color: #3498db;
            text-decoration: none;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }

        .alert {
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        .alert-error {
            background-color: #ffebee;
            color: #c62828;
            border: 1px solid #ef9a9a;
        }

        .alert-success {
            background-color: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
        }

        .back-to-home {
            text-align: center;
            margin-top: 20px;
        }

        .back-to-home a {
            color: white;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .back-to-home a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <h1>Pahana Edu Bookshop</h1>
        <p>Complete Bookshop Management System</p>
    </div>

    <div class="login-form">
        <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="alert alert-error">
            <%= request.getAttribute("errorMessage") %>
        </div>
        <% } %>

        <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success">
            <%= request.getParameter("success") %>
        </div>
        <% } %>

        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required autofocus>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit" class="btn-login">Sign In</button>
        </form>
    </div>

</div>

<div class="back-to-home">
    <a href="index.jsp">← Back to Home</a>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const loginForm = document.getElementById('loginForm');
        const errorMessage = document.getElementById('errorMessage');
        const errorText = document.getElementById('errorText');
        const successMessage = document.getElementById('successMessage');
        const successText = document.getElementById('successText');
        const loginButton = document.getElementById('loginButton');
        const buttonText = document.getElementById('buttonText');
        const loadingIndicator = document.getElementById('loadingIndicator');

        // Check if there's a success message in URL parameters (for redirects)
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('success')) {
            successText.textContent = urlParams.get('success');
            successMessage.classList.remove('hidden');
        }

        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // Get form values
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();

            // Basic validation
            if (!username || !password) {
                showError('Please enter both username and password');
                return;
            }

            // Hide previous messages
            errorMessage.classList.add('hidden');
            successMessage.classList.add('hidden');

            // Show loading state
            buttonText.textContent = 'Signing In...';
            loadingIndicator.classList.remove('hidden');
            loginButton.disabled = true;

            // Create AJAX request
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'login', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    // Reset button state
                    buttonText.textContent = 'Sign In';
                    loadingIndicator.classList.add('hidden');
                    loginButton.disabled = false;

                    if (xhr.status === 200) {
                        // Success - redirect to dashboard
                        window.location.href = 'dashboard.jsp';
                    } else {
                        // Handle error response
                        try {
                            // Try to parse the response as HTML to extract error message
                            const parser = new DOMParser();
                            const htmlDoc = parser.parseFromString(xhr.responseText, 'text/html');
                            const errorDiv = htmlDoc.querySelector('.alert-error');

                            if (errorDiv) {
                                showError(errorDiv.textContent.trim());
                            } else {
                                showError('Invalid username or password');
                            }
                        } catch (e) {
                            showError('Invalid username or password');
                        }
                    }
                }
            };

            xhr.onerror = function() {
                // Network error
                buttonText.textContent = 'Sign In';
                loadingIndicator.classList.add('hidden');
                loginButton.disabled = false;
                showError('Network error. Please try again.');
            };

            // Send the request
            xhr.send(`username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`);
        });

        function showError(message) {
            errorText.textContent = message;
            errorMessage.classList.remove('hidden');

            // Scroll to error message
            errorMessage.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    });
</script>
</body>
</html>