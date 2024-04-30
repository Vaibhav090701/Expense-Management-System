<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link href="css/basic.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- You can include additional CSS files here if needed -->
    <style>
        /* Custom styles */
        .card {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<!-- navbar -->
<%@include file="navbar_afterLogin.jsp" %>


<main class="primary-background p-5">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
        <div class="card">
            <div class="card-header primary-background text-center text-white">
                <h1>Contact Us</h1>
                <p>Please fill out the form below to reach out to us via email.</p>
            </div>
        
            <!-- Contact form -->
            <form action="SendEmailServlet" method="post">
                <div class="card-body">
                    <div class="form-group">
                        <label for="name">Your Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Your Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>
                </div>
                <div class="card-footer text-center">
                    <button type="submit" class="btn btn-primary">Send Message</button>
                </div>
            </form>
            
        </div>
        </div>
    </div>
</div>
</main>
</body>
</html>
