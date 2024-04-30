<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/basic.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Add Expense</title>

</head>
<body>

<%@include file="navbar_afterLogin.jsp" %>

<main class="primary-background p-5">
	<div class="container">
		<div class="col-md-6 offset-md-3">
			<div class="card">
			    <div class="card-header primary-background text-center text-white">
  					<h1>Add Expense</h1>    
  				 </div>
  				 
  			<div class="card-body ">
  			    <form action="addExpense" method="post">
      				<div class="form-group" style="font-size: 20px;">
       					 <label for="income">Expense:</label>
       					 <input type="text" class="form-control" required="required" name="expenseAmount" placeholder="Enter Expense Amount" aria-label="Username" aria-describedby="basic-addon1">		 
			        </div>
			        
     				 <div class="form-group" style="font-size: 20px;">
        				<label for="category">Category:</label>
        				<br>
        				<select name="expensecategory" required="required">
          				<option name="expensecategory" value="Travelling">Travelling</option>
          				<option name="expensecategory" value="Cable TV">Cable TV</option>
          				<option name="expensecategory" value="Card Fee">Card Fee</option>
          				<option name="expensecategory" value="Cloths">Cloths</option>
          				<option name="expensecategory" value="Education">Education</option>
          				<option name="expensecategory" value="Electricity">Electricity</option>
          				<option name="expensecategory" value="EMI">EMI</option>
          				<option name="expensecategory" value="Entertainment">Entertainment</option>
          				<option name="expensecategory" value="Fast Food">Fast Food</option>
          				<option name="expensecategory" value="Festival">Festival</option>
          				<option name="expensecategory" value="Fitness">Fitness</option>
          				<option name="expensecategory" value="Gas">Gas</option>
          				<option name="expensecategory" value="Gifts">Gifts</option>
          				<option name="expensecategory" value="Groceries">Groceries</option>
          				<option name="expensecategory" value="Health">Health</option>
          				<option name="expensecategory" value="Household Expense">Household Expense</option>
          				<option name="expensecategory" value="Internet">Internet</option>
          				<option name="expensecategory" value="Laundry">Laundry</option>
          				<option name="expensecategory" value="Medicine">Medicine</option>
          				<option name="expensecategory" value="Rent">Rent</option>
          				<option name="expensecategory" value="Shopping">Shopping</option>
        				</select>
      				</div>
      
      				<div class="form-group" style="font-size: 20px;">
        				<label for="payment-mode">Payment Mode:</label>
        
        				<div class="disp">
        
                			<input type="radio" name="expenseType" value="Bank"><span>Bank</span>
       
                			<input type="radio" name="expenseType" value="Card"><span>Card</span>
        
               				<input type="radio" name="expenseType" value="Cash"><span>Cash</span>
        
                			<input type="radio" name="expenseType" value="Other"><span>Other</span>
        
        				</div>
                
      				</div>
      
      				<div class="form-group" style="font-size: 20px;">
        				<label for="Note">Note:</label>
         				<input type="text" class="form-control" name="expenseNote" placeholder="Add Note" aria-label="Username" aria-describedby="basic-addon1">		 
         				
     				</div>
      
      				<div class="form-group" style="font-size: 20px;">
         			<label for="Date">Date:</label>
         			<input type="date" name="expenseDate" placeholder="Enter Date" required="required">
      				</div>
      
      				<div class="form-group" style="font-size: 20px;">
         			<label for="Time">Time:</label>
         			<input type="time" name="expenseTime" placeholder="Enter Time">
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