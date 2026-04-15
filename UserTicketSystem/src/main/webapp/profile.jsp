<%@ page import="com.support.system.model.User" %>

<%
User user=(User)session.getAttribute("user");

if(user==null){
response.sendRedirect("login.jsp");
return;
}
%>

<!DOCTYPE html>
<html>

<head>

<title>User Profile</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body style="background:#f4f6f9;">


<nav class="navbar navbar-dark bg-dark px-4">

<span class="navbar-brand">User Profile</span>

<div>

<a href="user_home.jsp" class="btn btn-light btn-sm">Dashboard</a>

<a href="mytickets.jsp" class="btn btn-light btn-sm">My Tickets</a>

<a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>

</div>

</nav>


<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-6">

<div class="card shadow p-4">

<h3 class="text-center mb-4">Edit Profile</h3>

<form action="UpdateProfileServlet" method="post">


<div class="mb-3">

<label class="form-label">Name</label>

<input type="text"
name="name"
class="form-control"
value="<%=user.getName()%>"
required>

</div>


<div class="mb-3">

<label class="form-label">Email</label>

<input type="email"
name="email"
class="form-control"
value="<%=user.getEmail()%>"
required>

</div>


<div class="mb-3">

<label class="form-label">Password</label>

<input type="password"
name="password"
class="form-control"
value="<%=user.getPassword()%>"
required>

</div>


<div class="d-grid">

<button class="btn btn-primary">Update Profile</button>

</div>

</form>

</div>

</div>

</div>

</div>

</body>
</html>