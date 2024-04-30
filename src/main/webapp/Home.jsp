<%@page import="Model.ExpenseDAO"%>
<%@page import="Controller.ExpenseServlet"%>
<%@page import="Model.ExpenseDTO"%>
<%@page import="Util.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/basic.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<!-- navbar -->
<%@include file="navbar_afterLogin.jsp" %>

<div id="content-placeholder" class="container-fluid p-0 m-0">

<main class="primary-background p-5">

	<div class="container">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-header text-center primary-background text-white">
					<h1>Expense Manager</h1>
				</div>
				<%
					Message m=(Message)session.getAttribute("msg");
					if(m!=null)
					{
					%>
						<div class="alert <%=m.getCssClass() %>" role="alert">
						<%= m.getContent() %>
						</div>
						<% 
						session.removeAttribute("msg");	
					}					
					%>

			<div class="button-container d-flex justify-content-center align-item-center" style="margin-top: 20px;">
				<button type="button" class="btn btn-success" style="padding: 15px 30px; font-size: 25px;"><a style="text-decoration: none; color: white;" href="AddIncome.jsp">Add Income</a></button>
				<button type="button" class="btn btn-danger" style="padding: 15px 30px; font-size: 25px; margin-left: 20px;"><a style="text-decoration: none; color: white;" href="AddExpense.jsp">Add Expense</a></button>
			</div>

			<div class="button-container" align="center" style="margin-top: 20px;">

				<form action="transaction" method="post">
   					 <button type="submit" class="btn btn-primary" style="padding: 15px 30px; font-size: 25px;">Transaction</button>
    
				</form>
			</div>
			<br>

			<div align="center" style="margin-bottom: 20px;">
			<table border="1" style="padding: 5px">
			<tr>
				<th>Total Income</th>
				<th>Total Expense</th>
				<th>Balance</th>
			</tr>

			<tr>
			
<% 
ExpenseDTO dto=(ExpenseDTO)request.getAttribute("DATA"); %>
<%if(dto!=null){ %>
<td ><%=dto.getTotalIncome() %></td>
<td ><%=dto.getTotalExpense() %></td>
<td ><%=dto.getBalance() %></td>


<%} else { %>
<td>0</td>
<td>0</td>
<td>0</td>

<%} %>

</tr>	
</table>

</div>

</div>
					
		</div>
		
	</div>
</main>


    <!-- Content will be loaded here -->
</div>

<script>
$(document).ready(function(){
    // Handle click event for "Home" nav tab
    $('body').on('click', '.nav-link', function(e){
        e.preventDefault();
        $('#content-placeholder').load('Home.jsp');
    });
});
</script>



</body>
</html>