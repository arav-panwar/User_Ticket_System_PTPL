<%@ page import="com.support.system.model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
response.sendRedirect("login.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Create Ticket</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="navbar">

<div><strong>Create Ticket</strong></div>

<div>
<a href="user_home.jsp">Dashboard</a>
<a href="mytickets.jsp">My Tickets</a>
</div>

</div>

<div class="container">

<div class="card form-box">

<h2 class="mb-4">Create Support Ticket</h2>

<form action="CreateTicketServlet" method="post">

<div class="mb-3">
<label class="form-label">Subject Type</label>
<select name="subject" class="form-select" required>

<option value="">Select Subject</option>
<option value="Billing Issue">Billing Issue</option>
<option value="Login Issue">Login Issue</option>
<option value="Technical Bug">Technical Bug</option>
<option value="Feature Request">Feature Request</option>

</select>
</div>





<div class="mb-3">
<label class="form-label">Description</label>
<textarea name="description" class="form-control" rows="4" required></textarea>
</div>

<button class="btn btn-primary">Submit Ticket</button>

</form>

</div>

</div>

</body>
</html>