<%@ page import="java.util.*,com.support.system.dao.*,com.support.system.model.*" %>

<%
User user=(User)session.getAttribute("user");

if(user==null){
response.sendRedirect("login.jsp");
return;
}

TicketDAO dao=new TicketDAO();
List<Ticket> tickets=dao.getUserTickets(user.getId());
%>

<!DOCTYPE html>
<html>
<head>

<title>My Tickets</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="navbar">
My Tickets
<a href="user_home.jsp">Dashboard</a>
</div>

<div class="container">

<div class="card">

<h2>Your Tickets</h2>

<a class="btn" href="CreateTicketServlet">Create Ticket</a>

<br><br>

<table>

<tr>
<th>Ticket No</th>
<th>Subject</th>
<th>Priority</th>
<th>Status</th>
<th>Created</th>
<th>Action</th>
</tr>

<%
for(Ticket t:tickets){
%>

<tr>

<td><%=t.getTicketNumber()%></td>
<td><%=t.getSubject()%></td>
<td><%=t.getPriority()%></td>
<td><%=t.getStatus()==null?"Open":t.getStatus()%></td>
<td><%=t.getCreatedAt()%></td>


<td>

<a class="btn"
href="ticket_details.jsp?id=<%=t.getId()%>">View</a>

</td>

</tr>

<%
}
%>

</table>

</div>

</div>

</body>
</html>