<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login/SignUp</title>
    <link rel="stylesheet" href="./resources/css/se.css">
	<style>
		#Error{
			font-size: medium;
			color: red;
		}
		#Message{
			font-size: medium;
			color: red;
		}
	</style>
</head>
<body>
    

<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="RegisterServlet" method="post" onsubmit="return validate()">
			<h1>Create Account</h1>
			<%  String message=(String)request.getAttribute("error");
			     if(message!=null){
			%>
			<span id="Error" ><%= message%></span>
			
			<% }
				else{
			%>
			<br>
			<% } %>
			<!-- <div class="wrapper-class">
				<input type="radio" id="radio1" name="UserType" value="Admin">
				<label for="radio1">Admin   </label><input type="radio" id="radio2" name="UserType" value="User">
				<label for="radio2">  User</label>
			  </div>     -->
			<input type="text" placeholder="Name" name="username"  required />
			<input type="text" placeholder="Email" name="email" required  />
			<input type="text" placeholder="Phone Number" name="phnumber"  required />
			<input type="password" placeholder="Password" name="pass"  id="pass"  required/>
			<input type="password" placeholder="Confirm Password" name="confirmpass" id="pass2"  required />
			<span id="message"></span>
			<button type="submit">Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="LoginServlet" method="post">
			<h1>Sign in</h1>
			
			<%  String Message=(String)request.getAttribute("Error");
			     if(Message!=null){
			%>
			<span id="Error" ><%= Message%></span>
			
			<% }
				else{
			%>
			<br>
			<% } %>
			<div class="wrapper-class">
				<input type="radio" id="radio1" name="UserType" value="Admin">
				<label for="radio1">Admin   </label><input type="radio" id="radio2" name="UserType" value="User">
				<label for="radio2">  User</label>
			  </div>    
			
			<input type="text" name="inputUserId" placeholder="User-Name" />
			<input type="password" name="inputPassword" placeholder="Password" />
			<a href="forgotPassword.jsp">Forgot your password?</a>
			<button type="submit">Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>To keep connected with us please login with your personal info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, FOLKS!</h1>
				<p>Enter your personal details and start journey with us</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

<!-- <footer>
	<p>
		Created with <i class="fa fa-heart"></i> by
		<a target="_blank" href="https://florin-pop.com">Florin Pop</a>
		- Read how I created this and how you can join the challenge
		<a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
	</p>
</footer> -->
<script src="./resources/script/script.js"></script>
</body>
</html>