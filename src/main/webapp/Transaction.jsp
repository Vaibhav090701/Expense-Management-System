<%@page import="com.mysql.cj.protocol.SocksProxySocketFactory"%>
<%@page import="Model.ExpenseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/basic.css" rel="stylesheet">
</head>
<body>

<%@include file="navbar_afterLogin.jsp" %>

<main class="primary-background p-5">

	<div class="container">
	
			<div class="card">
				<div class="card-header text-center primary-background text-white">
					<h1 >Transactions</h1>
				</div>
				
				<form action="dateWiseTransaction" method="post" style="margin: 10px;">
				<label>From</label>
				<input type="date"  name="startDate" aria-label="Username" aria-describedby="basic-addon1">		 
				
				<label style="margin-left: 10px;" >To</label>
				<input type="date"  name="endDate" aria-label="Username" aria-describedby="basic-addon1">		 
				
				<button type="submit" name="transactionDate" class="btn btn-primary" style="margin-left: 10px;">Submit</button>
				
				</form>

				<% Object data2=request.getAttribute("DATA"); 
   				ArrayList<ExpenseDTO>display2=(ArrayList<ExpenseDTO>)data2;
   				int i=1;
				%>

				<table class="table table-striped">
								<tr class="primary-background text-white">
		<th >Id</th>
		<th>Income</th>
		<th>Expanse</th>
		<th>Category</th>
		<th>Payment Mode</th>
		<th>Note</th>
		<th>Data</th>
		<th>Time</th>
		<th>Total Income</th>
		<th>Total Expense</th>
		<th>Balance</th>
	</tr>
	
	<% if(display2!=null)
		{
		for(ExpenseDTO displayData:display2){ %>
	<tr>
	<td><%=i%></td>
		<td><%=displayData.getIncome()%></td>
		<td><%=displayData.getExpense()%></td>
		<td><%=displayData.getCategory()%></td>
		<td><%=displayData.getPaymentMethod()%></td>
		<td><%=displayData.getNote()%></td>
		<td><%=displayData.getPaymentDate()%></td>
		<td><%=displayData.getPaymentTime()%></td>
		<td><%=displayData.getTotalIncome()%></td>
		<td><%=displayData.getTotalExpense()%></td>
		<td><%=displayData.getBalance()%></td>
	<tr>
	<% }i++;
	}else{
	 Object data=request.getAttribute("DisplayAllTransaction");
	 ArrayList<ExpenseDTO> display=(ArrayList<ExpenseDTO>)data;
	 for(ExpenseDTO displayData:display)
	 {
	%>
	<tr>
		<td><%=i%></td>
		<td><%=displayData.getIncome() %></td>
		<td><%=displayData.getExpense() %></td>
		<td><%=displayData.getPaymentMethod() %></td>
		<td><%=displayData.getCategory() %></td>
		<td><%=displayData.getNote() %></td>
		<td><%=displayData.getPaymentDate() %></td>
		<td><%=displayData.getPaymentTime() %></td>
		<td><%=displayData.getTotalIncome() %></td>
		<td><%=displayData.getTotalExpense() %></td>
		<td><%=displayData.getBalance() %></td>
		<%i++; %>
	<tr>
	<%} 
	 }%>
	  	
</table>
				
				
			</div>
		</div>
</main>	



</body>
</html>