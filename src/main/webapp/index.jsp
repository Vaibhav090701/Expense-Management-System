<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body class="primary-background">

<!-- navbar -->
<%@ include file="navbar.jsp" %>

<div class="container-fluid p-0 m-0">

<div class="jumbotron primary-background text-white"> 	

<div class="container">

<h3 class="display-3">Welcome to Expenso</h3>
<p>Expenso is a way to manage and grow your money. 
Here you maintain all your transactions in a systematic manner. It's a way to know how much you spend and on which things you spend the most.
</p>

<p>
If you want to try this application just start now. Click on Start now button and enter to our family. Thank you...
</p>

<a href="register_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-bell-o"></span> Start ! its Free</a>
<a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
</div>
</div>
</div>
<hr>

<div  class="jumbotron secondary-background d-flex m-0">

<img alt="" src="https://hrone.cloud/wp-content/uploads/2021/05/expense-guide-1.png">

<div class="p-3 ml-5">
<h1 class="display-3 font-weight-bold text-danger">Level up Your</h1>
<h1 class="display-3 font-weight-bold text-primary">Expense Management</h1>
</div>

</div>

<hr>

<footer class=" jumbotron primary-background footer-section">
    <div class="container text-white">
      <div class="row">
        <div class="col-md-6">
            <h2>Expense Manager</h2>
          <p class="footer-msg">Expenses Manager: A leading finance management app designed to empower users with secure, intuitive, and comprehensive tools for tracking expenses and budgeting. With Expenses Manager, take control of your financial life while ensuring your data remains secure and private.</p>
        </div>
        <div class="col-md-6">
          <p>Contact us</p>
          <p>For queries and support, contact us at- <a href="mailto:randadvaibhav@gmail.com.in" class="text-white">randadvaibhav@gmail.com</a></p>
          <p>Follow us!</p>
          <div class="display-4 mt-10">
            <a href="#" class="secondary-background px-3 rounded-circle"><span class="fa fa-facebook"></span></a>
            <a href="#" class="secondary-background px-3 rounded-circle"><span class="fa fa-instagram"></span></a>
            <a href="#" class="secondary-background px-3 rounded-circle"><span class="fa fa-twitter"></span></a>
          </div>
        </div>

      </div>
    </div>
    <br>
    <br>
    <p class="text-center text-white">© 2024 Vaibhav Randad. All rights reserved.
    </p>
  </footer>
  

</body>
</html>	