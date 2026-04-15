<%@ page import="java.util.*,com.support.system.model.Ticket" %>

<%
List<Ticket> tickets=(List<Ticket>)request.getAttribute("tickets");

int total=0;
int open=0;
int progress=0;
int resolved=0;

if(tickets!=null){
for(Ticket t:tickets){

total++;

String status=t.getStatus();

if(status==null || status.equalsIgnoreCase("Open")){
open++;
}
else if(status.equalsIgnoreCase("In Progress")){
progress++;
}
else if(status.equalsIgnoreCase("Resolved")){
resolved++;
}

}
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

</head>

<body>

<nav class="navbar navbar-dark bg-dark px-4">

<span class="navbar-brand">Admin Dashboard</span>

<a class="btn btn-danger btn-sm" href="LogoutServlet">Logout</a>

</nav>


<div class="container mt-4">


<!-- Dashboard Stats -->

<div class="row mb-4">

<div class="col-md-3">
<div class="card text-center shadow p-3">
<h5>Total Tickets</h5>
<h3><%=total%></h3>
</div>
</div>

<div class="col-md-3">
<div class="card text-center shadow p-3">
<h5>Open</h5>
<h3 class="text-primary"><%=open%></h3>
</div>
</div>

<div class="col-md-3">
<div class="card text-center shadow p-3">
<h5>In Progress</h5>
<h3 class="text-warning"><%=progress%></h3>
</div>
</div>

<div class="col-md-3">
<div class="card text-center shadow p-3">
<h5>Resolved</h5>
<h3 class="text-success"><%=resolved%></h3>
</div>
</div>

</div>


<!-- Ticket Table -->

<div class="card shadow p-4">

<h3 class="mb-4">All Tickets</h3>

<table class="table table-striped table-hover table-bordered">

<thead class="table-dark">

<tr>
<th>Ticket No</th>
<th>User ID</th>
<th>Subject</th>
<th>Status</th>
<th>Action</th>
</tr>

</thead>

<tbody>

<%
if(tickets!=null){
for(Ticket t:tickets){

String status=t.getStatus();
if(status==null) status="Open";
%>

<tr>

<td><%=t.getTicketNumber()%></td>
<td><%=t.getUserId()%></td>
<td><%=t.getSubject()%></td>

<td>

<%
if(status.equalsIgnoreCase("Open")){
%>
<span class="badge bg-primary">Open</span>
<%
}else if(status.equalsIgnoreCase("In Progress")){
%>
<span class="badge bg-warning text-dark">In Progress</span>
<%
}else if(status.equalsIgnoreCase("Resolved")){
%>
<span class="badge bg-success">Resolved</span>
<%
}else{
%>
<span class="badge bg-secondary"><%=status%></span>
<%
}
%>

</td>

<td>

<a class="btn btn-info btn-sm"
href="ticket_details.jsp?id=<%=t.getId()%>">View</a>

<a class="btn btn-warning btn-sm"
href="update_ticket.jsp?id=<%=t.getId()%>">Update</a>

<form action="UpdateTicketServlet" method="post" style="display:inline">

<input type="hidden" name="id" value="<%=t.getId()%>">
<input type="hidden" name="delete" value="true">

<button class="btn btn-danger btn-sm">Delete</button>

</form>

</td>

</tr>

<%
}
}
%>

</tbody>

</table>

</div>

</div>

</body>
</html>