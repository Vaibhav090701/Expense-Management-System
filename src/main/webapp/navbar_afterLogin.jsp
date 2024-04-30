<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Expenso</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
        <a class="nav-link" href="Home.jsp"><span class="fa fa-desktop"></span> Home <span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item dropdown">
        <label class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-expanded="false">
          	<span class="fa fa-folder-open-o"></span> Categories
        </label>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Add Income</a>
          <a class="dropdown-item" href="#">Add Expense</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Show Transactions</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="contact.jsp"><span class="fa fa-envelope"></span> Contact</a>
      </li>
            
    </ul>
    
    <ul class="navbar-nav mr-right">
        
      <li class="nav-item">
 	       <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
      </li>
    
    </ul>
    
    
      </div>
</nav>

<!-- end of navbar -->


</body>
</html>
