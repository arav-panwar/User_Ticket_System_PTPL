<%@ page import="com.support.system.model.User" %>
<%@ page import="java.util.*,com.support.system.dao.TicketDAO,com.support.system.model.*" %>

<%
User user=(User)session.getAttribute("user");

if(user==null){
response.sendRedirect("login.jsp");
return;
}

// Fetch tickets
TicketDAO dao = new TicketDAO();
List<Ticket> tickets = dao.getUserTickets(user.getId());
%>

<!DOCTYPE html>
<html>
<head>

<title>User Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="navbar">

<h2>Welcome <%=user.getName()%></h2>

<a href="CreateTicketServlet">Create Ticket</a>
<a href="mytickets.jsp">My Tickets</a>
<a href="profile.jsp">Profile</a>
<a href="LogoutServlet">Logout</a>

</div>

<div class="container mt-4">

<div class="card p-4 text-center">

<h2>User Dashboard</h2>
<p class="text-muted">Manage your support tickets</p>

<hr>

<%
if(tickets.size()==0){
%>

<!-- EMPTY STATE -->
<div class="mt-4">

<h5>No tickets yet</h5>
<p class="text-muted">Create your first support ticket to get started</p>

<a href="CreateTicketServlet" class="btn btn-primary px-4 mt-2">
Create Ticket
</a>

</div>

<%
} else {
%>

<!-- RECENT TICKETS -->
<h4 class="mt-4 text-start">Recent Tickets</h4>

<table class="table table-hover mt-3 text-start">

<tr>
<th>Ticket No</th>
<th>Subject</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
for(Ticket t : tickets){
%>

<tr>
<td><%=t.getTicketNumber()%></td>
<td><%=t.getSubject()%></td>

<td>
<span class="badge 
<%= "Open".equalsIgnoreCase(t.getStatus()) ? "bg-danger" :
     "In Progress".equalsIgnoreCase(t.getStatus()) ? "bg-warning text-dark" :
     "bg-success" %>">
<%=t.getStatus()%>
</span>
</td>

<td>
<a class="btn btn-sm btn-outline-primary"
href="ticket_details.jsp?id=<%=t.getId()%>">View</a>
</td>

</tr>

<%
}
%>

</table>

<%
}
%>

<hr>

<!-- USER INFO -->
<div class="text-start mt-3">
<p><strong>Email:</strong> <%=user.getEmail()%></p>
<p><strong>Role:</strong> <%=user.getRole()%></p>
</div>

</div>

</div>

</body>
</html>