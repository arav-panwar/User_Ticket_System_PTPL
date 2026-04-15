<%@ page import="java.util.*,com.support.system.dao.*,com.support.system.model.*" %>

<%
String idParam=request.getParameter("id");

if(idParam==null){
response.sendRedirect("mytickets.jsp");
return;
}

int ticketId=Integer.parseInt(idParam);

TicketDAO dao=new TicketDAO();
Ticket ticket=null;

for(Ticket t:dao.getAllTickets()){
if(t.getId()==ticketId){
ticket=t;
break;
}
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Ticket Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">

</head>

<body>

<div class="navbar">
Ticket Details
<a href="mytickets.jsp">Back</a>
</div>

<div class="container">

<div class="card">

<h2>Ticket Information</h2>

<p><b>Ticket Number:</b> <%=ticket.getTicketNumber()%></p>

<p><b>Subject:</b> <%=ticket.getSubject()%></p>

<p><b>Description:</b> <%=ticket.getDescription()%></p>

<p><b>Status:</b> <%=ticket.getStatus()%></p>

<p><b>Created At:</b> <%=ticket.getCreatedAt()%></p>

</div>

</div>

</body>
</html>