<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/basic.css" rel="stylesheet" type="text/css"/>
<meta charset="UTF-8">
<title>Add Income</title>
</head>
<body>

<%@ include file="navbar_afterLogin.jsp" %>

  <main class="primary-background p-5">
  <div class="container">
  
  <div class="col-md-6 offset-md-3">
  
  <div class="card">
    <div class="card-header primary-background text-center text-white">
  			<h1>Add Income</h1>    
   </div>
   		
   	<div class="card-body ">
   
    <form action="addIncome" method="post" >
      <div class="form-group " style="font-size: 20px;">
        <label for="income">Income:</label>
        <input type="text" class="form-control" name="incomeAmount" placeholder="10000" aria-label="Enter Income Amount" aria-describedby="basic-addon1" required="required">
        
      </div>
      <div class="form-group" style="font-size: 20px;">
        <label for="category">Category:</label>
        <br>
        <select name="incomecategory" style="width: 100%;" required="required">
          <option name="incomecategory" value="Allowance">Allowance</option>
          <option name="incomecategory" value="Bonus">Bonus</option>
          <option name="incomecategory" value="Business">Business</option>
          <option name="incomecategory" value="Pension">Pension</option>
          <option name="incomecategory" value="Salary">Salary</option>
          <option name="incomecategory" value="Other">Other</option>
          
        </select>
      </div>
      
      <div class="form-group" style="font-size: 20px;">
        <label for="payment-mode">Payment Mode:</label>
        
        <div class="disp">
                <input type="radio" name="incomeType" value="Bank"><span>Bank</span>
                <input type="radio" name="incomeType" value="Card"><span>Card</span>
                <input type="radio" name="incomeType" value="Cash"><span>Cash</span>
                <input type="radio" name="incomeType" value="Other"><span>Other</span>
        </div>
                
      </div>
      
      <div class="form-group" style="font-size: 20px;">
         <label for="Note">Note:</label>
         <input type="text" class="form-control" name="incomeNote" placeholder="Add Note" aria-label="Note" aria-describedby="basic-addon1">
         
      </div>
      
      <div class="form-group" style="font-size: 20px;">
      
         <label for="Date">Date:</label>
         <input type="date" name="incomeDate" required>
      </div>
      
      <div class="form-group" style="font-size: 20px;">
         <label for="Time">Time:</label>
         <input type="time" name="incomeTime" placeholder="Enter Time">
      </div>
      
      <div class="container text-center">
		<button type="submit" class="btn btn-primary">Submit</button>
			
	  </div>
      
    </form>
    </div>
  </div>
    </div>
  </div>
    </main>
  

</body>
</html>