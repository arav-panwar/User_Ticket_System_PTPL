<!DOCTYPE html>
<html>
<head>

<title>Login</title>

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

<div class="card shadow login-card p-4 text-center">

<h3 class="mb-4">Select Login Type</h3>

<!-- USER LOGIN -->
<a href="user_login.jsp" class="btn btn-primary w-100 mb-3">
Login as User
</a>

<!-- ADMIN LOGIN -->
<a href="admin_login.jsp" class="btn btn-danger w-100 mb-3">
Login as Admin
</a>

<hr>

<p class="mb-2">New User?</p>

<a href="register.jsp" class="btn btn-outline-primary w-100">
Create Account
</a>

</div>

</body>
</html>