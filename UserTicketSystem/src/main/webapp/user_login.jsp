<!DOCTYPE html>
<html>
<head>

<title>User Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
background:#f4f6f9;
height:100vh;
display:flex;
align-items:center;
justify-content:center;
}

.login-card{
width:420px;
}

</style>

</head>

<body>

<div class="card shadow login-card p-4">

<h3 class="text-center mb-4">User Login</h3>

<form action="LoginServlet" method="post">

<input type="hidden" name="role" value="USER">

<div class="mb-3">
<label class="form-label">Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label class="form-label">Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<div class="d-grid mb-3">
<button class="btn btn-primary">Login</button>
</div>

</form>

<div class="text-center">

<p class="mb-2">Don't have an account?</p>

<a href="register.jsp" class="btn btn-outline-primary w-100">
Create Account
</a>

</div>

</div>

</body>
</html>