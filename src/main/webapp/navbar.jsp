<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nabvar</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<div>
<%
    HttpSession session2 = request.getSession(false); // Retrieve the session
    boolean loggedIn = session2 != null && session2.getAttribute("currentUser") != null; // Check if user is logged in
    String loginMsg = request.getParameter("msg"); // Get the message from the query parameter
%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Expenso</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <% if (loggedIn) { %> <!-- Check if user is logged in -->
            <a class="nav-link" href="Home.jsp"> <span class="fa fa-desktop"></span> Home <span class="sr-only">(current)</span></a>
        <% } else { %> <!-- If user is not logged in, redirect to login page with message -->
            <a class="nav-link" href="login_page.jsp?msg=Login+first"> <span class="fa fa-desktop"></span> Home <span class="sr-only">(current)</span></a>
        <% } %>
      </li>
      
      <li class="nav-item dropdown">
        <label class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false">
          	<span class="fa fa-folder-open-o"></span> Categories
        </label>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Add Income</a>
          <a class="dropdown-item" href="#">Add Expense</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Check Transaction</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-envelope"></span> Contact</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus	"></span> Sign up</a>
      </li>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
      
    </form>
  </div>
</nav>

</div>

<!-- Display the login message if it exists -->
<% if (loginMsg != null && !loginMsg.isEmpty()) { %>
    <div class="alert alert-danger alert-dismissible --bs-danger-border-subtle
    " role="alert">
        <%= loginMsg %>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
<% } %>

</body>
</html>
