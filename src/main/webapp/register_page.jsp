<%@page import="Util.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registeration</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<%@ include file="navbar.jsp" %>


<main class="d-flex align-items-center primary-background" style="height: 140vh">
	<div class="container">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-header text-center primary-background text-white">
				
					<span class="fa fa-user-circle fa-3x"></span>
					<br>
					<p>Register here</p>
							
				</div>
				
				<% Message m1=(Message)session.getAttribute("msg"); 
					if(m1!=null)
					{
						%>
						<div class="alert <%=m1.getCssClass()%>"role="alert">
						<%=m1.getContent() %>
						</div>
			
						<%session.removeAttribute("msg");
						
						}
						%>
				
				<div class="card-body">
					<form id="reg-form" action="RegisterServlet" method="post">
						<div class="form-group">
					    <label for="user_name">User Name</label>
					    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter username">
					  	</div>
						
						
					  <div class="form-group">
					    <label for="exampleInputEmail1">Email address</label>
					    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
					    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					  </div>
					  
					  <div class="form-group">
					    <label for="exampleInputPassword1">Password</label>
					    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
					  </div>
					  
					  <div class="form-group">
					    <label for="gender">Select gender</label>
					    <br>
					    <input type="radio" id="gender" value="male" name="gender">Male					  
					    <input type="radio" id="gender" value="female" name="gender">Female
					    
					  </div>
					  
					  <div class="form-group">
					  
					  	<textarea name ="about" class="form-control" id="" rows="5" cols="60" placeholder="Enter something about yourself"></textarea>
					  
					  
					  </div>					  
				
					  
					  <div class="form-check">
					    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
					    <label class="form-check-label" for="exampleCheck1">agree terms & condition</label>
					  </div>
					  <br>
					  
					  <button id="submit-button" type="submit" class="btn btn-primary">Submit</button>
					</form>
					
				</div>
				
				<div class="card-footer">
				
				
				</div>
				
			</div>
			
		</div>
		
	</div>

</main>


</body>
</html>